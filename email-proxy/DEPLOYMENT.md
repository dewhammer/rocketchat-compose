# Email Proxy Deployment Guide

## Quick Start

### 1. Deploy Email Proxy Service

In Railway dashboard:
1. Create new service: `email-proxy`
2. Connect to this repo
3. Set root directory: `email-proxy/`
4. Railway will auto-detect Dockerfile

### 2. Set Environment Variables

In Railway → `email-proxy` service → Variables:

```
RESEND_API_KEY=re_iem8ivqw_GRGKVwbuNnnXgdo3QcWDcKWb
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

**Critical**: Use `email-proxy` (Railway service name) as the host, not an external domain!

### 4. Deploy & Test

1. Deploy `email-proxy` service
2. Wait for it to be running
3. Redeploy `rocketchat-compose` service
4. Test email from Rocket.Chat admin UI
5. Check Resend dashboard for sent emails

## How It Works

```
Rocket.Chat (SMTP) → email-proxy:587 (internal) → Resend API (HTTPS)
```

- Rocket.Chat connects to proxy via Railway internal networking (not blocked)
- Proxy converts SMTP to Resend API calls (HTTPS - not blocked)
- Emails are sent via Resend

## Verification

After deployment, check:
1. `email-proxy` service logs: Should show "SMTP Proxy Server listening"
2. Rocket.Chat logs: Should show successful SMTP connection
3. Resend dashboard: Should show sent emails

## Troubleshooting

- **Connection refused**: Ensure `email-proxy` service is deployed and running
- **No emails in Resend**: Check `RESEND_API_KEY` is correct
- **SMTP auth errors**: Proxy doesn't require auth (internal network)

