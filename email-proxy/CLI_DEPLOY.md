# Email Proxy Service - Railway CLI Deployment

## Quick Deploy Commands

### 1. Link to Railway Project (if not already linked)

```bash
cd /Users/fidelis/Dev/rocket-chat
railway link
# Select: rocketchat project
```

### 2. Create Email Proxy Service

```bash
cd email-proxy
railway add --service email-proxy
```

### 3. Set Environment Variables

```bash
railway variables --service email-proxy --set "RESEND_API_KEY=re_iem8ivqw_GRGKVwbuNnnXgdo3QcWDcKWb"
railway variables --service email-proxy --set "MAIL_FROM_ADDRESS=info@aurasky.cloud"
railway variables --service email-proxy --set "PORT=587"
```

### 4. Deploy Service

```bash
railway up --service email-proxy
```

### 5. Verify Deployment

```bash
railway logs --service email-proxy
# Should see: "SMTP Proxy Server listening on port 587"
```

## Alternative: Railway Dashboard

If CLI prompts are problematic, use Railway dashboard:

1. Go to: https://railway.com/project/0f94d11d-c56d-44be-a7a5-b5d69bf307aa
2. Click **"+ New"** → **"Empty Service"**
3. Name: `email-proxy`
4. Settings:
   - **Root Directory**: `email-proxy/`
   - **Dockerfile Path**: `Dockerfile` (auto-detected)
5. Variables tab → Add:
   - `RESEND_API_KEY=re_iem8ivqw_GRGKVwbuNnnXgdo3QcWDcKWb`
   - `MAIL_FROM_ADDRESS=info@aurasky.cloud`
   - `PORT=587`
6. Deploy → Service will auto-deploy

## Configure Rocket.Chat

After email-proxy is deployed:

1. Rocket.Chat Admin UI → **Email** → **SMTP**
2. Settings:
   - **Protocol**: `smtp`
   - **Host**: `email-proxy` ← Railway service name
   - **Port**: `587`
   - **IgnoreTLS**: OFF
   - **Pool**: ON
   - **Username**: (any value or leave empty)
   - **Password**: (any value or leave empty)
   - **From Email**: `info@aurasky.cloud`
3. Save and test email

## Status Check

```bash
# Check service status
railway status --service email-proxy

# View logs
railway logs --service email-proxy

# Check variables
railway variables --service email-proxy
```

