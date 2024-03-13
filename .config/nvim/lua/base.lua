-- Set up directories
local USER = os.getenv("USER")
local curr_group = vim.fn.system("id -ng 2> /dev/null | tr -d '\n'")
local BASEDIR = "/home/" .. curr_group .. "/" .. USER .. "/nvim/"

local function setup_directory(dir)
  if vim.fn.isdirectory(dir) == 0 then
    vim.fn.mkdir(dir, "p", "0700")
  end
end

local SWAPDIR = BASEDIR .. "swap//"
local BACKUPDIR = BASEDIR .. "backup//"
local UNDODIR = BASEDIR .. "undo//"

setup_directory(SWAPDIR)
setup_directory(BACKUPDIR)
setup_directory(UNDODIR)

-- Set up options
local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.scrolloff = 5
opt.sidescrolloff = 5
opt.hlsearch = true
opt.incsearch = true
opt.showmode = false
opt.mouse:append('a')
opt.clipboard:append('unnamedplus')
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.ignorecase = true
opt.smartcase = true
opt.directory = SWAPDIR
opt.backupdir = BACKUPDIR
opt.undodir = UNDODIR
opt.swapfile = true
opt.backup = true
opt.undofile = true
opt.autoread = true

-- Append backup files with timestamp
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local extension = "~" .. vim.fn.strftime("%Y-%m-%d-%H%M%S")
    vim.o.backupext = extension
  end,
})


-- Buffer-specific options
local bo = vim.bo
bo.autoread = true

-- GUI options
opt.cursorline = true
opt.termguicolors = true
vim.o.guicursor =
"n-v-c-i:block,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- Set up autocmds
vim.cmd('autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE')
vim.cmd("colorscheme gruvbox")
vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 250
    })
  end
})

vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local current_line = vim.api.nvim_win_get_cursor(0)[1]
    local last_line = vim.api.nvim_buf_line_count(0)

    if current_line > 1 and current_line <= last_line then
      vim.api.nvim_feedkeys('"g"', 'n', true)
    end
  end
})

-- Require configurations
local require_configs = {
  "personal.keymaps",
  "plugin-configs.coc",
  "plugin-configs.nvim-tree",
  "plugin-configs.treesitter",
  "plugin-configs.telescope",
  "plugin-configs.indent-blankline",
  "plugin-configs.lualine",
  "plugin-configs.dresser",
  "plugin-configs.tmux",
  "plugin-configs.comment",
  "plugin-configs.resession",
  -- "plugin-configs.mini-animate",
  "plugin-configs.barbar"
}

for _, config in ipairs(require_configs) do
  require(config)
end
