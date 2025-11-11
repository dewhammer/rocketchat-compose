# Railway Deployment Summary

## What We've Set Up

### Configuration Files Created

1. **Dockerfiles:**
   - `Dockerfile.rocketchat` - Rocket.Chat container
   - `Dockerfile.prometheus` - Prometheus monitoring
   - `Dockerfile.grafana` - Grafana dashboards

2. **Railway Configuration:**
   - `railway.json` - Rocket.Chat service config
   - `railway.prometheus.json` - Prometheus service config
   - `railway.grafana.json` - Grafana service config

3. **Monitoring Configuration:**
   - `files/prometheus/prometheus.railway.yml` - Prometheus config for Railway
   - `files/grafana/provisioning/datasources/prometheus.railway.yml` - Grafana datasource

4. **Documentation:**
   - `RAILWAY_DEPLOYMENT.md` - Complete deployment guide
   - `railway.env.example` - Environment variables reference
   - `configure-dns.sh` - DNS configuration helper

### Current DNS Status

Domain: `aurasky.cloud`
- Root domain (@) has ALIAS to Railway: `4uo9kuob.up.railway.app`
- `event` subdomain points to Railway: `qn2q8o20.up.railway.app`
- **Need to add:** `chat` subdomain → Rocket.Chat Railway domain (after deployment)

## Next Steps

### 1. Fork Repository (if not done)
```bash
# Fork on GitHub: https://github.com/RocketChat/rocketchat-compose
# Then update remote:
git remote set-url origin https://github.com/dewhammer/rocketchat-compose.git
```

### 2. Initialize Railway Project
```bash
railway init
# Follow prompts to create/link project
```

### 3. Add MongoDB Service
```bash
railway add mongodb
# Railway will provide MONGO_URL automatically
```

### 4. Create Services
Create three services in Railway:
- `rocketchat` (using Dockerfile.rocketchat)
- `prometheus` (using Dockerfile.prometheus)
- `grafana` (using Dockerfile.grafana)

### 5. Configure Environment Variables
See `railway.env.example` for all required variables.

### 6. Deploy Services
```bash
railway up
```

### 7. Configure Domain
```bash
# Get Railway domain
railway domain --service rocketchat

# Add custom domain
railway domain add chat.aurasky.cloud --service rocketchat
```

### 8. Configure DNS
Add CNAME record via Hostinger API:
- Name: `chat`
- Type: `CNAME`
- Target: Railway domain (from step 7)

## Service Architecture

```
Railway Project
├── MongoDB (Managed Service)
│   └── Provides: MONGO_URL
├── Rocket.Chat Service
│   └── Connects to: MongoDB
│   └── Exposes: Port 3000 (HTTP), Port 9458 (Metrics)
├── Prometheus Service
│   └── Scrapes: Rocket.Chat metrics (rocketchat:9458)
│   └── Exposes: Port 9090
└── Grafana Service
    └── Connects to: Prometheus (prometheus:9090)
    └── Exposes: Port 3000
```

## Service Discovery

Railway services discover each other using service names:
- `rocketchat:3000` - Rocket.Chat HTTP
- `rocketchat:9458` - Rocket.Chat Metrics
- `prometheus:9090` - Prometheus API
- `mongodb:27017` - MongoDB (managed service)

## Important Notes

1. **NATS**: Not included in Railway deployment. Rocket.Chat can run in monolith mode without NATS for single-instance deployments.

2. **Traefik**: Not needed - Railway handles routing and SSL automatically.

3. **Service Names**: Make sure Railway service names match:
   - Rocket.Chat service: `rocketchat`
   - Prometheus service: `prometheus`
   - Grafana service: `grafana`

4. **MongoDB**: Railway managed MongoDB automatically provides connection string via `MONGO_URL` environment variable.

5. **SSL**: Railway automatically provisions SSL certificates for custom domains.

## Troubleshooting

- Check logs: `railway logs --service <service-name>`
- Check variables: `railway variables --service <service-name>`
- Verify MongoDB connection: `railway connect mongodb`

