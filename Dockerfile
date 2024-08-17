# Stage 1: Build Stage
FROM node:14-alpine AS build

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# No need to install any dependencies since we are serving static files
# Install any needed packages (if needed for building)

# Stage 2: Serve Stage
FROM nginx:alpine

# Copy built files from the previous stage
COPY --from=build /app /usr/share/nginx/html

# Expose port 80 to the outside world
EXPOSE 80

# Start nginx server
CMD ["nginx", "-g", "daemon off;"]
