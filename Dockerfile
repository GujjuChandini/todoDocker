# Use Nginx as base image
FROM nginx:alpine

# Remove default nginx html content
RUN rm -rf /usr/share/nginx/html/*

# Copy your app content to nginx folder
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
