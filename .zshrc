export ZSH="$HOME/.oh-my-zsh"


plugins=( 
    # other plugins...
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

 PS1='%F{255}⎇ %F{blue}%1~ %(?.%F{green}.%F{red})%#%f $vcs_info_msg_0_%f '
 alias makere="make re"
 alias ls="eza"
