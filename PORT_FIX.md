# Important: Railway Port Configuration

## Current Setup
- Rocket.Chat PORT environment variable: `3000`
- Railway domain port: `8080` ❌ (WRONG!)

## Fix Required

In Railway dashboard → Settings → Public Networking:
1. Edit the `chat.aurasky.cloud` domain
2. Change port from `8080` to `3000`
3. Save/Update

## Why Port 3000?

Rocket.Chat's Dockerfile exposes port 3000, and the PORT environment variable is set to 3000. Railway needs to route traffic to the same port that Rocket.Chat is listening on.

## After Fix

Once port is set to 3000, Railway will correctly route traffic to Rocket.Chat.

