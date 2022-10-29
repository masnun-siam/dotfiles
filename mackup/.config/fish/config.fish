set fish_greeting ""

set -gx TERM xterm-256color

starship init fish | source
zoxide init fish | source

# Ctrl + l to clear screen
bind \cl 'for i in (seq 1 $LINES); echo; end; clear; commandline -f repaint'

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

set -U BAT_THEME Dracula 
set -U EDITOR nvim
set -U FZF_CTRL_R_OPTS "--reverse --preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
set -U FZF_DEFAULT_COMMAND "fd -H -E '.git'"
set -U FZF_DEFAULT_OPTS "--color=spinner:#F8BD96,hl:#F28FAD --color=fg:#D9E0EE,header:#F28FAD,info:#DDB6F2,pointer:#F8BD96 --color=marker:#F8BD96,fg+:#F2CDCD,prompt:#DDB6F2,hl+:#F28FAD"
set -U FZF_TMUX_OPTS "-p"
# set -U GOPATH (go env GOPATH)
set -U KIT_EDITOR /opt/homebrew/bin/nvim
set -U LANG en_US.UTF-8
set -U LC_ALL en_US.UTF-8

set -g CRAFTED_EMACS_HOME ~/.config/crafted-emacs

# aliases
# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

alias g git
alias less bat
alias lfyt='/Users/siam/.config/lf/lf-gadgets/lf-yt/lf-yt'
command -qv nvim && alias vim nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH /usr/local/go
fish_add_path -g $GOPATH/bin
fish_add_path -g ~/.config/bin
fish_add_path -g /usr/local/bin
fish_add_path -g ~/.pub-cache/bin

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
    status --is-command-substitution; and return

    if test -f .nvmrc; and test -r .nvmrc
        nvm use
    else
    end
end

switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-osx.fish
    case Linux
        source (dirname (status --current-filename))/config-linux.fish
    case '*'
        source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end

fish_add_path -g /opt/homebrew/bin
fish_add_path -g /opt/homebrew/sbin

# Setting PATH for Python 3.10
# The original version is saved in /Users/siam/.config/fish/config.fish.pysave
fish_add_path -g "/Library/Frameworks/Python.framework/Versions/3.10/bin"

# FLutter Setup
fish_add_path -g ~/Tools/flutter/bin
fish_add_path -g ~/Tools/flutter/bin/cache/dart-sdk/bin
fish_add_path -g "/Applications/Android Studio.app/Contents/jre/Contents/Home/bin"
fish_add_path -g /opt/homebrew/opt/gnu-sed/libexec/gnubin
set -g JAVA_HOME "/Applications/Android Studio.app/Contents/jre/Contents/Home"
# set -g ANDROID_SDK_HOME ~/Library/Android/sdk
fish_add_path -g ~/Library/Android/sdk/platform-tools
fish_add_path -g ~/Library/Android/sdk/tools
fish_add_path -g $HOME/Tools/flutter/.pub-cache/bin

# doom
alias doom "~/.emacs.d/bin/doom"
alias ani "ani-cli"
alias dra "/usr/local/bin/dra-cla"
alias anic "ani-cli -q 720 -c"
alias drac "/usr/local/bin/dra-cla -c"
alias vi nvim
alias vim nvim

# Set manpager
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

# The bangbang command
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

if [ "$fish_key_bindings" = "fish_vi_key_bindings" ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end


function lvimr 
	vimr --nvim -u ~/.local/share/lunarvim/lvim/init.lua --cmd "set runtimepath+=~/.local/share/lunarvim/lvim" "@"
end
fish_add_path -g /Users/siam/.yarn/bin
fish_add_path -g /opt/local/bin

function backup --argument filename
    cp $filename $filename.bak
end

function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
	set from (echo $argv[1] | trim-right /)
	set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end

# ex: echo 1 2 3 | coln 3
# output: 3
function coln
    while read -l input
        echo $input | awk '{print $'$argv[1]'}'
    end
end

# Function for printing a row
# ex: seq 3 | rown 3
# output: 3
function rown --argument index
    sed -n "$index p"
end

# Function for ignoring the first 'n' lines
# ex: seq 10 | skip 5
# results: prints everything but the first 5 lines
function skip --argument n
    tail +(math 1 + $n)
end


# Function for taking the first 'n' lines
# ex: seq 10 | take 5
# results: prints only the first 5 lines
function take --argument number
    head -$number
end

# Play audio files in current dir by type
alias playwav='deadbeef *.wav'
alias playogg='deadbeef *.ogg'
alias playmp3='deadbeef *.mp3'

# Play video files in current dir by type
alias playavi='iina *.avi'
alias playmov='iina *.mov'
alias playmp4='iina *.mp4'


# fish_default_key_bindings

fish_vi_key_bindings

set -U fish_color_autosuggestion grey
set -U fish_color_command normal
set -U fish_color_error red
set -U fish_color_param cyan
set -U fish_color_redirections yellow
set -U fish_color_terminators white
set -U fish_color_valid_path green


# abbreviations
abbr q "exit"
abbr :bd "exit"
abbr :q "tmux kill-server"
abbr ast "aw set -t (aw list | fzf-tmux -p --reverse --preview 'aw set -t {}')"
abbr bc "brew cleanup"
abbr bd "brew doctor"
abbr bi "brew install"
abbr bic "brew install --cask"
abbr bif "brew info"
abbr bifc "brew info --cask"
abbr bo "brew outdated"
abbr bs "brew services"
abbr bsc "brew search"
abbr bsr "brew services restart"
abbr bu "brew update"
abbr bug "brew upgrade; brew reinstall neovim"
abbr c "clear"
abbr cl "clear"
abbr claer "clear"
abbr clera "clear"
abbr cx "chmod +x"
abbr dc "docker compose"
abbr dcd "docker compose down"
abbr dcdv "docker compose down -v"
abbr dcr "docker compose restart"
abbr dcu "docker compose up -d" 
abbr dps "docker ps --format 'table {{.Names}}\t{{.Status}}'"
abbr e "exit"
abbr ee "espanso edit"
abbr er "espanso restart"
abbr g "git status"
abbr ga "git add ."
abbr gb "git branch -v"
abbr gc "git commit"
abbr gca "git commit -av"
abbr gcl "git clone"
abbr gco "git checkout -b"
abbr gcom "~/.config/bin/git-to-master-cleanup-branch.sh"
abbr gd "git diff"
abbr gf "git fetch --all"
abbr gl "git pull"
abbr gma "git merge --abort"
abbr gmc "git merge --continue"
abbr gp "git push"
abbr gpom "git pull origin main"
abbr gpr "gh pr create"
abbr gpum "git pull upstream master"
abbr gr "git remote"
abbr gra "git remote add"
abbr grao "git remote add origin"
abbr grau "git remote add upstream"
abbr grv "git remote -v"
abbr gs "git status"
abbr gst "git status"
abbr hd "history delete --exact --case-sensitive \'(history | fzf-tmux -p -m --reverse)\'"
abbr l "lsd  --group-dirs first -A"
abbr lg "lazygit"
abbr ll "lsd  --group-dirs first -Al"
abbr lt "lsd  --group-dirs last -A --tree"
abbr nf "neofetch"
abbr rmr "rm -rf"
abbr sa "SwitchAudioSource -t output -s (SwitchAudioSource -t output -a | fzf-tmux -p --reverse)"
abbr sai "SwitchAudioSource -t input -s (SwitchAudioSource -t input -a | fzf-tmux -p --reverse)"
abbr sao "SwitchAudioSource -t output -s (SwitchAudioSource -t output -a | fzf-tmux -p --reverse)"
abbr sf "source ~/.config/fish/config.fish"
abbr st "tmux source ~/.config/tmux/tmux.conf"
abbr ta "tmux a"
abbr tat "tmux attach -t"
abbr td "t dotfiles"
abbr tn "t nutiliti"
abbr tn "tmux new -s (pwd | sed 's/.*\///g')"
abbr u "~/.config/bin/update.sh"
abbr v "nvim (fd --type f --hidden --follow --exclude .git | fzf-tmux -p --reverse)"
abbr va "nvim ~/.config/alacritty/alacritty.yml"
abbr vf "nvim ~/.config/fish/config.fish"
abbr vpc "nvim +PackerClean"
abbr vps "nvim +PackerSync"
abbr vpi "nvim +PackerInstall"
abbr vpu "nvim +PackerUpdate"
abbr vpug "nvim +PackerUpgrade"
abbr vt "nvim ~/.config/tmux/tmux.conf"
abbr lv "lvim (fd --type f --hidden --follow --exclude .git | fzf-tmux -p --reverse)"
abbr lva "lvim ~/.config/alacritty/alacritty.yml"
abbr lvf "lvim ~/.config/fish/config.fish"
abbr lvpc "lvim +PackerClean"
abbr lvps "lvim +PackerSync"
abbr lvpi "lvim +PackerInstall"
abbr lvpu "lvim +PackerUpdate"
abbr lvpug "lvim +PackerUpgrade"
abbr lvt "lvim ~/.config/tmux/tmux.conf"
abbr fpg "flutter pub get"
abbr fpu "flutter pub upgrade"
abbr fpum "flutter pub upgrade --major-versions"
abbr fbb "flutter pub run build_runner build --delete-conflicting-outputs"
abbr fbw "flutter pub run build_runner watch --delete-conflicting-outputs"
abbr fpa "flutter pub add"
abbr fpad "flutter pub add --dev"
abbr spoonupdate "cd ~/.hammerspoon/Spoons/VimMode.spoon && git pull"
