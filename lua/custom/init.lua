-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

local opt = vim.opt

vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.fileformats = "unix,dos,mac"
opt.backup = false
opt.backupskip = "/tmp/*,/private/tmp/*"
opt.swapfile = false -- Disables creating swap files.

opt.shell = "pwsh" -- Sets PowerShell as the default shell.
opt.shellcmdflag = "-nologo -noprofile -ExecutionPolicy RemoteSigned -command" -- Passes additional flags to PowerShell.
opt.shellxquote = "" -- Disables quoting in shell commands.

-- Appearance
opt.title = true -- Sets the title of the terminal window to the name of the file being edited.
opt.scrolloff = 10 -- Keeps 10 lines of context above and below the cursor.
opt.inccommand = "split" -- Shows the effect of a command incrementally, highlighting the affected text.
opt.termguicolors = true

-- Search
opt.hlsearch = true -- Highlights all matching search patterns.
opt.smartcase = true -- Searches are case sensitive if they contain an uppercase letter.
opt.wildignore:append { "*/node_modules/*" } -- Ignores node_modules directories when searching for files.
opt.path:append { "**" } -- When searching for files, searches down into subfolders.

-- Tab & Indent
opt.breakindent = true
opt.wrap = false
opt.backspace = "start,eol,indent"

-- Undercurl
vim.cmd [[let &t_Cs = "\e[4:3m"]] -- Sets the start sequence for undercurl.
vim.cmd [[let &t_Ce = "\e[4:0m"]] -- Sets the end sequence for undercurl.
-- This doesn' work on iTerm2.

-- Turn off paste mode when leaving inserted
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- auto comment
opt.formatoptions:append { "r" }
