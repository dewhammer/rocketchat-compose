# Fix Railway Build Failure

## Problem
Railway is trying to use Railpack (buildpack system) instead of Docker Compose.

## Solution

### Option 1: Configure Service to Use Docker Compose (Recommended)

In Railway dashboard for the `rocketchat` service:

1. Go to **Settings** → **Service**
2. Set **Build Method** to **"Docker Compose"**
3. Set **Docker Compose File** to `docker-compose.yml`
4. Railway will detect and deploy all services (rocketchat, prometheus, grafana)

### Option 2: Use Individual Dockerfiles

If Docker Compose doesn't work, create separate services:

1. **Rocket.Chat Service:**
   - Root Directory: `/`
   - Dockerfile Path: `Dockerfile.rocketchat`
   - Build Method: `Dockerfile`

2. **Prometheus Service:**
   - Root Directory: `/`
   - Dockerfile Path: `Dockerfile.prometheus`
   - Build Method: `Dockerfile`

3. **Grafana Service:**
   - Root Directory: `/`
   - Dockerfile Path: `Dockerfile.grafana`
   - Build Method: `Dockerfile`

## After Configuration

1. Set environment variables (see `railway.env.example`)
2. Link MongoDB service to Rocket.Chat service
3. Deploy

