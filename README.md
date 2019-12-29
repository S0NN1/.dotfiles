[![Mirrored repo](https://img.shields.io/static/v1?label=Mirroring&message=GitLab%20%3E%20GitHub&color=blue)](https://gitlab.com/Hecsall/dotfiles)

# Dotfiles
Just a dotfiles repo with my aliases, functions and zsh configurations.\
I mainly work on macOS, but sometimes i work on Windows using WSL (Windows Subsystem for Linux). Visual Studio Code is my primary code editor and I (rarely) use nano when I have to make small changes from terminal.

## **Requirements**
- [ZSH](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH)
- [Prezto](https://github.com/sorin-ionescu/prezto#installation) 
	(stop at the git clone, don't do the rest)
- [Prezto contrib](https://github.com/belak/prezto-contrib#usage) (necessary for spaceship prompt)
- [Spaceship prompt](https://denysdovhan.com/spaceship-prompt/)
    ```sh
    $ npm install -g spaceship-prompt
    ```
- [Powerline Fonts](https://github.com/powerline/fonts#installation) 
	(optional, needed only if you want strange symbols or similar things)


## **Installation**

> **Please note:**\
inside `.zshrc` and `install.sh` you will find some lines referring to files inside the `private/` folder.\
Thats a *private git submodule* where i store other aliases and configurations that contains sensitive data (such as IP addresses , ports or git configurations).\
The install script will ignore those lines.

Run the `install.sh` file.\
If you already have those `".zsomething"` files, make sure to backup them, because the installer will overwrite any existing symlink.
```sh
$ ./install.sh
```

This will symlink the config files to the correct paths, just make sure you don't move the dotfiles folder elsewhere after running the install (it will break the symlinks, you know).
I use to keep that folder in `~/.dotfiles`

That's all.

---

## **Other notes**

**Python**
- I usually use Python 3.7
- When working on different python projects i use virtual environments: Python 3 ships with "venv" builtin.\
    Create the env:
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
- I prefer to use Node 10.17.0 since some packages still do not support Node 12 
- I use **nvm** ([Node Version Manager](https://github.com/nvm-sh/nvm)) to manage different versions of Node:\
    This will install Node 10.17.0 as the "default" Node
    ```sh
    $ nvm install 10.17.0
    ```
    Then this will install Node 12.13.0 as supplementary version
    ```sh
    $ nvm install 12.13.0
    ```
    Switch version like this
    ```sh
    # Use Node 12.13.0
    $ nvm use 12
    # Now go back to the "default" (Node 10.17.0)
    $ nvm use default
    ```