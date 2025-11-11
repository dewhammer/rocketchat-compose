# SMTP to Resend API Proxy
# Converts SMTP requests to Resend API calls

FROM node:20-alpine

WORKDIR /app

# Install dependencies
COPY package.json package-lock.json* ./
RUN npm ci --only=production

# Copy application code
COPY . .

# Expose SMTP port
EXPOSE 587

# Start the proxy server
CMD ["node", "server.js"]
