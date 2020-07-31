if empty($NVIM_HOME)
    $NVIM_HOME=$HOME/.config/nvim
endif

source $NVIM_HOME/settings.vim
source $NVIM_HOME/color.vim

" see https://github.com/junegunn/vim-plug
call plug#begin('$NVIM_HOME/plugged')
source $NVIM_HOME/plugins.vim
call plug#end()
source $NVIM_HOME/plugins-config.vim

source $NVIM_HOME/keys.vim
source $NVIM_HOME/functions.vim
" source $NVIM_HOME/coc.vim


