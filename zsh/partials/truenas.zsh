
function update-jails() {
    # Get list of Jail names
    jails_names="$(jls -N name)"

    dotfiles_path="/root/.dotfiles"

    for jail_name in $jails_names; do 
        
        # Get Jail Hostname and Path inside TrueNAS
        jail_hostname="$(jls -j $jail_name -N host.hostname)";
        jail_path="$(jls -j $jail_name -N path)";

        echo ""
        echo "######  ${jail_hostname}  ######";

        # Installing dependencies

        # Check if zsh is installed, and install it if missing
        iocage exec $jail_hostname "hash zsh 2>/dev/null;" 2>/dev/null;
        if [ ! $? -eq 0 ]; then
            echo "Installing ZSH..."

            iocage exec $jail_hostname "pkg install -y zsh"
            iocage exec $jail_hostname "chsh -s /usr/local/bin/zsh"
        else
            echo "ZSH already installed"
        fi

        # Check if nano is installed, and install it if missing
        iocage exec $jail_hostname "hash nano 2>/dev/null;" 2>/dev/null;
        if [ ! $? -eq 0 ]; then
            iocage exec $jail_hostname "pkg install -y nano"
        else
            echo "Nano already installed"
        fi

        # Copy .dotfiles
        cp -rf ~/.dotfiles ${jail_path}/root
        iocage exec $jail_hostname "~/.dotfiles/install.sh"
        
    done
}