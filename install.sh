# Termux-only installer for C Objects

echo "[*] Checking environment..."

# Detect Termux
if [ -z "$PREFIX" ] || [[ "$PREFIX" != *"com.termux"* ]]; then
    echo "[!] This installer is ONLY for Termux."
    exit 1
fi

echo "[+] Termux detected"

# Ensure required tools
echo "[*] Installing dependencies..."
pkg update -y >/dev/null 2>&1
pkg install -y curl clang >/dev/null 2>&1

# Install objects.h
echo "[*] Installing objects.h..."
curl -fsSL https://raw.githubusercontent.com/tanazd2/c-objects/main/objects.h \
-o $PREFIX/include/objects.h

# Install objects CLI tool
echo "[*] Installing aarch64-linux-android-objects..."

curl -fsSL https://raw.githubusercontent.com/tanazd2/c-objects/main/aarch64-linux-android-objects \
-o $PREFIX/bin/aarch64-linux-android-objects

# Make executable
chmod +x $PREFIX/bin/aarch64-linux-android-objects

# Verify install
if [ -f "$PREFIX/include/objects.h" ] && [ -x "$PREFIX/bin/aarch64-linux-android-objects" ]; then
    echo "[+] Installation successful!"
else
    echo "[!] Installation may have failed."
    exit 1
fi

echo ""
echo "Usage:"
echo "  aarch64-linux-android-objects file.obj main.c -o output"
