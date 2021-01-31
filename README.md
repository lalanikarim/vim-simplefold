Vim-SimpleFold
==============

Overview
--------

vim-simplefold allows you to fold code within braces `{}`, parenthesis `()`, 
and brackets `[]`, as well as multi line comments between `/*` and `*/`.

Installation
------------

Vim Plug
```
Plug 'lalanikarim/vim-simplefold'
```

Usage
-----

To setup fold markers in a code file, run the following function in Normal mode

```
:call SimpleFold()
```

You can also map it to a keyboard shortcut:

```
:nnoremap <leader>f :call SimpleFold()<CR>
```
