# Use Nginx as the base image
FROM nginx:alpine

# Copy the HTML file and any necessary assets into the container
COPY index.html /usr/share/nginx/html/
COPY style.css /usr/share/nginx/html/   # If you have a CSS file
COPY script.js /usr/share/nginx/html/   # If you have a JavaScript file
# Copy any other assets or files your HTML page depends on

# Expose port 80 to serve web traffic
EXPOSE 80

# Command to start Nginx and serve the HTML page
CMD ["nginx", "-g", "daemon off;"]
