# Resend SMTP Configuration for Rocket.Chat

## Rocket.Chat Admin UI Configuration

Go to: **Administration** > **Workspace** > **Settings** > **Email** > **SMTP** tab

Configure with these Resend settings:

```
Protocol: smtp
Host: smtp.resend.com
Port: 587
IgnoreTLS: OFF (disabled)
Pool: ON (enabled)
Username: resend
Password: YOUR_RESEND_API_KEY_HERE
From Email: info@aurasky.cloud
```

## Alternative: Port 465 (if 587 doesn't work)

```
Protocol: smtps
Host: smtp.resend.com
Port: 465
IgnoreTLS: OFF (disabled)
Pool: ON (enabled)
Username: resend
Password: YOUR_RESEND_API_KEY_HERE
From Email: info@aurasky.cloud
```

## Important: Verify Domain in Resend

Before emails will work, you need to:

1. Go to Resend dashboard: https://resend.com/domains
2. Add domain: `aurasky.cloud`
3. Add the DNS records Resend provides:
   - SPF record
   - DKIM records
   - DMARC record (optional)

## After Configuration

1. Save the SMTP settings
2. Click **"Send a test mail to my user"**
3. Check your email inbox
4. If it works, you're all set! ✅

## Environment Variables (Alternative)

If you prefer to set via Railway environment variables:

```
OVERWRITE_SETTING_SMTP_Host=smtp.resend.com
OVERWRITE_SETTING_SMTP_Port=587
OVERWRITE_SETTING_SMTP_Protocol=smtp
OVERWRITE_SETTING_SMTP_Username=resend
OVERWRITE_SETTING_SMTP_Password=YOUR_RESEND_API_KEY_HERE
OVERWRITE_SETTING_From_Email=info@aurasky.cloud
OVERWRITE_SETTING_SMTP_Pool=true
OVERWRITE_SETTING_SMTP_IgnoreTLS=false
```

Then Railway will auto-redeploy with these settings.

