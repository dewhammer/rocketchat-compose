#!/bin/bash
# Deploy email-proxy service to Railway

set -e

echo "=========================================="
echo "Deploying Email Proxy Service to Railway"
echo "=========================================="
echo ""

# Navigate to email-proxy directory
cd "$(dirname "$0")/email-proxy"

echo "Current directory: $(pwd)"
echo ""

# Check Railway CLI
if ! command -v railway &> /dev/null; then
    echo "Error: Railway CLI is not installed"
    exit 1
fi

# Check if logged in
echo "Checking Railway authentication..."
railway whoami

echo ""
echo "=========================================="
echo "Step 1: Create email-proxy Service"
echo "=========================================="
echo "Run this command in Railway dashboard or CLI:"
echo "  railway add"
echo "  Select: Empty Service"
echo "  Name: email-proxy"
echo ""
echo "OR use Railway dashboard:"
echo "  1. Go to: https://railway.com/project/0f94d11d-c56d-44be-a7a5-b5d69bf307aa"
echo "  2. Click '+ New' → 'Empty Service'"
echo "  3. Name: email-proxy"
echo "  4. Set root directory: email-proxy/"
echo ""

read -p "Press Enter after service is created..."

echo ""
echo "=========================================="
echo "Step 2: Set Environment Variables"
echo "=========================================="
echo "In Railway dashboard → email-proxy service → Variables:"
echo ""
echo "RESEND_API_KEY=re_iem8ivqw_GRGKVwbuNnnXgdo3QcWDcKWb"
echo "MAIL_FROM_ADDRESS=info@aurasky.cloud"
echo "PORT=587"
echo ""

read -p "Press Enter after variables are set..."

echo ""
echo "=========================================="
echo "Step 3: Deploy Service"
echo "=========================================="
echo "Deploying email-proxy service..."
railway up --service email-proxy

echo ""
echo "=========================================="
echo "Step 4: Configure Rocket.Chat"
echo "=========================================="
echo "In Rocket.Chat admin UI → Email → SMTP:"
echo ""
echo "Protocol: smtp"
echo "Host: email-proxy"
echo "Port: 587"
echo "IgnoreTLS: OFF"
echo "Pool: ON"
echo "Username: (any value)"
echo "Password: (any value)"
echo "From Email: info@aurasky.cloud"
echo ""

echo "Done! Email proxy service deployed."

