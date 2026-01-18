# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'
alias wegc203108='ssh -X  thk@wegc203108.uni-graz.at'
alias cd='z'
alias inv='nvim $(fzf -m --preview="bat --color=always {}")'
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1
alias mount108='sshfs thk@wegc203108.uni-graz.at:/nas/home/thk/ ~/external/wegc203108/'
alias mount108_home='sshfs thk@wegc203108.uni-graz.at:/home/ ~/external/wegc203108/'
alias unmount108='fusermount -u ~/external/wegc203108/'

open_all() {
    # Check if a search string was provided
    if [ -z "$1" ]; then
        echo "Usage: open_all 'search_string'"
        return 1
    fi

    # Find files and open them in Neovim
    # -l: only filenames, -0: null-terminated to handle filenames with spaces
    files=$(rg -l "$1")

    if [ -z "$files" ]; then
        echo "No files found containing: $1"
    else
        nvim $files
    fi
}


alias bizhawk='/home/thk/bizhawk/EmuHawkMono.sh'
