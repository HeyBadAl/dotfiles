local mapkey = require("util.keymapper").mapkey

-- Buffer Navigation
mapkey("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
mapkey("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
-- mapkey("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
-- mapkey("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
mapkey("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
mapkey("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Directory Navigatio}n
mapkey("<leader>m", "NvimTreeFocus", "n")
mapkey("<leader>e", "NvimTreeToggle", "n")

-- Pane and Window Navigation
mapkey("<C-h>", "<C-w>h", "n") -- Navigate Left
mapkey("<C-j>", "<C-w>j", "n") -- Navigate Down
mapkey("<C-k>", "<C-w>k", "n") -- Navigate Up
mapkey("<C-l>", "<C-w>l", "n") -- Navigate Right
mapkey("<C-h>", "wincmd h", "t") -- Navigate Left
mapkey("<C-j>", "wincmd j", "t") -- Navigate Down
mapkey("<C-k>", "wincmd k", "t") -- Navigate Up
mapkey("<C-l>", "wincmd l", "t") -- Navigate Right

-- resize window using <ctrl> arrow keys
mapkey("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
mapkey("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
mapkey("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
mapkey("n", "<C-Right>", "<cmd>vertical resize +1<cr>", { desc = "Increase window width" })

-- Window Management
mapkey("<leader>sv", "vsplit", "n") -- Split Vertically
mapkey("<leader>sh", "split", "n") -- Split Horizontally

-- clear search highlight
mapkey("n", "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- add undo break-points
-- mapkey("i", ",", ",<c-g>u")
-- mapkey("i", ".", ".<c-g>u")
-- mapkey("i", ";", ";<c-g>u")
--
-- save file
-- mapkey({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- keywordprg
mapkey("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- new file
mapkey("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- Indenting
vim.keymap.set("v", "<", "<gv", { silent = true, noremap = true })
vim.keymap.set("v", ">", ">gv", { silent = true, noremap = true })

-- Show Full File-Path
mapkey("<leader>pa", "echo expand('%:p')", "n") -- Show Full File Path

local api = vim.api

-- Zen Mode
api.nvim_set_keymap("n", "<leader>zn", ":TZNarrow<CR>", {})
api.nvim_set_keymap("v", "<leader>zn", ":'<,'>TZNarrow<CR>", {})
api.nvim_set_keymap("n", "<leader>sm", ":TZFocus<CR>", {})
api.nvim_set_keymap("n", "<leader>zm", ":TZMinimalist<CR>", {})
api.nvim_set_keymap("n", "<leader>za", ":TZAtaraxis<CR>", {})

-- Comments
api.nvim_set_keymap("n", "<C-_>", "gcc", { noremap = false })
api.nvim_set_keymap("v", "<C-_>", "gcc", { noremap = false })

-- Notes
mapkey("<leader>ng", "Neorg workspace general", "n")
mapkey("<leader>nw", "Neorg workspace work", "n")
mapkey("<leader>ny", "Neorg workspace youtube", "n")

-- lazygit
mapkey("<leader>gg", "LazyGit", "n")

-- quit all
mapkey("<leader>qq", "qa", "n")

-- floating terminal
mapkey("<leader>t", "ToggleTerm", "n")
