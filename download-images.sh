#!/usr/bin/env bash
# ==========================================================
# download-images.sh
# Mengunduh semua gambar (hero, produk, about) yang dipakai
# di index.html ke dalam folder images/.
#
# CARA PAKAI:
#   1. Taruh file ini di root folder proyek (sejajar index.html)
#   2. Jalankan di terminal (Linux/Mac/WSL/Git Bash):
#        chmod +x download-images.sh
#        ./download-images.sh
#   3. Folder images/ akan otomatis terisi.
#
# Catatan: butuh koneksi internet aktif ke images.unsplash.com
# (skrip ini TIDAK bisa dijalankan di sandbox Claude karena
# domain tersebut diblokir di sana).
# ==========================================================

set -e
mkdir -p images

declare -A FILES=(
  ["images/hero-banner.jpg"]="https://images.unsplash.com/photo-1631730486572-226d1f595b68?w=600&q=80"
  ["images/produk-serum-vitamin-c.jpg"]="https://images.unsplash.com/photo-1760860992928-221d73c4c0cc?w=500&q=80"
  ["images/produk-lipstick-matte.jpg"]="https://images.unsplash.com/photo-1608769515270-81ff7293e988?w=500&q=80"
  ["images/produk-parfum-floral.jpg"]="https://images.unsplash.com/photo-1619352704218-ab07491b9353?w=500&q=80"
  ["images/produk-eyeshadow-palette.jpg"]="https://images.unsplash.com/photo-1533562389935-457b1ae48a39?w=500&q=80"
  ["images/produk-sheet-mask.jpg"]="https://images.unsplash.com/photo-1743928217924-77ec5f39c4fb?w=500&q=80"
  ["images/produk-foundation.jpg"]="https://images.unsplash.com/photo-1571875257727-256c39da42af?w=500&q=80"
  ["images/produk-body-lotion.jpg"]="https://images.unsplash.com/photo-1551446339-1e5c6f164ec2?w=500&q=80"
  ["images/produk-hair-serum.jpg"]="https://images.unsplash.com/photo-1608571424266-edeb9bbefdec?w=500&q=80"
  ["images/produk-lip-gloss.jpg"]="https://images.unsplash.com/photo-1635263282145-253319c75fd4?w=500&q=80"
  ["images/produk-sunscreen.jpg"]="https://images.unsplash.com/photo-1594527964562-32ed6eb11709?w=500&q=80"
  ["images/about-tentang-kami.jpg"]="https://images.unsplash.com/photo-1596462502278-27bfdc403348?w=600&q=80"
)

for path in "${!FILES[@]}"; do
  url="${FILES[$path]}"
  echo "Mengunduh: $path"
  curl -sL "$url" -o "$path"
done

echo ""
echo "Selesai! Semua gambar tersimpan di folder images/."
