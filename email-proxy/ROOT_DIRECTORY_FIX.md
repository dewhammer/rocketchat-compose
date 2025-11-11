# Fix Railway Root Directory Issue

## Problem

Railway deployment failed with: "Could not find root directory: email-proxy"

## Solution: Set Root Directory in Railway Dashboard

Since Railway CLI doesn't support setting root directory via command line, you need to set it in the dashboard:

### Steps:

1. **Go to Railway Dashboard**
   - https://railway.com/project/0f94d11d-c56d-44be-a7a5-b5d69bf307aa/service/1ed97021-cbc8-4a3d-8613-2d39cdf463b3

2. **Click on `email-proxy` service**

3. **Go to Settings tab**

4. **Find "Root Directory" section**

5. **Set Root Directory to**: `email-proxy`

6. **Save changes**

7. **Redeploy** - Railway will automatically redeploy or you can trigger a new deployment

## Alternative: Deploy from Parent Directory

If you want to deploy via CLI from the parent directory:

```bash
cd /Users/fidelis/Dev/rocket-chat
railway up --service email-proxy email-proxy/
```

But Railway still needs the root directory configured in settings for future deployments.

## After Root Directory is Set

Once the root directory is configured:
- Railway will look for `email-proxy/Dockerfile`
- Build will succeed
- Service will deploy and be available at `email-proxy:587`

