remove_snaps() {
    echo -e "\033[1;34mListing installed snap packages...\033[0m"
    snap_pkgs=$(snap list | awk 'NR>1 {print $1}')

    for pkg in $snap_pkgs; do
        if [[ "$pkg" != "snapd" ]]; then
            echo -e "\033[1;33mRemoving snap package: $pkg\033[0m"
            sudo snap remove --purge "$pkg" 2>/dev/null || echo -e "\033[1;31mFailed to remove $pkg.\033[0m"
        fi
    done

    echo -e "\033[1;34mRechecking for remaining snap packages...\033[0m"
    for pkg in $(snap list | awk 'NR>1 {print $1}'); do
        echo -e "\033[1;33mAttempting to remove snap package: $pkg\033[0m"
        sudo snap remove --purge "$pkg" 2>/dev/null || echo -e "\033[1;31mFailed to remove $pkg.\033[0m"
    done

    if [ "$(snap list | wc -l)" -gt 1 ]; then
        echo -e "\033[1;34mSome snap packages are still present. Retrying...\033[0m"
        remove_snaps
    else
        echo -e "\033[1;32mAll snap packages removed successfully.\033[0m"
    fi
}

if command -v snap >/dev/null 2>&1; then
    echo -e "\033[1;35mStarting the removal of snap and all its packages...\033[0m"

    remove_snaps >/dev/null

    echo -e "\033[1;34mRemoving snapd and related packages...\033[0m"
    sudo apt autoremove --purge snapd gnome-software-plugin-snap -y >/dev/null 2>&1 || echo -e "\033[1;31mFailed to remove snapd and gnome-software-plugin-snap.\033[0m"

    echo -e "\033[1;34mCleaning up snap-related directories...\033[0m"
    sudo rm -rf /var/cache/snapd/ /var/lib/snapd/ /var/snap/ /snap /etc/snap >/dev/null 2>&1
    rm -rf ~/snap >/dev/null 2>&1

    echo -e "\033[1;34mMarking snapd as held to prevent reinstallation...\033[0m"
    sudo apt-mark hold snapd >/dev/null 2>&1

    echo -e "\033[1;32mSnap removal process completed successfully!\033[0m"
else
    echo -e "\033[1;31mSnap is not installed on this system.\033[0m"
fi