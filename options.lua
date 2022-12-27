local options = {
	backspace = vim.opt.backspace + { "nostop" }, -- Don't stop backspace at insert
	clipboard = "unnamedplus", -- Connection to the system clipboard
	cmdheight = 0, -- hide command line unless needed
	completeopt = { "menuone", "noselect" }, -- Options for insert mode completion
	copyindent = true, -- Copy the previous indentation on autoindenting
	cursorline = true, -- Highlight the text line of the cursor
	expandtab = true, -- Enable the use of space in tab
	fileencoding = "utf-8", -- File content encoding for the buffer
	fillchars = { eob = " " }, -- Disable `~` on nonexistent lines
	history = 100, -- Number of commands to remember in a history table
	ignorecase = true, -- Case insensitive searching
	laststatus = 3, -- globalstatus
	lazyredraw = true, -- lazily redraw screen
	mouse = "a", -- Enable mouse support
	timeoutlen = 300, -- Length of time to wait for a mapped sequence
	undofile = true, -- Enable persistent undo
	updatetime = 300, -- Length of time to wait before triggering the plugin
	wrap = true, -- Disable wrapping of lines longer than the width of window
	writebackup = false, -- Disable making a backup before overwriting a file
	-- minimal number of screen columns either side of cursor if wrap is `false`
	-- guifont = "monospace:h17", -- the font used in graphical neovim applications
	guifont = "Source_Code_Pro:h17", -- the font used in graphical neovim applications
	whichwrap = "bs<>[]hl", -- which "horizontal" keys are allowed to travel to prev/next line            -- which "horizontal" keys are allowed to travel to prev/next line
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- vim.opt.shortmess = "ilmnrx"                        -- flags to shorten vim messages, see :help 'shortmess'
vim.opt.shortmess:append("c") -- don't give |ins-completion-menu| messages
vim.opt.iskeyword:append("-") -- hyphenated words recognized by searches
vim.opt.formatoptions:remove({ "c", "r", "o" }) -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles") -- separate vim plugins from neovim in case vim still in use
