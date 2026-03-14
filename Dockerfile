FROM node:20-slim

# Install git (untuk fetch module dari github) dan ffmpeg (untuk fitur media/audio/video)
RUN apt-get update && \
    apt-get install -y git ffmpeg && \
    rm -rf /var/lib/apt/lists/*

# Set directory kerja di dalam container
WORKDIR /app

# Copy package.json dan install koneksi
COPY package*.json ./
RUN npm install

# Copy seluruh file project
COPY . .

# Jalankan bot
CMD ["npm", "start"]
