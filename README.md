# SmartCaseMatch

## Overview 

SmartCaseMatch is a plugin created to simplify the use of [vim-scripts/SmartCase](https://github.com/vim-scripts/SmartCase). SmartCaseMatch decomposes a given string with delimiters and searches the string for all cases.

The advantage of [vim-scripts/SmartCase](https://github.com/vim-scripts/SmartCase) is its simplicity. The SmartCase functions provided work very well and can convert strings while preserving the string case. It will also be easy to understand the processing of the functions. However, conversion of strings containing numbers or taking plurals into account is not supported, so if more advanced conversion is required, it is recommended to use [tpope/vim-abolish](https://github.com/tpope/vim-abolish).

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
