# Railway MCP Configuration - Fixed ✅

## Configuration Updated

According to Railway's official documentation (https://docs.railway.com/reference/mcp-server), the Railway MCP Server:
- Uses Railway CLI (already authenticated)
- **Does NOT need API token** - uses CLI authentication
- Configuration format: `"Railway": { "command": "npx", "args": ["-y", "@railway/mcp-server"] }`

## Changes Made

✅ Removed duplicate entries
✅ Removed API token (not needed)
✅ Updated to official format: `"Railway"` (capital R)

## Available Railway MCP Tools

According to the docs, Railway MCP provides:
- `check-railway-status` - Verify CLI installation
- `list-projects` - List all projects
- `create-project-and-link` - Create and link project
- `list-services` - List project services
- `link-service` - Link service to directory
- `deploy` - Deploy a service
- `deploy-template` - Deploy from template library
- `create-environment` - Create new environment
- `link-environment` - Link environment
- `list-variables` - List environment variables
- `set-variables` - Set environment variables
- `generate-domain` - Generate Railway domain
- `get-logs` - Retrieve service logs

## Next Steps

1. **Restart Cursor** - Required for MCP changes
2. **Use Railway MCP tools** - After restart, tools should be available
3. **Deploy email-proxy** - Can use `deploy` tool or `link-service` + `deploy`

