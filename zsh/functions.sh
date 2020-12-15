#!/bin/zsh

# Pull .dotfiles and private submodule
function update-dotfiles() {
  CURRENT_PATH="$(pwd)"
  cd "${ZDOTDIR:-$HOME}/.dotfiles/"
  git pull --recurse-submodules
  cd $CURRENT_PATH
  source ~/.zshrc
}


# Platform specific functions
case "$OSTYPE" in

  # ~ macOS ~
  darwin*)
    alias localip="ipconfig getifaddr en0"
  ;;

  # ~ WSL (Bash on Windows 10) ~
  linux-gnu)
    alias localip="hostname -I"
  ;;

esac


alias ip="dig +short myip.opendns.com @resolver1.opendns.com" # uses dnsutils


# View HTTP traffic
alias sniff="sudo ngrep -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""


# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"


# tree commands
alias tree2="tree -a -L 2 -I \"node_modules|.git|scripts|.DS_Store|.idea\" ."


# Convert .otf to .ttf
# uses cli utilities from fontforge - https://github.com/fontforge/fontforge 
otf2ttf() {
	fontforge  -c 'Open('"$1"'); Generate('"$2"')'
}


# Download website with assets using wget
download-website() {
	wget --recursive --no-clobber --page-requisites --adjust-extension --span-hosts --convert-links --restrict-file-names=windows --domains "$1" --no-parent "$1"
}


# Jpegoptim recursive
function jpegoptim-recursive() {
	find -type f -name "*.jpg" -exec jpegoptim -m 80 --all-progressive -s -p {} \;
}


# Rename numerically every matching file given an extension ($1 parameter).
# Result will be a 3-digit filename (ie.: 001.jpg)
function renumber() {
	if [[ "$1" != "" ]]; then
		i=0; for f (*.$1) zmv $f '${(l:3::0:)$((++i))}'.$1
	else
		echo "Specify file extension"
		echo "ie.: renumber jpg"
	fi
}

# Change extensions of every matching file
# from filename.$1 to filename.$2
function changeext() {
  if [[ "$1" != "" ]] || [[ "$2" != "" ]]; then
    for f in *.$1; do 
      mv -- "$f" "${f%.$1}.$2"
    done
	else
		echo "Specify starting and destination extensions"
		echo "ie.: changeext png jpg"
	fi
}


# https://gist.github.com/Hecsall/f857b15ef1c97abe489c2c22d16be4c9
function m3ugen() {
  ### - Help text
  if [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]] || [ -z "$1" ]
    then
			echo ""
			echo "M3Ugen"
			echo "Create am .m3u8 playlist with all the files contained in the root of the specified directory."
			echo "Scanned files: .flac, .mp3, .mp4, .wav, .aac, .ogg, .m4a"
			echo ""
      echo "Usage:"
      echo "  `basename $0` -f <music_folder_path>"
      echo "  `basename $0` -f <music_folder_path> [-n <playlist_title>]"
      echo "  `basename $0` -f <music_folder_path> [-o <ordering>] [-n <playlist_title>]"
			echo ""
      echo "Options:"
      printf '%-25s %-40s\n' "  -h, --help" "Display this message"
      printf '%-25s %-40s\n' "  -f"         "Folder where the songs are"
      printf '%-25s %-40s\n' "  -o"         "Songs order, default: -date"
      printf '%-25s %-40s\n' ""             "Possible values: date, -date, name, -name"
      printf '%-25s %-40s\n' "  -n"         "Name of the .m3u file but without extension, default: playlist"
      return 0
  fi


  ### - Parse parameters
  while getopts f:o:n:h option
  do
    case "$option" in
    f) # Songs folder path - required
      SONGSPATH=$(echo $OPTARG | sed 's:/*$::') # Remove trailing slash
      ;;
    o) # Songs order - optional
      if [[ "$OPTARG" == "name" ]] || 
         [[ "$OPTARG" == "-name" ]] || 
         [[ "$OPTARG" == "date" ]] || 
         [[ "$OPTARG" == "-date" ]]
        then
          ORDER=$OPTARG
      else
        echo "\nInvalid value for option -o \nPossible values: \nname, -name, date, -date"
        return 0
      fi
      ;;
    n)
      PLAYLIST_NAME=$OPTARG
      ;;
    *)
      echo "Invalid option received, use -h for help."
      return
      ;;
    esac
  done


  ### - Check if every parameter is ok
  if [ -z "$PLAYLIST_NAME" ]
    then
      PLAYLIST_NAME="playlist" # Default playlist title if not specified
  fi
  if [ -z "$SONGSPATH" ]
    then
      # If missing songs path display error and exit
      echo "Missing songs path (-f <your_path>)"
      return
  fi
  if [ -z "$ORDER" ]
    then
      ORDER="-date" # Default song ordering if not specified
  fi


  ### - Delete old playlist file if exists
  if [[ -f "$SONGSPATH"/"$PLAYLIST_NAME".m3u8 ]]; then
    rm -f "$SONGSPATH"/"$PLAYLIST_NAME".m3u8
  fi


  ### - Create new .m3u8 file with songs from $SONGSPATH folder
  if [[ "$ORDER" == "name" ]]
    then
      ls -1 "$SONGSPATH" |grep -i -E ".flac$|.mp3$|.mp4$|.wav$|.aac$|.ogg$|.m4a$" > "$SONGSPATH"/"$PLAYLIST_NAME".m3u8
  elif [[ "$ORDER" == "-name" ]]
    then
      ls -r1 "$SONGSPATH" |grep -i -E ".flac$|.mp3$|.mp4$|.wav$|.aac$|.ogg$|.m4a$" > "$SONGSPATH"/"$PLAYLIST_NAME".m3u8
  elif [[ "$ORDER" == "date" ]]
    then
      ls -tr1 "$SONGSPATH" |grep -i -E ".flac$|.mp3$|.mp4$|.wav$|.aac$|.ogg$|.m4a$" > "$SONGSPATH"/"$PLAYLIST_NAME".m3u8
  elif [[ "$ORDER" == "-date" ]]
    then
      ls -t1 "$SONGSPATH" |grep -i -E ".flac$|.mp3$|.mp4$|.wav$|.aac$|.ogg$|.m4a$" > "$SONGSPATH"/"$PLAYLIST_NAME".m3u8
  fi

  unset SONGSPATH
  unset ORDER
  unset PLAYLIST_NAME
}


# Function useful to find "big" files inside a git repo
function git-large-files() {
	git rev-list --objects --all \
	| git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' \
	| sed -n 's/^blob //p' \
	| sort --numeric-sort --key=2 \
	| cut -c 1-12,41- \
	| $(command -v gnumfmt || echo numfmt) --field=2 --to=iec-i --suffix=B --padding=7 --round=nearest
}


# Convert image formats
# magick mogrify
