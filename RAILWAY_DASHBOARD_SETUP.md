# Railway Dashboard Setup Guide

Since Railway CLI requires interactive input, use the Railway dashboard for initial setup:

## Step 1: Add MongoDB Database

1. Go to Railway dashboard: https://railway.com/project/0f94d11d-c56d-44be-a7a5-b5d69bf307aa
2. Click **"+ New"** → **"Database"** → **"Add MongoDB"**
3. Railway will automatically create the MongoDB service and provide `MONGO_URL`

## Step 2: Create Rocket.Chat Service

1. Click **"+ New"** → **"Empty Service"**
2. Name it: `rocketchat`
3. In service settings:
   - **Root Directory**: `/` (or leave default)
   - **Dockerfile Path**: `Dockerfile.rocketchat`
   - **Build Command**: (leave empty, Railway will auto-detect)
   - **Start Command**: (leave empty)

## Step 3: Create Prometheus Service

1. Click **"+ New"** → **"Empty Service"**
2. Name it: `prometheus`
3. In service settings:
   - **Root Directory**: `/` (or leave default)
   - **Dockerfile Path**: `Dockerfile.prometheus`

## Step 4: Create Grafana Service

1. Click **"+ New"** → **"Empty Service"**
2. Name it: `grafana`
3. In service settings:
   - **Root Directory**: `/` (or leave default)
   - **Dockerfile Path**: `Dockerfile.grafana`

## Step 5: Link MongoDB to Rocket.Chat

1. Go to `rocketchat` service
2. Click **"Variables"** tab
3. Click **"Reference Variable"**
4. Select `mongodb` service
5. Select `MONGO_URL` variable
6. This will automatically link MongoDB connection string

## Step 6: Configure Environment Variables

### Rocket.Chat Service Variables

Go to `rocketchat` service → **Variables** tab, add:

```
ROOT_URL=https://chat.aurasky.cloud
PORT=3000
DEPLOY_METHOD=docker
DEPLOY_PLATFORM=railway
OVERWRITE_SETTING_Prometheus_Enabled=true
OVERWRITE_SETTING_Prometheus_Port=9458
METRICS_PORT=9458
```

### Grafana Service Variables

Go to `grafana` service → **Variables** tab, add:

```
GF_SECURITY_ADMIN_PASSWORD=rc-admin
GF_AUTH_ANONYMOUS_ENABLED=false
GF_AUTH_ANONYMOUS_ORG_ROLE=Viewer
GF_AUTH_ANONYMOUS_ORG_NAME=Main Org.
GF_SERVER_SERVE_FROM_SUB_PATH=false
GF_SERVER_ROOT_URL=https://chat.aurasky.cloud/grafana
```

### Prometheus Service Variables

No additional variables needed (will discover Rocket.Chat via service name)

## Step 7: Deploy Services

1. Go to each service and click **"Deploy"**
2. Or use CLI: `railway up` (deploys all services)

## Step 8: Configure Custom Domain

1. Go to `rocketchat` service
2. Click **"Settings"** → **"Domains"**
3. Click **"Custom Domain"**
4. Enter: `chat.aurasky.cloud`
5. Railway will provision SSL automatically

## Step 9: Configure DNS

After Railway provides the domain, configure DNS via Hostinger API (we'll do this next).

