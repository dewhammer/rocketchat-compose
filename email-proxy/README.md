# SMTP to Resend API Proxy Service

## What This Does

This service acts as an SMTP proxy that:
- Accepts SMTP connections from Rocket.Chat (internal Railway networking)
- Converts SMTP requests to Resend API calls (HTTPS)
- Works on Railway because HTTP/HTTPS isn't blocked

## Architecture

```
Rocket.Chat → SMTP Proxy (port 587) → Resend API (HTTPS)
```

## Deployment Steps

### 1. Create Email Proxy Service in Railway

1. In Railway dashboard, create new service: `email-proxy`
2. Connect to this repository
3. Set root directory to `email-proxy/`
4. Railway will auto-detect Dockerfile

### 2. Set Environment Variables

In Railway → `email-proxy` service → Variables:

```
RESEND_API_KEY=re_iem8ivqw_GRGKVwbuNnnXgdo3QcWDcKWb
MAIL_FROM_ADDRESS=info@aurasky.cloud
PORT=587
```

### 3. Configure Rocket.Chat to Use Proxy

In Rocket.Chat admin UI → Email → SMTP:

```
Protocol: smtp
Host: email-proxy  (Railway service name - uses internal networking)
Port: 587
IgnoreTLS: OFF
Pool: ON
Username: (leave empty or any value)
Password: (leave empty or any value)
From Email: info@aurasky.cloud
```

**Important**: Use the Railway service name `email-proxy` as the host, not an external domain. Railway services can discover each other via service names.

### 4. Deploy Both Services

- Deploy `email-proxy` service
- Redeploy `rocketchat-compose` service
- Rocket.Chat will connect to proxy via Railway internal networking

## How It Works

1. Rocket.Chat sends email via SMTP to `email-proxy:587`
2. Proxy receives SMTP request (internal Railway network)
3. Proxy converts to Resend API call (HTTPS - not blocked)
4. Resend sends email

## Testing

After deployment:
1. Test email from Rocket.Chat admin UI
2. Check Resend dashboard for sent emails
3. Check Rocket.Chat logs for connection status

## Troubleshooting

- **Connection refused**: Ensure `email-proxy` service is deployed and running
- **No emails in Resend**: Check `RESEND_API_KEY` is correct
- **SMTP auth errors**: Proxy doesn't require auth (internal network)

