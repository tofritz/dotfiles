  ## Enable autocompletions
autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

zmodload -i zsh/complist

## History settings
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

## Options
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances of the shell
setopt auto_cd # cd by typing directory name if it's not a command
setopt correct_all # autocorrect commands
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match

## Autocompletion Style
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion

## Load Antibody
source <(antibody init)

## Bundle Up
antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle zsh-users/zsh-completions
antibody bundle zsh-users/zsh-history-substring-search
antibody bundle zdharma/fast-syntax-highlighting
antibody bundle ael-code/zsh-colored-man-pages
antibody bundle Tarrasch/zsh-command-not-found
antibody bundle denysdovhan/spaceship-prompt

## Keybindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

## Aliases
alias ls='lsd -lAF'

## Spaceship Prompt Settings
SPACESHIP_PROMPT_ORDER=(
  # time          # Time stamps section
  # user          # Username section
  # host          # Hostname section
  char          # Prompt character
  dir           # Current directory section
  # git           # Git section (git_branch + git_status)
  # hg            # Mercurial section (hg_branch  + hg_status)
  # package       # Package version
  # #node          # Node.js section
  # ruby          # Ruby section
  # elixir        # Elixir section
  # xcode         # Xcode section
  # swift         # Swift section
  # golang        # Go section
  # php           # PHP section
  # rust          # Rust section
  # haskell       # Haskell Stack section
  # julia         # Julia section
  # docker        # Docker section
  # aws           # Amazon Web Services section
  # venv          # virtualenv section
  # conda         # conda virtualenv section
  # pyenv         # Pyenv section
  # dotnet        # .NET section
  # ember         # Ember.js section
  # kubecontext   # Kubectl context section
  # terraform     # Terraform workspace section
  exec_time     # Execution time
  # line_sep      # Line break
  # battery       # Battery level and status
  # vi_mode       # Vi-mode indicator
  # jobs          # Background jobs indicator
  # exit_code     # Exit code section
)



# SPACESHIP_PROMPT_FIRST_PREFIX_SHOW="true"
# SPACESHIP_PROMPT_ADD_NEWLINE="true"
SPACESHIP_CHAR_SYMBOL=("")
SPACESHIP_CHAR_PREFIX=("  ")
SPACESHIP_CHAR_SUFFIX=("  ")
SPACESHIP_CHAR_COLOR_SUCCESS="white"
# SPACESHIP_PROMPT_DEFAULT_PREFIX="$HOST"
# SPACESHIP_PROMPT_FIRST_PREFIX_SHOW="true"
# SPACESHIP_USER_SHOW="true"

# SPACESHIP_DIR_PREFIX="%{$fg[blue]%}┌─[%b "
# SPACESHIP_DIR_SUFFIX="%{$fg[blue]%} ] "
# SPACESHIP_CHAR_SYMBOL="%{$fg[blue]%}└─▪%b "

# Ruby setup
export PATH=/usr/local/opt/ruby/bin:$PATH
eval "$(rbenv init -)"
export PATH=$HOME/.gem/ruby/2.6.0/bin:$PATH