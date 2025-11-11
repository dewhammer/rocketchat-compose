# Simple Railway Setup

## Current Status
✅ Railway project created: `rocketchat`
✅ MongoDB service deployed
✅ `compose.railway.yml` created and committed locally

## Next Steps

### Option 1: Fork & Connect (Recommended)
1. Fork: https://github.com/RocketChat/rocketchat-compose → Click "Fork"
2. Update remote: `git remote set-url origin https://github.com/dewhammer/rocketchat-compose.git`
3. Push: `git push origin main`
4. In Railway: Settings → Connect GitHub → Select your fork

### Option 2: Connect Original Repo
- Railway can connect to the original repo (read-only)
- You'll need to fork later for auto-deploy on push

### Option 3: Create New Repo
- Create new GitHub repo: `rocketchat-railway`
- Push code there
- Connect Railway to new repo

## After Connecting to GitHub

1. **Railway will detect `compose.railway.yml`**
2. **Set environment variables:**
   - `ROOT_URL=https://chat.aurasky.cloud`
   - `MONGO_URL` (auto-linked from MongoDB service)
   - `GRAFANA_ADMIN_PASSWORD=rc-admin`
   - `GRAFANA_ROOT_URL=https://chat.aurasky.cloud/grafana`

3. **Deploy:** Railway auto-deploys or click "Deploy"

4. **Add domain:** `chat.aurasky.cloud` in Railway

5. **Configure DNS:** Add CNAME via Hostinger API

## Workflow Going Forward
- Edit → Commit → Push → Auto-deploy ✅
- Manage everything in Railway dashboard ✅

