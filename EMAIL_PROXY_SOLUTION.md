# Email Proxy Solution - Complete Guide

## Problem Solved

Railway blocks SMTP on Hobby/Free plans, but Rocket.Chat only supports SMTP. This proxy service bridges the gap by:
- Accepting SMTP connections from Rocket.Chat (internal Railway network)
- Converting to Resend API calls (HTTPS - not blocked)
- Works on any Railway plan!

## Solution Architecture

```
Rocket.Chat → email-proxy:587 (SMTP, internal) → Resend API (HTTPS)
```

## Files Created

- `email-proxy/Dockerfile` - Container definition
- `email-proxy/server.js` - SMTP proxy server
- `email-proxy/package.json` - Node.js dependencies
- `email-proxy/railway.json` - Railway configuration
- `email-proxy/README.md` - Documentation
- `email-proxy/DEPLOYMENT.md` - Deployment guide

## Deployment Steps

### 1. Deploy Email Proxy Service

In Railway dashboard:
1. Create new service: `email-proxy`
2. Connect to this repository
3. Set root directory: `email-proxy/`
4. Railway will auto-detect Dockerfile

### 2. Set Environment Variables

In Railway → `email-proxy` service → Variables:

```
RESEND_API_KEY=YOUR_RESEND_API_KEY_HERE
MAIL_FROM_ADDRESS=info@aurasky.cloud
PORT=587
```

### 3. Configure Rocket.Chat SMTP

In Rocket.Chat admin UI → Email → SMTP:

```
Protocol: smtp
Host: email-proxy  ← Railway service name (internal networking)
Port: 587
IgnoreTLS: OFF
Pool: ON
Username: (any value or leave empty)
Password: (any value or leave empty)
From Email: info@aurasky.cloud
```

**Critical**: Use `email-proxy` (Railway service name) as the host!

### 4. Deploy & Test

1. Deploy `email-proxy` service
2. Wait for it to be running
3. Redeploy `rocketchat-compose` service
4. Test email from Rocket.Chat admin UI
5. Check Resend dashboard for sent emails

## How It Works

1. Rocket.Chat sends email via SMTP to `email-proxy:587`
2. Proxy receives SMTP request (internal Railway network - not blocked)
3. Proxy parses email using `mailparser`
4. Proxy converts to Resend API call (HTTPS - not blocked)
5. Resend sends email

## Verification

After deployment:
- Check `email-proxy` logs: "SMTP Proxy Server listening on port 587"
- Check Rocket.Chat logs: Successful SMTP connection
- Check Resend dashboard: Sent emails appear

## Benefits

✅ Works on any Railway plan (Hobby/Free/Pro)
✅ No Railway plan upgrade needed
✅ Uses Resend API (HTTPS - not blocked)
✅ Rocket.Chat thinks it's using SMTP (no changes needed)
✅ Internal Railway networking (secure)

## Troubleshooting

- **Connection refused**: Ensure `email-proxy` service is deployed and running
- **No emails in Resend**: Check `RESEND_API_KEY` is correct
- **SMTP auth errors**: Proxy doesn't require auth (internal network)

