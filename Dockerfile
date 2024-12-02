# Use an official Node.js runtime as a parent image with Debian Buster
FROM node:lts-buster

# Set the working directory
WORKDIR /app

# Install required dependencies including ffmpeg, imagemagick, webp, build tools, and Python
RUN apt-get update && \
  apt-get install -y \
  build-essential \
  python3 \
  python3-pip \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

# Copy the package.json (if you need it to match the installed dependencies)
COPY package.json .

# Copy the rest of the application files
COPY . .

# Expose the port your app will use
EXPOSE 5000

# Start the application directly
CMD ["node", "index.js", "--autoread"]
