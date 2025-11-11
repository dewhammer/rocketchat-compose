# Test Email Troubleshooting

## Issue: Testing with Same Email Address

Sending test email TO `info@aurasky.cloud` (same as FROM) can cause:
- Email loops
- Filtering issues
- Delivery problems

## Solution: Test with Different Email

### Option 1: Use Your Personal Email

1. In Rocket.Chat admin UI → Email → SMTP
2. Click **"Send a test mail to my user"**
3. This sends to YOUR Rocket.Chat user's email (not info@aurasky.cloud)
4. Check that email inbox

### Option 2: Send to External Email

1. Create a test user in Rocket.Chat with your personal email
2. Or use Rocket.Chat's Mailer feature to send to external email
3. Test sending to: your-personal-email@gmail.com (or similar)

### Option 3: Verify info@aurasky.cloud Mailbox

Make sure the mailbox is properly set up:
1. Go to Hostinger → Email → Mailboxes
2. Verify `info@aurasky.cloud` exists and is active
3. Try logging into webmail: https://webmail.hostinger.com
4. Check if you can receive emails there

## Check Rocket.Chat Logs

After sending test email, check logs for:
- SMTP connection success
- Email queued/sent confirmation
- Any delivery errors

```bash
railway logs --service rocketchat-compose | grep -i -E "(smtp|email|sent|queued)"
```

## Next Steps

1. Try sending test email to YOUR Rocket.Chat user email (different from info@aurasky.cloud)
2. Or send to an external email address
3. Check logs to see if email was actually sent
4. Verify Resend dashboard shows email activity

