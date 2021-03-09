![Forked](https://img.shields.io/badge/Forked%20from-Hecsall%2Fdotfiles-green)

# .dotfiles

Just a dotfiles repo with my aliases, functions and zsh configurations. I created a python script to insert api keys, ssh configurations and so on.

Follow the original repo for a detailed info about each component.

## **Requirements**

Before running the `install.sh` script, be sure to have all the required dependencies listed below:

- [ZSH](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH)
- [Python3](https://www.python.org/)
- [Nerd Fonts](https://www.nerdfonts.com/) _\*optional_\
   Nerd Fonts includes "dev icons" along with the normal font, i used `MesloLGMDZ Nerd Font` in my terminal and `FiraCode Nerd Font` in Visual Studio Code. It's only really needed if you plan to use such icons.

## **Installation**

The install script will create symlinks for the following files/folders:

- `~/.zshrc`
- `~/.nanorc`
- `~/.nano/`
- `~/.gitconfig`

It will also move `pre-commit`, `pre-push` files under <current directory>/.dotfiles/.git/hooks (explained later on).

If you already have any of the files/folders listed above, make sure to backup them, because the installer will overwrite any existing file/symlink.

Run the `install.sh` file.

```sh
$ chmod +x install.sh
$ ./install.sh
```

This will symlink the config files to the correct paths, just make sure you don't move the dotfiles folder elsewhere after running the install (it will break the symlinks, you know).
I use to keep that folder in `~/.dotfiles`

That's all.

## **Python script**

The python script under `script` folder lets you keep your personal api keys and secrets.
In order to work it needs a folder called json and 3 files inside it: `gitconfig.json`, `aliases.json`, `functions.json` in which you can store your secrets like this:
```json
[
    {
        "name": "ssh",
        "content": "ssh <your personal alias>"
    }
]
```
The script has 3 options available:
- "-a" add and entry to a json file
- "-h" hide your personal info
- "-e" expose your personal info

The command is:
```bash
python3 script/crypt.py -<option> 
```
When committing you repo the `pre-comit` hook will ovveride your files and replace personal entries contained in your json with the related "safe" name.
When pushing, instead it will revert these changes.
