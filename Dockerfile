# Use Nginx as base image to serve static files
FROM nginx:alpine

# Copy app files into nginx's html directory
COPY . /usr/share/nginx/html

# Expose default port
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
