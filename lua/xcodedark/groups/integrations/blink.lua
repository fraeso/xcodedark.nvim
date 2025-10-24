local M = {}

function M.setup(colors)
	local highlights = {
		-- Blink completion menu
		BlinkCmpMenu = {
			bg = "NONE",
			fg = colors.fg,
		},
		BlinkCmpMenuBorder = {
			bg = "NONE",
			fg = colors.keyword, -- Xcode pink for border
		},
		BlinkCmpMenuSelection = {
			bg = "#4A1F3D", -- Darker pink background for selection
			fg = colors.keyword,
		},

		-- Scrollbar styling to match theme
		PmenuSbar = {
			bg = "NONE",
		},
		PmenuThumb = {
			bg = colors.keyword,
		},

		-- Documentation window styling
		BlinkCmpDoc = {
			bg = "NONE",
			fg = colors.fg,
		},
		BlinkCmpDocBorder = {
			bg = "NONE",
			fg = colors.keyword,
		},

		-- Additional documentation window highlights
		BlinkCmpDocCursorLine = {
			bg = "#4A1F3D",
		},
	}

	-- Apply highlights
	for group, opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, opts)
	end
end

return M
