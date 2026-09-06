#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 2 ]]; then
  echo "Usage: $0 YEAR MONTH   (e.g., $0 2010 2)"
  exit 1
fi

YEAR="$1"
MONTH="$2"

URL="https://caravanmagazine.in/magazine/${YEAR}/${MONTH}"

mkdir -p covers

# Extract image src for class usp-vjgytv
# Download the first match as the "cover"
img_url="$(
  curl -sL "$URL" | \
  grep -oP '<img[^>]*class="usp-vjgytv"[^>]*\ssrc="\K[^"]+' | \
  sed 's|^//|https://|' | \
  awk 'NF{print}' | head -n 1
)"

if [[ -z "$img_url" ]]; then
  echo "Could not find cover image at: $URL"
  exit 1
fi

# Choose output filename
out="covers/cover-${YEAR}-${MONTH}.jpg"

echo "Downloading cover for ${YEAR}/${MONTH}..."
wget -q -O "$out" "$img_url"

echo "Saved: $out"

#wget -q -O 2010_02.jpg $(curl -sL 'https://caravanmagazine.in/magazine/2010/2' | \
#grep -oP '<img[^>]*class="usp-vjgytv"[^>]*\ssrc="\K[^"]+' | \
#sed 's|^//|https://|')


