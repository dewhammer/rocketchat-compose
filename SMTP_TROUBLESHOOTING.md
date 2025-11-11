# SMTP Troubleshooting Steps

## 1. Check Rocket.Chat Logs

In Rocket.Chat admin UI:
- Go to **Administration** > **View Logs**
- Filter for "SMTP" or "email" errors
- Look for connection errors, authentication failures, etc.

Or via Railway CLI:
```bash
railway logs --service rocketchat-compose | grep -i smtp
railway logs --service rocketchat-compose | grep -i email
railway logs --service rocketchat-compose | grep -i error
```

## 2. Verify SMTP Settings

Current settings should be:
- Protocol: `smtps` (for port 465) OR `smtp` (for port 587)
- Host: `smtp.hostinger.com`
- Port: `465` (with smtps) OR `587` (with smtp)
- IgnoreTLS: **OFF** (disabled) - This is important!
- Username: `info@aurasky.cloud`
- Password: [correct mailbox password]
- From Email: `info@aurasky.cloud`

## 3. Common Issues

### Issue: IgnoreTLS is ON
- **Fix**: Turn IgnoreTLS **OFF** (disabled)
- Port 465 requires SSL/TLS, so IgnoreTLS should be disabled

### Issue: Protocol Mismatch
- Port 465 → Use `smtps` protocol
- Port 587 → Use `smtp` protocol

### Issue: Railway Firewall Blocking SMTP
- Railway might block outbound SMTP connections
- Check Railway logs for connection timeouts

### Issue: Wrong Password
- Verify mailbox password in Hostinger
- Try resetting mailbox password

## 4. Try Alternative Configuration

If port 465 doesn't work, try port 587:

```
Protocol: smtp
Host: smtp.hostinger.com
Port: 587
IgnoreTLS: OFF
Pool: ON
Username: info@aurasky.cloud
Password: [your password]
From Email: info@aurasky.cloud
```

## 5. Test SMTP Connection Manually

You can test SMTP connection from Railway container:

```bash
# Connect to Railway container
railway shell --service rocketchat-compose

# Test SMTP connection (if tools available)
telnet smtp.hostinger.com 465
# or
openssl s_client -connect smtp.hostinger.com:465
```

## 6. Check Email Logs in Hostinger

- Go to Hostinger → Email → Email Logs
- Check if there are any failed delivery attempts
- Look for authentication errors

## 7. Verify Railway Network Access

Railway should allow outbound SMTP connections, but verify:
- Check Railway service logs for network errors
- Look for "connection refused" or "timeout" errors

