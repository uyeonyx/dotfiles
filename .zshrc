###############################################################################
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

###############################################################################

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
        git
        sudo
        fzf
        alias-tips
        colored-man-pages
        zsh-syntax-highlighting
        zsh-autosuggestions
        zsh-history-substring-search
        zsh-completions
)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

###############################################################################

# used for gh cli auto completion
# see: https://cli.github.com/manual/gh_completion
[[ -d ~/.oh-my-zsh/completions ]] || mkdir ~/.oh-my-zsh/completions
gh completion -s zsh > ~/.oh-my-zsh/completions/_gh
autoload -U compinit
compinit -i

###############################################################################

alias ..='cd ..'
