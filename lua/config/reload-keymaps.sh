#!/bin/bash

# work in progress so that when changing keyboard layout mid nvim session it doesn't mess up binds

# Send a command to running Neovim instance to reload keymaps.lua
nvim --server /tmp/nvim.sock --remote-expr "dofile(vim.fn.stdpath('config') .. '/lua/keymaps.lua')"
