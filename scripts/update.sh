# system 
yay -Syu
echo ""

# rust
rustup update          # Update the compiler and toolchain first
cargo install-update -a # Then update the tools using the new compiler
echo ""

# js tools (user-owned)
npm update -g
echo ""

# python CLIs
uv tool upgrade --all
echo ""

# flatpak apps
flatpak update
echo ""

echo "All updates are done"
