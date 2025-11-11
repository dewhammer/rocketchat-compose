# SECURITY ALERT - API Key Exposed

## Critical Issue

The Resend API key was accidentally committed to the GitHub repository.

## Immediate Actions Required

### 1. Revoke Exposed API Key in Resend

1. Go to: https://resend.com/api-keys
2. Find the key ending in `...cKWb`
3. **Delete/Revoke it immediately**

### 2. Create New API Key

1. In Resend dashboard → API Keys
2. Create a new API key
3. Copy the new key

### 3. Update Railway Environment Variables

```bash
railway variables --service email-proxy --set "RESEND_API_KEY=<NEW_KEY>"
```

### 4. Files Updated

All documentation files have been updated to use placeholder `YOUR_RESEND_API_KEY_HERE` instead of the real key.

## Prevention

- ✅ Added `.gitignore` to prevent committing secrets
- ✅ All docs now use placeholders
- ⚠️ **Git history still contains the key** - Consider using `git filter-branch` or BFG Repo-Cleaner if needed

## Next Steps

1. Revoke old key in Resend
2. Create new key
3. Update Railway variables
4. Test email functionality

