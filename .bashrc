# Bash profile

## ENVIRONMENT VARIABLES
export client=us01odcvde32190
export user=frazao
export proj="/c/Users/frazao/OneDrive - Synopsys, Inc/Documents/Projects"
export mat="/c/Users/frazao/Coisas/material"
export bashrc="/c/Users/frazao/.bashrc"
export EDITOR="code"

## ALIAS
# git - also, use as a reference table
alias gs='git status'
alias gl='git log'
alias gd='git diff'
alias ga='git add' # expecting <file>
alias gc='git commit -m' # expecting <msg>
alias gll='git pull origin' # expecting <branch> (default main)
alias gsh='git push origin' # expecting <branch> (default main)

alias ginit='git init' # expecting *blank*
alias gremote='git remote' # expecting: '-v' (for listing) | add origin <url> (for adding new origin) | set-url origin <url> (for setting the origin anew)
alias gclone='git clone' # expecting <url>
alias gbranch='git branch' # expecting: (*blank* - for listing) | <name> (for creating new branch)
alias gout='git checkout' # expecting: <branch> (for switching to branch) | -b <branch> (for switching to new branch)
alias gmerge='git merge' # expecting <branch> (for merging branch into master)

# deno
alias denodev='deno run --allow-net --allow-read --watch' # expecting <script_arg>
alias fresh='deno run -A -r https://fresh.deno.dev' # expecting <project>

# general
alias cmds="compgen -ac | grep" # expecting <filter> (it's generaly too big if not specified)
alias ls='ls --color=always'
alias la='ls -la'
alias l.="ls -ad .[!.]?*"
alias r='fc -s' # expecting [<old>=<new>] [<starting_with>] (to run previous command starting with given', and with substitution)
alias rm='rm -i'
alias mv='mv -i'
alias s='source'
alias ebashrc="code $bashrc"
alias sbashrc="source $bashrc"
alias cdbin='cd ~/bin'
alias cdmat="cd $mat"
alias cdpro="cd $proj"


# general (as functions)
function cd {
    builtin cd "$@" && ls
    # if [ -e .bashrc.local ]
    # then 
    #     . .bashrc.local
    # fi
}

# Prompt
    # Prompt line
PROMPTCOLOR="\e[1;95m"
TEXTCOLOR="\e[0m"
PS1="\n(\!) ${PROMPTCOLOR}\w > ${TEXTCOLOR}"
PS2="${PROMPTCOLOR}> ${TEXTCOLOR}"
PROMPT_DIRTRIM=2


# Functions that should be available on main thread
function act { # Activate certain stuff (like conda) on request
    on=$1
    case $on in
        conda)
            echo "Turning on conda..."
            source '/c/Users/frazao/Miniconda3/etc/profile.d/conda.sh'
            conda --version
            ;;
        *)
            echo "act: input not recognized. nothing was activated."
            echo "usage: act (conda)"
            ;;
    esac
}

function gfull { 
    message=${0:-'no need for message'}
    git add *
    git commit -m $message
    git push origin main
}

 
