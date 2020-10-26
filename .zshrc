########################################
export LANG=ja_JP.UTF-8
autoload -Uz colors
colors

export PICTURES="~/Pictures"

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000 
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks

########################################
re-prompt() {
    zle .reset-prompt
    zle .accept-line
}

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd(){ vcs_info }

zle -N accept-line re-prompt
PROMPT="%B%F{cyan}%n%f%b%B%F{green}%~%f%b "
#RPROMPT="%B%F{yellow}[%*]%f%b"
RPROMPT="\$vcs_info_msg_0_ %B%F{yellow}[%*]%f%b"
########################################

#type miss
setopt correct

autoload -Uz select-word-style
	select-word-style default
		zstyle ':zle:*' word-chars " /=;@:{},|"
		zstyle ':zle:*' word-style unspecified

########################################
autoload -Uz compinit
compinit

zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
	/usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
zstyle ':completion:*:*:nvim:*:*files' ignored-patterns '*.png' '*.jpg' '*.jpeg' '*.pdf' '*.o' '*?~' '*\#' '\*$'

########################################
setopt print_eight_bit
setopt no_beep
setopt no_flow_control
setopt ignore_eof
setopt interactive_comments
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt extended_glob

########################################

bindkey '^R' history-incremental-pattern-search-backward
bindkey -v
########################################

alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -l'

alias ga='git add .'
alias gc='git commit -m '
alias gpom='git push origin master '
alias gpod='git push origin develop '
alias glog='git log --graph --all '

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vim='nvim'
alias mkdir='mkdir -p'
#alias python='python3'
alias inodo='ino build && ino upload'
alias newterm='gnome-terminal'
alias peda='gdb -nx -ix=~/.gdbinit_peda'
alias ivm='nvim'
alias emacs='(){echo "
                  ■■                                        ■■                                                                                    
                 ■■■■                                      ■■■■                               ■■■■■■■             ■■■■■■           ■■■■■■■■■      
                 ■■■■                                      ■■■■                             ■■■■■■■■■■          ■■■■■■■■■■         ■■■■■■■■■■■    
                                                                                           ■■■■■■ ■■■■■■       ■■■■■ ■■■■■■        ■■■    ■■■■■■  
                                                                                          ■■■■       ■■       ■■■■      ■■■■       ■■■       ■■■  
                                                                                         ■■■■                ■■■         ■■■■      ■■■        ■■■ 
                                                                                         ■■■                 ■■■          ■■■      ■■■        ■■■■
■■■         ■■■   ■■      ■■   ■■■■      ■■■■               ■■       ■■■■■■             ■■■                 ■■■           ■■■      ■■■         ■■■
 ■■■        ■■    ■■      ■■  ■■■■■■■  ■■■■■■■              ■■      ■■■■■■■■■           ■■■                 ■■■            ■■■     ■■■         ■■■
 ■■■       ■■■    ■■      ■■■■■■ ■■■■ ■■■■■■■■■             ■■     ■■■■   ■■■           ■■■                 ■■■            ■■■     ■■■         ■■■
  ■■       ■■■    ■■      ■■■■     ■■■■■    ■■■             ■■     ■■■                  ■■■                 ■■■            ■■■     ■■■          ■■
  ■■■      ■■     ■■      ■■■      ■■■       ■■■            ■■     ■■                   ■■■                 ■■■            ■■■     ■■■          ■■
  ■■■     ■■■     ■■      ■■       ■■■       ■■■            ■■     ■■■                  ■■■      ■■■■■■■    ■■■            ■■■     ■■■          ■■
   ■■     ■■■     ■■      ■■       ■■■       ■■■            ■■     ■■■■■                ■■■      ■■■■■■■    ■■■            ■■■     ■■■         ■■■
   ■■■    ■■      ■■      ■■       ■■■       ■■■            ■■       ■■■■■■             ■■■          ■■■    ■■■            ■■■     ■■■         ■■■
   ■■■   ■■■      ■■      ■■       ■■■       ■■■            ■■         ■■■■■            ■■■          ■■■    ■■■            ■■■     ■■■         ■■■
    ■■   ■■■      ■■      ■■       ■■■       ■■■            ■■           ■■■■           ■■■          ■■■    ■■■           ■■■      ■■■         ■■■
    ■■■  ■■       ■■      ■■       ■■■       ■■■            ■■             ■■            ■■■         ■■■     ■■■          ■■■      ■■■        ■■■ 
    ■■■ ■■■       ■■      ■■       ■■■       ■■■            ■■             ■■■           ■■■■        ■■■     ■■■■        ■■■■      ■■■        ■■■ 
     ■■ ■■■       ■■      ■■       ■■■       ■■■            ■■     ■       ■■             ■■■■       ■■■      ■■■■      ■■■■       ■■■      ■■■■  
     ■■■■■        ■■      ■■       ■■■       ■■■            ■■    ■■■■    ■■■              ■■■■■■ ■■■■■■       ■■■■■ ■■■■■■        ■■■    ■■■■■   
      ■■■■        ■■      ■■       ■■■       ■■■            ■■     ■■■■■■■■■                ■■■■■■■■■■■         ■■■■■■■■■■         ■■■■■■■■■■■    
      ■■■         ■■      ■■       ■■■       ■■■            ■■       ■■■■■■                   ■■■■■■■             ■■■■■■           ■■■■■■■■■      
" && sleep 1 && if [[ "$@" =~  - ]]; then vim $2; else vim $@; fi}'

alias sudo='sudo '
alias dl='docker ps -l -q'
alias -g L='| less'
alias -g G='| grep'
