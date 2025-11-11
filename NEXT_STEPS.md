# Next Steps - Post Deployment

## ✅ Deployment Successful!

Now configure the service:

## Step 1: Link MongoDB Service

In Railway dashboard:
1. Go to `rocketchat-compose` service
2. Click **"Variables"** tab
3. Click **"Reference Variable"**
4. Select `mongodb` service
5. Select `MONGO_URL` variable
6. This will automatically link MongoDB connection string

## Step 2: Set Environment Variables

In Railway dashboard → `rocketchat-compose` service → **Variables** tab, add:

```
ROOT_URL=https://chat.aurasky.cloud
PORT=3000
DEPLOY_METHOD=docker
DEPLOY_PLATFORM=railway
OVERWRITE_SETTING_Prometheus_Enabled=true
OVERWRITE_SETTING_Prometheus_Port=9458
METRICS_PORT=9458
TRANSPORTER=monolith
```

## Step 3: Configure Custom Domain

1. Go to `rocketchat-compose` service
2. Click **"Settings"** → **"Networking"** → **"Domains"**
3. Click **"Custom Domain"**
4. Enter: `chat.aurasky.cloud`
5. Railway will provision SSL automatically
6. Note the Railway domain shown (we'll need it for DNS)

## Step 4: Configure DNS

After Railway provides the domain, we'll add CNAME record via Hostinger API:
- Name: `chat`
- Type: `CNAME`
- Target: Railway domain (from step 3)

## Step 5: Redeploy

After setting variables, Railway will auto-redeploy, or click "Redeploy" manually.

## Quick CLI Commands

```bash
# Set variables via CLI (if preferred)
railway variables --service rocketchat-compose

# Add domain via CLI
railway domain add chat.aurasky.cloud --service rocketchat-compose

# View logs
railway logs --service rocketchat-compose
```

