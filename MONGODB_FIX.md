# Fix MongoDB Replica Set Issue

## Problem
Railway's managed MongoDB is not configured as a replica set, but Rocket.Chat requires it for change streams.

## Solution

Update the `MONGO_URL` environment variable to disable change streams or use direct connection:

### Option 1: Add directConnection parameter (Recommended)

In Railway dashboard → Variables → `MONGO_URL`:

Change from:
```
${{MongoDB.MONGO_URL}}
```

To:
```
${{MongoDB.MONGO_URL}}?directConnection=true
```

Or manually construct:
```
mongodb://[username]:[password]@[host]:[port]/rocketchat?directConnection=true
```

### Option 2: Disable Change Streams

Add environment variable:
```
OVERWRITE_SETTING_Database_Change_Stream=false
```

### Option 3: Use Oplog Tailing (if available)

If Railway MongoDB supports oplog, configure it differently.

## Also Fix Port

In Railway dashboard → Settings → Public Networking:
- Edit `chat.aurasky.cloud` domain
- Change port from `8080` to `3000`
- Save

