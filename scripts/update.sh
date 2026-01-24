# system + uv
yay -Syu
echo ""

# rust
cargo install-update -a
echo ""

# js tools (user-owned)
npm update -g
echo ""

# python CLIs
pipx upgrade-all
echo ""
uv tool upgrade --all
echo ""

# flatpak apps
flatpak update
echo ""

echo "All updates are done"
