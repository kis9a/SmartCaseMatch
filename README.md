# SmartCaseMatch

## Overview 

SmartCaseMatch is a vim plugin created to simplify the use of [vim-scripts/SmartCase](https://github.com/vim-scripts/SmartCase). SmartCaseMatch split the string with a separator and search the string in all cases.

The advantage of [vim-scripts/SmartCase](https://github.com/vim-scripts/SmartCase) is its simplicity. The SmartCase functions provided work very well and can replace string while maintaining the original string case. It will also be easy to understand the processing of the functions. However, replacement of strings containing numbers or considering plurals is not supported, so if more advanced replacement is required, it is recommended to use [tpope/vim-abolish](https://github.com/tpope/vim-abolish).

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

nnoremap s* :SmartCaseMatchCursorString<CR>
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
