# Email Troubleshooting for info@aurasky.cloud

## Current DNS Status

✅ MX Records: Configured correctly
- `mx1.hostinger.com` (priority 5)
- `mx2.hostinger.com` (priority 10)

✅ SPF Record: `v=spf1 include:_spf.mail.hostinger.com ~all`
✅ DKIM Records: Configured
✅ DMARC Records: Present

⚠️ Potential Issues:
1. Root domain ALIAS pointing to Railway might interfere
2. Conflicting SPF record on `send` subdomain (Amazon SES)

## Steps to Fix

### 1. Verify Mailbox Exists
- Go to Hostinger → Email → Mailboxes
- Ensure `info@aurasky.cloud` mailbox exists
- If not, create it

### 2. Check Mailbox Password
- Reset password if needed
- Ensure you're using the correct credentials

### 3. Test Email Configuration
- Try sending email TO `info@aurasky.cloud` from external email
- Check spam folder
- Try sending FROM `info@aurasky.cloud` to external email

### 4. Verify DNS Propagation
```bash
# Check MX records
dig MX aurasky.cloud

# Check SPF
dig TXT aurasky.cloud | grep spf
```

### 5. Check Hostinger Email Logs
- Go to Hostinger → Email → Email Logs
- Look for failed deliveries or errors

## Common Issues

1. **Mailbox not created**: Create it in Hostinger email panel
2. **Password incorrect**: Reset mailbox password
3. **DNS not propagated**: Wait 24-48 hours after changes
4. **Spam filtering**: Check spam folder
5. **ALIAS interference**: Root domain ALIAS shouldn't affect email, but worth checking

## Next Steps

1. Verify mailbox exists in Hostinger
2. Test sending/receiving
3. Check email logs in Hostinger
4. If still not working, contact Hostinger support

