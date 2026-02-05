local M = {}

local default_options = {
	-- Enable/disable specific integrations
	integrations = {
		telescope = true,
		nvim_tree = true,
		gitsigns = true,
		bufferline = true, -- For file tabs
		incline = true, -- For incline.nvim
		lazygit = true, -- For lazygit integration
		which_key = true, -- For which-key popup
		notify = true, -- For nvim-notify
		snacks = true, -- For snacks.nvim picker
		blink = true, -- For blink.cmp completion
	},
	-- Style options
	styles = {
		comments = { italic = true }, -- Comments remain italic, normal weight
		keywords = { bold = true }, -- Keywords are bold by default
		functions = {}, -- Functions use default weight (SF Mono Light Medium)
		variables = {}, -- Variables use default weight (SF Mono Light Medium)
		strings = {}, -- Strings use default weight (SF Mono Light Medium)
		booleans = { bold = true }, -- Booleans are bold
		types = {}, -- Types use default weight (SF Mono Light Medium)
		constants = {}, -- Constants use default weight (SF Mono Light Medium)
		operators = {}, -- Operators use default weight (SF Mono Light Medium)
		punctuation = {}, -- Punctuation use default weight (SF Mono Light Medium)
	},
	-- Font weight configuration
	font_weights = {
		-- Most code elements will use SF Mono Light Medium (your terminal default)
		-- Only specific elements will be bold or have different weights
		default = {}, -- Uses terminal default (SF Mono Light Medium)
		bold_elements = { -- Elements that should be bold
			"keywords",
			"booleans",
			"conditionals",
			"loops",
			"imports",
			"preprocessor",
			"tags",
			"storage_class",
			"function_keywords",
		},
		italic_elements = { -- Elements that should be italic
			"comments",
		},
	},
	-- Terminal colors
	terminal_colors = true,
	-- Transparent background
	transparent = false,
	-- Color overrides - customize any color from the base palette
	color_overrides = {},
}

function M.load(opts)
	opts = vim.tbl_deep_extend("force", default_options, opts or {})

	-- Clear existing highlights
	vim.cmd("highlight clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	vim.g.colours_name = "xcodedark"

	local colors = require("xcodedark.colors")

	-- Apply color overrides
	if opts.color_overrides then
		for color_name, color_value in pairs(opts.color_overrides) do
			colors[color_name] = color_value
		end
	end

	-- Apply transparent background if enabled
	if opts.transparent then
		colors.bg = "NONE"
		colors.bg_alt = "NONE"
		colors.bg_dark = "NONE"
		colors.bg_light = "NONE"
		colors.gutter_bg = "NONE"
		colors.status_bg = "NONE"
		colors.tab_active_bg = "NONE"
		colors.tab_inactive_bg = "NONE"
		-- Keep popup menu background solid even in transparent mode for better readability
		-- colors.pmenu_bg = "NONE"  -- Commented out to keep solid background
		colors.fold_bg = "NONE"
		-- Also make incline and which-key transparent
		colors.bg_highlight = "NONE"
	end

	-- Load core highlight groups
	require("xcodedark.groups.editor").setup(colors)
	require("xcodedark.groups.syntax").setup(colors)
	require("xcodedark.groups.integrations.treesitter").setup(colors)
	require("xcodedark.groups.integrations.lsp").setup(colors)

	-- Load optional integrations with error handling
	if opts.integrations.telescope then
		local ok, _ = pcall(require, "xcodedark.groups.integrations.telescope")
		if ok then
			require("xcodedark.groups.integrations.telescope").setup(colors)
		end
	end

	if opts.integrations.nvim_tree then
		local ok, _ = pcall(require, "xcodedark.groups.integrations.nvim-tree")
		if ok then
			require("xcodedark.groups.integrations.nvim-tree").setup(colors)
		end
	end

	if opts.integrations.gitsigns then
		local ok, _ = pcall(require, "xcodedark.groups.integrations.gitsigns")
		if ok then
			require("xcodedark.groups.integrations.gitsigns").setup(colors)
		end
	end

	if opts.integrations.bufferline then
		local ok, _ = pcall(require, "xcodedark.groups.integrations.bufferline")
		if ok then
			require("xcodedark.groups.integrations.bufferline").setup(colors)
		end
	end

	if opts.integrations.incline then
		local ok, _ = pcall(require, "xcodedark.groups.integrations.incline")
		if ok then
			require("xcodedark.groups.integrations.incline").setup(colors)
		end
	end

	if opts.integrations.lazygit then
		local ok, _ = pcall(require, "xcodedark.groups.integrations.lazygit")
		if ok then
			require("xcodedark.groups.integrations.lazygit").setup(colors)
		end
	end

	if opts.integrations.which_key then
		local ok, _ = pcall(require, "xcodedark.groups.integrations.which-key")
		if ok then
			require("xcodedark.groups.integrations.which-key").setup(colors)
		end
	end

	if opts.integrations.notify then
		local ok, _ = pcall(require, "xcodedark.groups.integrations.notify")
		if ok then
			require("xcodedark.groups.integrations.notify").setup(colors)
		end
	end

	if opts.integrations.snacks then
		local ok, _ = pcall(require, "xcodedark.groups.integrations.snacks")
		if ok then
			local snacks_highlights = require("xcodedark.groups.integrations.snacks").setup()
			for group, hl in pairs(snacks_highlights) do
				vim.api.nvim_set_hl(0, group, hl)
			end
		end
	end

	if opts.integrations.blink then
		local ok, _ = pcall(require, "xcodedark.groups.integrations.blink")
		if ok then
			require("xcodedark.groups.integrations.blink").setup(colors)
		end
	end

	-- Set terminal colors if enabled
	if opts.terminal_colors then
		vim.g.terminal_color_0 = colors.terminal_black
		vim.g.terminal_color_1 = colors.terminal_red
		vim.g.terminal_color_2 = colors.terminal_green
		vim.g.terminal_color_3 = colors.terminal_yellow
		vim.g.terminal_color_4 = colors.terminal_blue
		vim.g.terminal_color_5 = colors.terminal_magenta
		vim.g.terminal_color_6 = colors.terminal_cyan
		vim.g.terminal_color_7 = colors.terminal_white
		vim.g.terminal_color_8 = colors.terminal_bright_black
		vim.g.terminal_color_9 = colors.terminal_bright_red
		vim.g.terminal_color_10 = colors.terminal_bright_green
		vim.g.terminal_color_11 = colors.terminal_bright_yellow
		vim.g.terminal_color_12 = colors.terminal_bright_blue
		vim.g.terminal_color_13 = colors.terminal_bright_magenta
		vim.g.terminal_color_14 = colors.terminal_bright_cyan
		vim.g.terminal_color_15 = colors.terminal_bright_white
	end

	-- Enhanced autocomplete menu styling (always applied for better appearance)
	vim.api.nvim_set_hl(0, "Pmenu", { 
		fg = colors.pmenu_fg, 
		bg = colors.pmenu_bg,
		blend = 15  -- Slight transparency for better visual integration
	})
	vim.api.nvim_set_hl(0, "PmenuSel", { 
		fg = colors.pmenu_sel_fg, 
		bg = colors.pmenu_sel_bg,
		bold = true  -- Make selected item more prominent
	})
	vim.api.nvim_set_hl(0, "PmenuSbar", { 
		bg = colors.pmenu_scrollbar
	})
	vim.api.nvim_set_hl(0, "PmenuThumb", { 
		bg = colors.scrollbar_thumb
	})
	
	-- Enhanced completion menu styling with borders
	vim.api.nvim_set_hl(0, "FloatBorder", { 
		fg = colors.border, 
		bg = opts.transparent and "NONE" or colors.bg_light 
	})
	vim.api.nvim_set_hl(0, "NormalFloat", { 
		fg = colors.fg, 
		bg = opts.transparent and colors.pmenu_bg or colors.bg_light 
	})

	-- Apply additional transparency fixes for specific elements
	if opts.transparent then
		-- Force transparency for problematic highlights
		vim.api.nvim_set_hl(0, "Normal", { fg = colors.fg, bg = "NONE" })
		-- Keep NormalFloat with solid background for better autocomplete visibility
		vim.api.nvim_set_hl(0, "NormalFloat", { fg = colors.fg, bg = colors.pmenu_bg })
		vim.api.nvim_set_hl(0, "FloatBorder", { fg = colors.border, bg = "NONE" })
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "FoldColumn", { fg = colors.line_number, bg = "NONE" })
		vim.api.nvim_set_hl(0, "LineNr", { fg = colors.line_number, bg = "NONE" })
		vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.cursor, bg = "NONE", bold = true, underline = true })

		-- Fix incline transparency
		vim.api.nvim_set_hl(0, "InclineNormal", { fg = colors.fg_alt, bg = "NONE" })
		vim.api.nvim_set_hl(0, "InclineNormalNC", { fg = colors.fg_dark, bg = "NONE" })

		-- Fix which-key transparency
		vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "WhichKey", { fg = colors.function_name, bg = "NONE", bold = true })
		vim.api.nvim_set_hl(0, "WhichKeyGroup", { fg = colors.keyword, bg = "NONE" })
		vim.api.nvim_set_hl(0, "WhichKeyDesc", { fg = colors.fg, bg = "NONE" })

		-- Fix bufferline transparency
		vim.api.nvim_set_hl(0, "BufferLineBackground", { fg = colors.tab_inactive_fg, bg = "NONE" })
		vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "BufferLineBufferSelected", { fg = colors.tab_active_fg, bg = "NONE", bold = true })
		vim.api.nvim_set_hl(0, "BufferLineBufferVisible", { fg = colors.tab_inactive_fg, bg = "NONE" })
		vim.api.nvim_set_hl(0, "BufferLineBuffer", { fg = colors.fg_dark, bg = "NONE" })

		-- Fix lazygit transparency
		vim.api.nvim_set_hl(0, "LazyGitFloat", { fg = colors.fg, bg = "NONE" })
		vim.api.nvim_set_hl(0, "LazyGitBorder", { fg = colors.border, bg = "NONE" })
		vim.api.nvim_set_hl(0, "TerminalNormal", { fg = colors.fg, bg = "NONE" })
		vim.api.nvim_set_hl(0, "TerminalNormalFloat", { fg = colors.fg, bg = "NONE" })

		-- Enhanced telescope borders for transparent mode (keep backgrounds transparent, make borders pop)
		vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = colors.function_name })
		vim.api.nvim_set_hl(0, "TelescopeTitle", { fg = colors.keyword, bold = true })
		vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = colors.type })
		vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = colors.string, bold = true })
		vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { fg = colors.keyword, bold = true })
		vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = colors.constant })
		vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = colors.purple, bold = true })
		vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = colors.attribute })
		vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = colors.number, bold = true })
		vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { fg = colors.keyword, bold = true })
		vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = colors.fg, bg = colors.selection, bold = true })
		vim.api.nvim_set_hl(0, "TelescopeMultiSelection", { fg = colors.fg, bg = colors.selection })
		
		-- Fix nvimtree selection transparency
		vim.api.nvim_set_hl(0, "NvimTreeCursorLine", { bg = colors.selection })
		vim.api.nvim_set_hl(0, "NvimTreeCursorColumn", { bg = colors.selection })
	end

	-- CURSOR COLOR OVERRIDE SECTION
	-- Force cursor colors to override terminal settings
	vim.api.nvim_set_hl(0, "Cursor", { fg = colors.bg, bg = colors.cursor, blend = 0 })
	vim.api.nvim_set_hl(0, "CursorInsert", { fg = colors.bg, bg = colors.cursor, blend = 0 })
	vim.api.nvim_set_hl(0, "CursorVisual", { fg = colors.bg, bg = colors.cursor_visual, blend = 0 })
	vim.api.nvim_set_hl(0, "CursorReplace", { fg = colors.bg, bg = colors.cursor, blend = 0 })
	vim.api.nvim_set_hl(0, "CursorCommand", { fg = colors.bg, bg = colors.cursor, blend = 0 })
	vim.api.nvim_set_hl(0, "lCursor", { fg = colors.bg, bg = colors.cursor, blend = 0 })
	vim.api.nvim_set_hl(0, "TermCursor", { fg = colors.bg, bg = colors.cursor, blend = 0 })
	vim.api.nvim_set_hl(0, "TermCursorNC", { fg = colors.bg, bg = colors.cursor, blend = 0 })

	-- Set cursor shape and color for different modes
	vim.opt.guicursor = {
		"n-v-c-sm:block-Cursor",
		"i-ci-ve:ver25-CursorInsert",
		"r-cr-o:hor20-CursorReplace",
		"a:blinkwait700-blinkoff400-blinkon250",
		-- Add visual mode cursor with specific color
		"v:block-CursorVisual",
	}

	-- Terminal escape sequences for cursor color (may help with some terminals)
	if vim.fn.has("termguicolors") == 1 then
		vim.cmd(string.format(
			[[
			let &t_SI = "\e]12;%s\x7"
			let &t_SR = "\e]12;%s\x7"
			let &t_EI = "\e]12;%s\x7"
		]],
			colors.cursor,
			colors.cursor,
			colors.cursor
		))
	end

	-- Create autocmd to reapply cursor color after certain events
	vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter", "WinEnter", "BufEnter" }, {
		pattern = "*",
		callback = function()
			if vim.g.colours_name == "xcodedark" then
				vim.api.nvim_set_hl(0, "Cursor", { fg = colors.bg, bg = colors.cursor, blend = 0 })
				vim.api.nvim_set_hl(0, "CursorVisual", { fg = colors.bg, bg = colors.cursor_visual, blend = 0 })
				vim.api.nvim_set_hl(0, "TermCursor", { fg = colors.bg, bg = colors.cursor, blend = 0 })
			end
		end,
	})

	-- Apply font weight customizations
	-- Note: Since your terminal already has SF Mono configured, most text will
	-- automatically use SF Mono Light Medium. We only need to explicitly set
	-- bold for specific elements that should stand out.

	-- The bold elements are already configured in the syntax and treesitter files
	-- Comments remain with normal weight but italic
end

function M.setup(opts)
	opts = opts or {}
	M.load(opts)
end

-- Convenience function to get the color palette
function M.get_colors()
	return require("xcodedark.colors")
end

return M
