#!/bin/bash
# DNS Configuration Script for Hostinger
# This script helps configure DNS records for chat.aurasky.cloud

set -e

DOMAIN="aurasky.cloud"
SUBDOMAIN="chat"
RAILWAY_DOMAIN=""  # Will be set after Railway deployment

echo "DNS Configuration for Rocket.Chat on Railway"
echo "=============================================="
echo ""
echo "This script will help you configure DNS records via Hostinger API"
echo ""

# Check if Railway domain is provided
if [ -z "$RAILWAY_DOMAIN" ]; then
    echo "Please get your Railway domain first:"
    echo "  railway domain --service rocketchat"
    echo ""
    read -p "Enter Railway domain (e.g., rocketchat-production.up.railway.app): " RAILWAY_DOMAIN
fi

echo ""
echo "Configuring DNS for:"
echo "  Domain: ${SUBDOMAIN}.${DOMAIN}"
echo "  Target: ${RAILWAY_DOMAIN}"
echo ""

# Note: Actual DNS configuration will be done via Hostinger API MCP tools
# This script is a helper to guide the process

echo "To configure DNS via Hostinger API:"
echo "1. Check current DNS records for ${DOMAIN}"
echo "2. Add CNAME record: ${SUBDOMAIN} -> ${RAILWAY_DOMAIN}"
echo ""
echo "The DNS configuration can be done via Hostinger API MCP tools"
echo "or manually in Hostinger dashboard"

