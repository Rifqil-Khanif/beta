# Gunakan Node.js versi LTS berbasis Debian Buster
FROM node:lts-buster

# Perbarui repositori, instal dependensi, dan bersihkan cache
RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp \
  python3 \
  make \
  g++ \
  build-essential && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

# Set the Python version for node-gyp (ensure it uses Python 3)
ENV PYTHON=/usr/bin/python3

# Instal pm2 sebagai global dependency
RUN npm install -g pm2

# Buat direktori kerja
WORKDIR /app

# Salin file package.json terlebih dahulu
COPY package.json ./ 

# Salin package-lock.json jika ada
COPY package-lock.json* ./

# Bersihkan cache npm untuk menghindari masalah cache
RUN npm cache clean --force

# Instal semua dependensi Node.js dari package.json
RUN npm install && npm install qrcode-terminal

# Salin semua file ke dalam container
COPY . .

# Pastikan izin file dan direktori sesuai agar tidak ada konflik
RUN chmod -R 755 /app

# Expose port 5000 untuk aplikasi
EXPOSE 5000

# Jalankan aplikasi menggunakan pm2
CMD ["node", "index.js", "--autoread"]
