# Use a lightweight NGINX image
FROM nginx:alpine

# Copy the game files into the NGINX root directory
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
