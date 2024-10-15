-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

--copy to clipboard
vim.keymap.set("v", "<C-c>", '"+y', { desc = "Copy to clipboard" })

--select all
vim.keymap.set("n", "<C-a>", "gg0vG$", { desc = "select all" })
