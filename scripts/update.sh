#!/usr/bin/env bash

# Define colors for clean formatting
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Track failures
FAILED_UPDATES=()

log_status() {
    echo -e "\n${GREEN}[=== $1 ===]${NC}\n"
}

# 1. Update system and AUR packages via paru
log_status "Updating System & AUR Packages"
if ! paru -Syu; then
    FAILED_UPDATES+=("paru (System/AUR)")
fi

# 2. Update Rust toolchains via rustup
log_status "Updating Rust Toolchains"
if ! rustup update; then
    FAILED_UPDATES+=("rustup (Toolchains)")
fi

# 3. Update globally installed cargo binaries
# Note: Standard 'cargo update' only updates a local project's Cargo.lock.
# To update globally installed binaries, we use 'cargo install-update'.
log_status "Updating Global Cargo Packages"
if command -v cargo-install-update &> /dev/null; then
    if ! cargo install-update -a; then
        FAILED_UPDATES+=("cargo install-update (Global Binaries)")
    fi
else
    echo -e "${YELLOW}Notice: 'cargo-install-update' is not installed.${NC}"
    echo "To update global binaries, install it first using: cargo install cargo-update"
fi

# 4. Update Flatpaks
log_status "Updating Flatpak Packages"
if ! flatpak update -y; then
    FAILED_UPDATES+=("flatpak")
fi

# Summary Report
echo -e "\n${GREEN}[=== Update Summary ===]${NC}"
if [ ${#FAILED_UPDATES[@]} -eq 0 ]; then
    echo -e "${GREEN}✔ All updates completed successfully!${NC}"
else
    echo -e "${RED}✘ Some updates encountered errors:${NC}"
    for target in "${FAILED_UPDATES[@]}"; do
        echo -e "  - ${RED}${target}${NC}"
    done
fi
