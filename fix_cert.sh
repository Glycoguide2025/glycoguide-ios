#!/bin/bash
echo "Looking for certificate file..."

# Find p12 files
P12_FILE=$(find ~/Documents ~/Desktop -name "*.p12" 2>/dev/null | head -1)

if [ -z "$P12_FILE" ]; then
    echo "No .p12 file found. Please check your Documents or Desktop folder."
    exit 1
fi

echo "Found: $P12_FILE"
echo "Creating clean base64..."

# Create clean base64 without line breaks
base64 -i "$P12_FILE" | tr -d '\n' > ~/Desktop/CERT_BASE64.txt

echo ""
echo "==================================="
echo "DONE! File saved to Desktop:"
echo "~/Desktop/CERT_BASE64.txt"
echo "==================================="
echo ""
echo "Now upload CERT_BASE64.txt to Google Drive,"
echo "then download it on your Windows PC."
