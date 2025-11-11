# Rocket.Chat SMTP Environment Variables

Rocket.Chat can be configured via environment variables OR through the admin UI.

## Option 1: Configure via Rocket.Chat Admin UI (Recommended)

1. Access Rocket.Chat at: https://chat.aurasky.cloud
2. Go to: **Administration** > **Workspace** > **Settings** > **Email** > **SMTP** tab
3. Enter Hostinger SMTP settings:
   - Protocol: `smtps`
   - Host: `smtp.hostinger.com`
   - Port: `465`
   - Username: `info@aurasky.cloud`
   - Password: [your mailbox password]
   - From Email: `info@aurasky.cloud`

## Option 2: Configure via Environment Variables

If you prefer to set SMTP via Railway environment variables, add these:

```
SMTP_Protocol=smtps
SMTP_Host=smtp.hostinger.com
SMTP_Port=465
SMTP_Username=info@aurasky.cloud
SMTP_Password=[your mailbox password]
SMTP_From_Email=info@aurasky.cloud
SMTP_Pool=true
SMTP_IgnoreTLS=false
```

Or use MAIL_URL format:
```
MAIL_URL=smtps://info@aurasky.cloud:YOUR_MAILBOX_PASSWORD@smtp.hostinger.com:465/
```

## Which Method to Use?

- **Admin UI**: Easier to test, can change without redeploying
- **Environment Variables**: Better for infrastructure-as-code, requires redeploy

## Current Status

Since Rocket.Chat is deployed but you can't access the admin UI yet (502 error), you'll need to:

1. **First fix the 502 error** (port and MongoDB issues)
2. **Then configure SMTP** via admin UI

The 502 error needs to be fixed first before you can access Rocket.Chat's admin panel to configure email.

