# SmartCaseMatch

## Installation

Use your favorite plugin manager

Example: [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'kis9a/SmartCaseMatch'
```

## Configuration

```vim
set smartcase
set ignorecase

nnoremap s* :SmartCaseMatchCursorKeyword<CR>
xnoremap s* :<C-U>SmartCaseMatchVisualSelected<CR>
```

## Use with vim-scripts/SmartCase

* Install [vim-scripts/SmartCase](https://github.com/vim-scripts/SmartCase)

```vim
Plug 'vim-scripts/SmartCase'
```

* Example mappings

```vim
nnoremap <Leader>sc :%SmartCase("")<Left><Left>
xnoremap <Leader>sc :'<,'>%SmartCase("")<Left><Left>
```

<image width="640px" src="https://raw.githubusercontent.com/kis9a/SmartCaseMatch/main/doc/smartcasematch_01.gif"></image>

```vim
nnoremap sg :vimgrep <C-R>=string(SmartCaseMatchPattern(''))<Left><Left><Left>
nnoremap <Leader>sg :cdo s/<C-R>=printf(g:smartcasematch_last_mached_pattern)<CR>/\=SmartCase('')<Left><Left>
```

<image width="640px" src="https://raw.githubusercontent.com/kis9a/SmartCaseMatch/main/doc/smartcasematch_02.gif"></image>
