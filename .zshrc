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

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

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
RPROMPT="\$vcs_info_msg_0_ %B%F{yellow}[%*]%f%b"
########################################

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    #PROMPT=$'%F{%(#.blue.green)}┌──${debian_chroot:+($debian_chroot)──}(%B%F{%(#.red.blue)}%n%(#.💀.㉿)%m%b%F{%(#.blue.green)})-[%B%F{reset}%(6~.%-1~/…/%4~.%5~)%b%F{%(#.blue.green)}]\n└─%B%(#.%F{red}#.%F{blue}$)%b%F{reset} '
    #RPROMPT=$'%(?.. %? %F{red}%B⨯%b%F{reset})%(1j. %j %F{yellow}%B⚙%b%F{reset}.)'

    # enable syntax-highlighting
    if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && [ "$color_prompt" = yes ]; then
	# ksharrays breaks the plugin. This is fixed now but let's disable it in the
	# meantime.
	# https://github.com/zsh-users/zsh-syntax-highlighting/pull/689
	unsetopt ksharrays
	. /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
	ZSH_HIGHLIGHT_STYLES[default]=none
	ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red,bold
	ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan,bold
	ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
	ZSH_HIGHLIGHT_STYLES[global-alias]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
	ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=green,underline
	ZSH_HIGHLIGHT_STYLES[path]=underline
	ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
	ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
	ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[command-substitution]=none
	ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[process-substitution]=none
	ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
	ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
	ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
	ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
	ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[assign]=none
	ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
	ZSH_HIGHLIGHT_STYLES[named-fd]=none
	ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
	ZSH_HIGHLIGHT_STYLES[arg0]=fg=green
	ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=green,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=cyan,bold
	ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout
    fi
else
    PROMPT='${debian_chroot:+($debian_chroot)}%n@%m:%~%# '
fi
unset color_prompt force_color_prompt



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

alias format='clang-format -i'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
#alias vim='nvim'
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
