# Resend SMTP Configuration - Correct Settings

## Important: Resend SMTP Credentials

According to Resend documentation, the SMTP configuration should be:

```
Protocol: smtp
Host: smtp.resend.com
Port: 587
Username: resend
Password: [your Resend API key]  ← This is your API key
From Email: info@aurasky.cloud
```

**OR** some sources say:

```
Username: [your Resend API key]
Password: [leave empty or same as username]
```

## But Railway is Blocking SMTP

The real issue: Railway blocks outbound SMTP connections (ports 587, 465, 25).

## Solutions

### Option 1: Contact Railway Support
Ask Railway to:
- Enable SMTP outbound connections
- Or provide email service alternative

### Option 2: Use Resend API Directly
If Rocket.Chat supports HTTP API for email (not SMTP), configure that instead.

### Option 3: Deploy Email Proxy Service
Create a small service that:
- Accepts HTTP requests from Rocket.Chat
- Converts to Resend API calls
- Deploys on Railway (HTTP not blocked)

### Option 4: Use Different Platform for Email
- Deploy Rocket.Chat email component elsewhere
- Or use Rocket.Chat Cloud for email features

## Current Status

✅ Rocket.Chat deployed and working
✅ Domain configured
✅ MongoDB connected
❌ Email blocked by Railway firewall

## Next Steps

1. Try Resend configuration with:
   - Username: `resend`
   - Password: `YOUR_RESEND_API_KEY_HERE`

2. If still timeout, Railway is blocking SMTP
3. Contact Railway support about SMTP access
4. Or implement email proxy/workaround

