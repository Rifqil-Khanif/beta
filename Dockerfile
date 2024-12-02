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

# Install global dependencies like node-gyp
RUN npm install -g node-gyp

# Copy package.json and install dependencies
COPY package.json .

RUN npm install && npm install qrcode-terminal

# Copy the rest of the application files
COPY . .

# Expose the port your app will use
EXPOSE 5000

# Start the application
CMD ["node", "index.js", "--autoread"]
