
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

* Image

https://github.com/kis9a/SmartCaseMatch/assets/65019715/8dfd660f-0f64-4978-a3b5-4100c1b4b5b1
