# Rocket.Chat Email Configuration Guide

## Two Separate Configurations Needed

Rocket.Chat has TWO different email features:

1. **SMTP Settings** (Administration > Workspace > Settings > Email > SMTP)
   - Used for sending emails (notifications, verification, password reset, etc.)
   - **This is what you need to configure first**

2. **Email Inboxes** (Administration > Email inboxes)
   - Used for receiving and managing emails within Rocket.Chat
   - You've already configured this ✅

## Configure SMTP Settings

Go to: **Administration** > **Workspace** > **Settings** > **Email** > **SMTP** tab

Use these Hostinger SMTP settings:

```
Protocol: smtps (or smtp)
Host: smtp.hostinger.com
Port: 465
IgnoreTLS: OFF (disabled)
Pool: ON (enabled)
Username: info@aurasky.cloud
Password: [your mailbox password]
From Email: info@aurasky.cloud
```

## Important Notes

1. **Port 465 vs 587**: 
   - Port 465 uses SSL/TLS implicitly
   - Port 587 uses STARTTLS
   - Hostinger supports both, but 465 is more common

2. **Protocol**: 
   - Use `smtps` for port 465
   - Use `smtp` for port 587

3. **SSL/TLS**: 
   - For port 465: Use `smtps` protocol (SSL/TLS is implicit)
   - For port 587: Use `smtp` protocol with TLS enabled

## Test Configuration

After saving:
1. Click **"Send a test mail to my user"** button
2. Check your email inbox
3. Check Rocket.Chat logs if it fails

## Troubleshooting

If test email doesn't work:

1. **Check Rocket.Chat logs**:
   - Administration > View Logs
   - Look for SMTP connection errors

2. **Verify credentials**:
   - Ensure password is correct
   - Try resetting mailbox password in Hostinger

3. **Try port 587**:
   - Change port to `587`
   - Change protocol to `smtp`
   - Enable TLS (don't ignore TLS)

4. **Check firewall**:
   - Ensure Railway allows outbound SMTP connections

5. **Verify SMTP settings**:
   - Double-check `smtp.hostinger.com` is correct
   - Ensure SSL/TLS is properly configured

## Alternative: Use Port 587 with STARTTLS

If port 465 doesn't work, try:

```
Protocol: smtp
Host: smtp.hostinger.com
Port: 587
IgnoreTLS: OFF
Pool: ON
Username: info@aurasky.cloud
Password: [your mailbox password]
From Email: info@aurasky.cloud
```

This uses STARTTLS instead of implicit SSL.

