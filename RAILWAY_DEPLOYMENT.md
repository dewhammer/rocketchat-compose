# Rocket.Chat Railway Deployment Guide

This guide will help you deploy Rocket.Chat on Railway with managed MongoDB, Prometheus, and Grafana monitoring.

## Prerequisites

- Railway account (you're logged in: `railway whoami`)
- Railway CLI installed (`railway --version`)
- Domain `chat.aurasky.cloud` ready for DNS configuration
- Hostinger DNS access (we'll configure via API)

## Step 1: Create Railway Project

```bash
# Initialize Railway project in this directory
railway init

# This will create a new project or link to existing one
# Follow the prompts to name your project (e.g., "rocketchat")
```

## Step 2: Add MongoDB Service

```bash
# Add Railway's managed MongoDB service
railway add mongodb

# Railway will automatically provide MONGO_URL environment variable
# Note the service name (usually "mongodb" or similar)
```

## Step 3: Create Rocket.Chat Service

```bash
# Create Rocket.Chat service
railway service

# Select "New Service" or create via dashboard
# Name it: "rocketchat"
# Set the root directory to this repo
# Railway will detect railway.json and use Dockerfile.rocketchat
```

## Step 4: Create Prometheus Service

```bash
# Create Prometheus service
railway service

# Select "New Service"
# Name it: "prometheus"
# Set railway.prometheus.json as config (or configure via dashboard)
```

## Step 5: Create Grafana Service

```bash
# Create Grafana service
railway service

# Select "New Service"
# Name it: "grafana"
# Set railway.grafana.json as config (or configure via dashboard)
```

## Step 6: Configure Environment Variables

### Rocket.Chat Service Variables

Set these in Railway dashboard for the `rocketchat` service:

```bash
ROOT_URL=https://chat.aurasky.cloud
PORT=3000
DEPLOY_METHOD=docker
DEPLOY_PLATFORM=railway
OVERWRITE_SETTING_Prometheus_Enabled=true
OVERWRITE_SETTING_Prometheus_Port=9458
METRICS_PORT=9458
```

**Important**: Link the MongoDB service to Rocket.Chat service in Railway dashboard. This will automatically set `MONGO_URL`.

### Prometheus Service Variables

```bash
# Prometheus will automatically discover Rocket.Chat via service name "rocketchat"
# No additional variables needed if service is named "rocketchat"
```

### Grafana Service Variables

```bash
GF_SECURITY_ADMIN_PASSWORD=rc-admin  # CHANGE THIS!
GF_AUTH_ANONYMOUS_ENABLED=false
GF_AUTH_ANONYMOUS_ORG_ROLE=Viewer
GF_AUTH_ANONYMOUS_ORG_NAME=Main Org.
GF_SERVER_SERVE_FROM_SUB_PATH=false
GF_SERVER_ROOT_URL=https://chat.aurasky.cloud/grafana
```

## Step 7: Deploy Services

```bash
# Deploy all services
railway up

# Or deploy individually
railway up --service rocketchat
railway up --service prometheus
railway up --service grafana
```

## Step 8: Configure Custom Domain

### Get Railway Domain

```bash
# Get the Railway-provided domain for Rocket.Chat service
railway domain

# This will show something like: rocketchat-production.up.railway.app
# Note this domain - we'll use it for DNS configuration
```

### Configure DNS via Hostinger API

We'll use the Hostinger API to configure DNS. The script below will:

1. Check current DNS records for `aurasky.cloud`
2. Add CNAME record: `chat` → Railway domain

```bash
# The DNS configuration will be done via Hostinger API MCP tools
# We'll add: chat.aurasky.cloud CNAME → rocketchat-production.up.railway.app
```

### Configure Domain in Railway

```bash
# Add custom domain in Railway
railway domain add chat.aurasky.cloud --service rocketchat

# Railway will automatically provision SSL certificate
```

## Step 9: Verify Deployment

1. **Rocket.Chat**: Visit https://chat.aurasky.cloud
2. **Grafana**: Visit https://chat.aurasky.cloud/grafana (or configure separate subdomain)
3. **Prometheus**: Accessible internally via Railway service discovery

## Service Discovery in Railway

Railway services can discover each other using service names as hostnames:
- Rocket.Chat service name: `rocketchat` → accessible at `rocketchat:3000`
- Prometheus service name: `prometheus` → accessible at `prometheus:9090`
- MongoDB service name: `mongodb` → accessible at `mongodb:27017`

## Troubleshooting

### Check Service Logs

```bash
railway logs --service rocketchat
railway logs --service prometheus
railway logs --service grafana
```

### Check Environment Variables

```bash
railway variables --service rocketchat
```

### Verify MongoDB Connection

```bash
# Connect to MongoDB shell
railway connect mongodb
```

## Next Steps

1. Complete initial Rocket.Chat setup at https://chat.aurasky.cloud
2. Configure Grafana dashboards (pre-configured dashboards are included)
3. Set up monitoring alerts if needed
4. Configure NATS if you need multi-instance deployment

## Files Created

- `Dockerfile.rocketchat` - Rocket.Chat container
- `Dockerfile.prometheus` - Prometheus container
- `Dockerfile.grafana` - Grafana container
- `railway.json` - Railway config for Rocket.Chat
- `railway.prometheus.json` - Railway config for Prometheus
- `railway.grafana.json` - Railway config for Grafana
- `railway.env.example` - Environment variables reference
- `files/prometheus/prometheus.railway.yml` - Prometheus config for Railway
- `files/grafana/provisioning/datasources/prometheus.railway.yml` - Grafana datasource config

