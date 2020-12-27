[![Mirrored repo](https://img.shields.io/static/v1?label=Mirroring&message=GitLab%20%3E%20GitHub&color=blue)](https://gitlab.com/Hecsall/dotfiles)

# Dotfiles
Just a dotfiles repo with my aliases, functions and zsh configurations.\
I mainly work on macOS, but sometimes i work on Windows using WSL (Windows Subsystem for Linux). Visual Studio Code is my primary code editor and I use nano when I have to make small changes from terminal.

## **Requirements**
Before running the `install.sh` script, be sure to have all the required dependencies listed below:
- [ZSH](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH)
- [Nerd Fonts](https://www.nerdfonts.com/)\
    Nerd Fonts includes "dev icons" along with the normal font, i used `MesloLGMDZ Nerd Font` in my terminal and `CaskaydiaCove Nerd Font` in Visual Studio Code.

## **Installation**

> **Please note:**\
inside `.zshrc` and `install.sh` you will find some lines referring to files inside the `private/` folder.\
Thats a *private git submodule* where i store other aliases and configurations that contains sensitive data (such as IP addresses , ports or git configurations).\
The install script will ignore those lines.

The install script will create symlinks for the following files/folders:
- `~/.zshrc`
- `~/.nanorc`
- `~/.nano/`

If you already have any of the files/folders listed above, make sure to backup them, because the installer will overwrite any existing symlink.

Run the `install.sh` file.
```sh
$ chmod +x install.sh
$ ./install.sh
```

This will symlink the config files to the correct paths, just make sure you don't move the dotfiles folder elsewhere after running the install (it will break the symlinks, you know).
I use to keep that folder in `~/.dotfiles`

That's all.

---

## **Other notes**

**Python**
- I usually use Python 3
- When working on different python projects i use virtual environments: Python 3 ships with "venv" builtin.\
    To create the env:
    ```sh
    # I usually use "venv" as <env_name>
    $ python3 -m venv <env_name>
    ```
    Activate the env:
    ```sh
    $ source <env_name>/bin/activate
    ```
    Exit the env:
    ```sh
    $ deactivate
    ```

**Node JS**
- I prefer to use Node 12 
- I use **nvm** ([Node Version Manager](https://github.com/nvm-sh/nvm)) to manage different versions of Node:

    This will install Node 12 as the "default" Node
    ```sh
    $ nvm install 12
    ```
    Then this will install Node 10 as supplementary version (for project compatibility)
    ```sh
    $ nvm install 10
    ```
    Switch version like this
    ```sh
    # Use Node 10
    $ nvm use 10
    # Now go back to the "default" (Node 12)
    $ nvm use default # or nvm use 12
    ```