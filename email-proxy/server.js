const SMTPServer = require('smtp-server').SMTPServer;
const { Resend } = require('resend');
const { simpleParser } = require('mailparser');
require('dotenv').config();

const resend = new Resend(process.env.RESEND_API_KEY);

const server = new SMTPServer({
  // Allow connections from Railway internal network
  onAuth(auth, session, callback) {
    // Accept all connections (internal Railway network)
    callback(null, { user: 'rocketchat' });
  },

  onMailFrom(address, session, callback) {
    // Store the from address
    session.mailFrom = address.address;
    callback();
  },

  onRcptTo(address, session, callback) {
    // Store recipients
    if (!session.recipients) {
      session.recipients = [];
    }
    session.recipients.push(address.address);
    callback();
  },

  onData(stream, session, callback) {
    let emailData = Buffer.alloc(0);
    
    stream.on('data', (chunk) => {
      emailData = Buffer.concat([emailData, chunk]);
    });

    stream.on('end', async () => {
      try {
        // Parse email using mailparser
        const parsed = await simpleParser(emailData);
        
        // Extract email components
        const from = session.mailFrom || parsed.from?.text || process.env.MAIL_FROM_ADDRESS || 'info@aurasky.cloud';
        const to = session.recipients.length > 0 ? session.recipients : (parsed.to ? [parsed.to.text] : []);
        const subject = parsed.subject || 'No Subject';
        const html = parsed.html || parsed.text || '';
        const text = parsed.text || '';

        console.log(`Proxying email: ${from} → ${to.join(', ')}`);

        // Send via Resend API
        const result = await resend.emails.send({
          from: from,
          to: to,
          subject: subject,
          html: html,
          text: text,
        });

        console.log('Email sent via Resend:', result.id);
        callback(null, 'Message queued');
      } catch (error) {
        console.error('Error sending email:', error);
        callback(error);
      }
    });
  },

  // Disable authentication requirement for internal Railway networking
  authMethods: [],
  
  // Allow unauthenticated connections (internal network)
  secure: false,
  
  // Allow connections from Railway internal network
  disabledCommands: ['AUTH'],
});

server.on('error', (err) => {
  console.error('SMTP Server error:', err);
});

const port = process.env.PORT || 587;
server.listen(port, '0.0.0.0', () => {
  console.log(`SMTP Proxy Server listening on port ${port}`);
  console.log('Ready to proxy emails to Resend API');
  console.log(`Resend API Key: ${process.env.RESEND_API_KEY ? 'Set' : 'Missing!'}`);
});

