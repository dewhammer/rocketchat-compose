# Railway SMTP Blocking - Use Resend Instead

## Problem
Railway is blocking outbound SMTP connections to Hostinger's SMTP server.

## Solution: Use Resend (Free SMTP Service)

Resend provides a free SMTP service that Railway can connect to.

### Step 1: Sign up for Resend
1. Go to https://resend.com
2. Sign up (free tier available)
3. Verify your domain `aurasky.cloud`
4. Get your API key

### Step 2: Configure Rocket.Chat SMTP

In Rocket.Chat admin UI → Email → SMTP:

```
Protocol: smtp
Host: smtp.resend.com
Port: 587
IgnoreTLS: OFF
Pool: ON
Username: resend
Password: [your Resend API key]
From Email: info@aurasky.cloud
```

### Step 3: Verify Domain in Resend
- Add DNS records Resend provides
- Verify `aurasky.cloud` in Resend dashboard

## Alternative: Use SendGrid

If Resend doesn't work:

1. Sign up at https://sendgrid.com (free tier)
2. Create API key
3. Configure Rocket.Chat:
   ```
   Protocol: smtp
   Host: smtp.sendgrid.net
   Port: 587
   Username: apikey
   Password: [your SendGrid API key]
   From Email: info@aurasky.cloud
   ```

## Why This Works

Third-party SMTP services like Resend/SendGrid:
- Are designed for cloud platforms
- Have better firewall compatibility
- Provide better deliverability
- Offer free tiers

Railway can connect to these services, but blocks direct SMTP to Hostinger.

