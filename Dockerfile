# Use official Nginx Alpine image for minimal size
FROM nginx:alpine

# Remove default Nginx static assets
RUN rm -rf /usr/share/nginx/html/*

# Copy HTML files from src folder
COPY src/ /usr/share/nginx/html/

# Copy CSS files from styles folder
COPY styles/ /usr/share/nginx/html/styles/

# Expose port 80 for web traffic
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
