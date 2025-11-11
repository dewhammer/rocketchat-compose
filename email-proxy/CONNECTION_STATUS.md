# Email Proxy Service - Connection Status

## ✅ Service Connections (Correct!)

The visual connections in Railway dashboard are correct:
- `email-proxy` → `rocketchat-compose` ✅
- `rocketchat-compose` → `MongoDB` ✅

## How Railway Internal Networking Works

Railway services in the same project can communicate using **service names as hostnames**:

- Rocket.Chat connects to email-proxy: `email-proxy:587` (internal)
- Rocket.Chat connects to MongoDB: Via `MONGO_URL` environment variable

**No explicit "linking" needed** - Railway handles internal networking automatically!

## Current Setup Status

✅ **email-proxy service created**
✅ **Service connections visible**
❌ **Environment variables need to be set**

## Required Environment Variables

Set these in Railway dashboard → `email-proxy` service → Variables:

```
RESEND_API_KEY=YOUR_RESEND_API_KEY_HERE
MAIL_FROM_ADDRESS=info@aurasky.cloud
PORT=587
```

## Next Steps

1. ✅ Service created (done)
2. ⏳ Set environment variables (in progress)
3. ⏳ Deploy service
4. ⏳ Configure Rocket.Chat SMTP to use `email-proxy` as host

## Rocket.Chat SMTP Configuration

After email-proxy is deployed, configure Rocket.Chat:

- **Host**: `email-proxy` (Railway service name - uses internal networking)
- **Port**: `587`
- **Protocol**: `smtp`

The connection will work automatically via Railway's internal network!

