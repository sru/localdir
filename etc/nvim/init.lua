vim.g.mapleader = ' '

vim.g.netrw_home = vim.fn.stdpath("state")

vim.o.background = "light"
vim.o.pumborder = "single"
vim.o.winborder = "single"
vim.o.list = true
vim.o.listchars = "tab:>-,extends:>,precedes:<,trail:-"
vim.o.number = false
vim.o.shortmess = "aoOtTWICF"
vim.o.ruler = false
vim.o.showmatch = false
vim.o.wrap = false
vim.o.laststatus = 3
vim.o.statusline = " %f %m%r %= %l/%L:%v "

vim.o.autoindent = true
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.softtabstop = -1

vim.o.encoding = "utf-8"
vim.o.confirm = false
vim.opt.cpoptions:remove({ "_" })
vim.o.formatoptions = "ro/qj"
vim.o.joinspaces = true

vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.smartcase = true

vim.o.modeline = false
vim.o.undofile = true
vim.o.undolevels = 1000
vim.o.wildmenu = true
vim.o.wildmode = "list:longest"

vim.cmd.colorscheme("seon")
vim.cmd("filetype indent off")

-- Declare autocmd group and remove all existing autocmds for the group.
local autocmd_id = vim.api.nvim_create_augroup("vimrc", {
  clear = true
})

vim.api.nvim_create_autocmd("FileType", {
  group = autocmd_id,
  desc = "Override formatoptions.",
  callback = function() vim.o.formatoptions = "ro/qj" end,
})

require("trailing-whitespace")

vim.pack.add({
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/stevearc/oil.nvim",
})

require("mini.misc").setup()
local now = function(f) MiniMisc.safely("now", f) end
local later = function(f) MiniMisc.safely("later", f) end

now(function() require("oil").setup() end)

later(function()
  vim.diagnostic.config({
    underline = true,
    virtual_text = false,
    virtual_lines = false,
    signs = false,
    float = {
      border = "single",
      source = "if_many",
      header = "",
      focusable = false,
    },
  })
end)

later(function() require("mini.ai").setup() end)
later(function() require("mini.align").setup() end)
later(function() require("mini.operators").setup() end)
later(function() require("mini.splitjoin").setup() end)
later(function() require("mini.surround").setup() end)

later(function() require("mini.bracketed").setup() end)
later(function() require("mini.bufremove").setup() end)
later(function() require("mini.pick").setup() end)

local new_scratch_buffer = function()
  vim.api.nvim_win_set_buf(0, vim.api.nvim_create_buf(true, true))
end

vim.keymap.set("n", "-", "<Cmd>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "_", "<Cmd>Oil getcwd()<CR>", { desc = "Open current directory" })

vim.keymap.set("n", "<Leader>ba", "<Cmd>b#<CR>", { desc = "Buffer alternate" })
vim.keymap.set("n", "<Leader>bd", "<Cmd>lua MiniBufremove.delete()<CR>", { desc = "Buffer delete" })
vim.keymap.set("n", "<Leader>bD", "<Cmd>lua MiniBufremove.delete(0, true)<CR>", { desc = "Buffer delete!" })
vim.keymap.set("n", "<Leader>bs", new_scratch_buffer, { desc = "Buffer scratch" })
vim.keymap.set("n", "<Leader>bw", "<Cmd>lua MiniBufremove.wipeout()<CR>", { desc = "Buffer wipeout" })
vim.keymap.set("n", "<Leader>bW", "<Cmd>lua MiniBufremove.wipeout(0, true)<CR>", { desc = "Buffer wipeout!" })

vim.keymap.set("n", "<Leader>fb", "<Cmd>Pick buffers<CR>", { desc = "Find buffers" })
vim.keymap.set("n", "<Leader>ff", "<Cmd>Pick files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<Leader>fg", "<Cmd>Pick grep_live<CR>", { desc = "Find grep live" })
vim.keymap.set("n", "<Leader>fG", '<Cmd>Pick grep pattern="<cword>"<CR>', { desc = "Find grep current word" })
vim.keymap.set("n", "<Leader>fr", "<Cmd>Pick resume<CR>", { desc = "Find resume" })

vim.keymap.set("n", "<Leader>la", "<Cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "LSP Action" })
vim.keymap.set("n", "<Leader>ld", "<Cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Diagnostic popup" })
vim.keymap.set("n", "<Leader>li", "<Cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "LSP Implementation" })
vim.keymap.set("n", "<Leader>lh", "<Cmd>lua vim.lsp.buf.hover()<CR>", { desc = "LSP Hover" })
vim.keymap.set("n", "<Leader>ll", "<Cmd>lua vim.lsp.codelens.run()<CR>", { desc = "LSP Code lens" })
vim.keymap.set("n", "<Leader>lr", "<Cmd>lua vim.lsp.buf.rename()<CR>", { desc = "LSP Rename" })
vim.keymap.set("n", "<Leader>lR", "<Cmd>lua vim.lsp.buf.references()<CR>", { desc = "LSP Reference" })
vim.keymap.set("n", "<Leader>ls", "<Cmd>lua vim.lsp.buf.definintions()<CR>", { desc = "LSP Definition" })
vim.keymap.set("n", "<Leader>lt", "<Cmd>lua vim.lsp.buf.type_definitions()<CR>", { desc = "LSP Type definition" })
