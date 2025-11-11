# Railway Deployment - Simple Setup

## Quick Start

1. **Fork this repo** (if not already forked)
2. **Connect Railway to GitHub:**
   - In Railway dashboard → Settings → Connect GitHub repo
   - Select `dewhammer/rocketchat-compose`
   - Railway will auto-detect `compose.railway.yml`

3. **Set Environment Variables in Railway:**
   ```
   ROOT_URL=https://chat.aurasky.cloud
   PORT=3000
   METRICS_PORT=9458
   MONGO_URL=${MONGO_URL}  # Auto-provided by Railway MongoDB service
   GRAFANA_ADMIN_PASSWORD=rc-admin  # Change this!
   GRAFANA_ROOT_URL=https://chat.aurasky.cloud/grafana
   ```

4. **Deploy:** Railway will auto-deploy on push, or click "Deploy" in dashboard

5. **Configure Domain:**
   - Railway dashboard → rocketchat service → Settings → Domains
   - Add: `chat.aurasky.cloud`

6. **Configure DNS:**
   - Add CNAME: `chat` → Railway domain (via Hostinger API)

## Workflow

- **Edit** → **Commit** → **Push** → **Auto-deploy**
- Manage DBs, domains, vars in Railway dashboard
- Force rebuild: Railway dashboard → Service → Redeploy

