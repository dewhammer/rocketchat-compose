#!/bin/bash
# Railway Deployment Setup Script
# Run this script interactively to set up Railway services

set -e

echo "=========================================="
echo "Rocket.Chat Railway Deployment Setup"
echo "=========================================="
echo ""

# Check if Railway CLI is installed
if ! command -v railway &> /dev/null; then
    echo "Error: Railway CLI is not installed"
    echo "Install it from: https://docs.railway.com/develop/cli"
    exit 1
fi

# Check if logged in
echo "Checking Railway authentication..."
railway whoami

echo ""
echo "Current project status:"
railway status

echo ""
echo "=========================================="
echo "Step 1: Add MongoDB Database"
echo "=========================================="
echo "Run this command interactively:"
echo "  railway add --database mongo"
echo ""
read -p "Press Enter after MongoDB is added..."

echo ""
echo "=========================================="
echo "Step 2: Create Rocket.Chat Service"
echo "=========================================="
echo "Run this command interactively:"
echo "  railway add --service rocketchat"
echo "  (Select 'Empty Service' when prompted)"
echo ""
read -p "Press Enter after Rocket.Chat service is created..."

echo ""
echo "=========================================="
echo "Step 3: Create Prometheus Service"
echo "=========================================="
echo "Run this command interactively:"
echo "  railway add --service prometheus"
echo "  (Select 'Empty Service' when prompted)"
echo ""
read -p "Press Enter after Prometheus service is created..."

echo ""
echo "=========================================="
echo "Step 4: Create Grafana Service"
echo "=========================================="
echo "Run this command interactively:"
echo "  railway add --service grafana"
echo "  (Select 'Empty Service' when prompted)"
echo ""
read -p "Press Enter after Grafana service is created..."

echo ""
echo "=========================================="
echo "Next Steps:"
echo "=========================================="
echo "1. Configure each service in Railway dashboard:"
echo "   - Rocket.Chat: Set Dockerfile path to Dockerfile.rocketchat"
echo "   - Prometheus: Set Dockerfile path to Dockerfile.prometheus"
echo "   - Grafana: Set Dockerfile path to Dockerfile.grafana"
echo ""
echo "2. Set environment variables (see railway.env.example)"
echo ""
echo "3. Link MongoDB to Rocket.Chat service in Railway dashboard"
echo ""
echo "4. Deploy services: railway up"
echo ""
echo "5. Configure domain: railway domain add chat.aurasky.cloud --service rocketchat"
echo ""
echo "Setup script complete!"

