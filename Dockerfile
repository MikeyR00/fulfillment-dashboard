# Use official Node.js Alpine image for smaller size
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package files first for better caching
COPY package*.json ./

# Install production dependencies only
RUN npm ci --only=production

# Copy application code
COPY . .

# Expose the port Cloud Run expects
EXPOSE 8080

# Set environment variable
ENV NODE_ENV=production

# Run the application
CMD ["node", "server.js"]
