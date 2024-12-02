# Use the official Node.js image as the base image
FROM node:16

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application to the container
COPY . .

# Expose the application port (adjust based on your app's settings)
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
