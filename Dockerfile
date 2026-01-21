# Stage 1: Build the application
FROM node:18-alpine as builder
WORKDIR /app
COPY package*.json ./
RUN npm install && npm cache clean --force
COPY . .
RUN npm run build

# Stage 2: Production image with Nginx
FROM nginx:alpine
# Copy the build artifacts from the 'builder' stage to the Nginx server directory
COPY --from=builder /app/dist /usr/share/nginx/html

# Expose the default HTTP port
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]