# Railway MCP Status

## Current Situation

✅ **Railway MCP Server Installed**: `@railway/mcp-server` 
❌ **Not Configured**: Railway MCP needs Railway API token to work

## Railway MCP Configuration

Railway MCP server needs:
1. Railway API token (get from: https://railway.com/account/tokens)
2. Configured in Cursor MCP settings

## Alternative: Railway CLI

Since Railway CLI is working, we can use it instead:

### Deploy Email Proxy Service

```bash
# 1. Link to project (if needed)
cd /Users/fidelis/Dev/rocket-chat
railway link  # Select: rocketchat

# 2. Create service
cd email-proxy
railway add --service email-proxy \
  --variables "RESEND_API_KEY=YOUR_RESEND_API_KEY_HERE" \
  --variables "MAIL_FROM_ADDRESS=info@aurasky.cloud" \
  --variables "PORT=587"

# 3. Deploy
railway up --service email-proxy
```

## Or Use Railway Dashboard

Since Railway CLI prompts are interactive, dashboard is easier:

1. Go to: https://railway.com/project/0f94d11d-c56d-44be-a7a5-b5d69bf307aa
2. Click **"+ New"** → **"Empty Service"**
3. Name: `email-proxy`
4. Root Directory: `email-proxy/`
5. Variables:
   - `RESEND_API_KEY=YOUR_RESEND_API_KEY_HERE`
   - `MAIL_FROM_ADDRESS=info@aurasky.cloud`
   - `PORT=587`
6. Deploy

## Recommendation

**Use Railway Dashboard** - It's the fastest and most reliable method since:
- Railway CLI requires interactive prompts
- Railway MCP needs API token configuration
- Dashboard is straightforward and visual

