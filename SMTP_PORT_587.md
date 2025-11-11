# SMTP Port 587 Configuration

## Correct Settings for Port 587

When using port 587, make sure:

```
Protocol: smtp  (NOT smtps!)
Host: smtp.hostinger.com
Port: 587
IgnoreTLS: OFF (disabled)
Pool: ON (enabled)
Username: info@aurasky.cloud
Password: [your mailbox password]
From Email: info@aurasky.cloud
```

## Critical: Protocol Must Match Port

- Port 465 → Protocol: `smtps` (SSL/TLS implicit)
- Port 587 → Protocol: `smtp` (STARTTLS)

If you're using port 587 but protocol is still `smtps`, it won't work!

## Next Steps

1. **Verify Protocol**: Make sure it's `smtp` (not `smtps`) for port 587
2. **Check Logs**: Look for SMTP connection errors
3. **Test Again**: Click "Send a test mail to my user"
4. **Check Spam Folder**: Sometimes test emails go to spam

## If Still Not Working

Check Rocket.Chat logs in admin UI:
- Administration > View Logs
- Filter for "SMTP" or "email"
- Look for specific error messages

Common errors:
- "Connection timeout" → Railway firewall blocking SMTP
- "Authentication failed" → Wrong password
- "Connection refused" → Wrong host/port

