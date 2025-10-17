local M = {}

function M.setup(colors)
	local highlights = {
		-- Comments (keep normal weight for comments)
		Comment = { fg = colors.comment, italic = true },

		-- Constants
		Constant = { fg = colors.constant }, -- Light blue like Xcode
		String = { fg = colors.string },
		Character = { fg = colors.string },
		Number = { fg = colors.number },
		Boolean = { fg = colors.boolean, bold = true }, -- Bold for booleans
		Float = { fg = colors.number },

		-- Identifiers (reduce green usage)
		Identifier = { fg = colors.fg }, -- Most identifiers should be white
		Function = { fg = colors.type }, -- Function names bluish like types

		-- Statements (keywords bold)
		Statement = { fg = colors.keyword, bold = true },
		Conditional = { fg = colors.keyword, bold = true },
		Repeat = { fg = colors.keyword, bold = true },
		Label = { fg = colors.keyword, bold = true },
		Operator = { fg = colors.operator },
		Keyword = { fg = colors.keyword, bold = true },
		Exception = { fg = colors.keyword, bold = true },

		-- PreProcessor (keywords bold)
		PreProc = { fg = colors.preprocessor, bold = true }, -- Pink like keywords/imports
		Include = { fg = colors.preprocessor, bold = true }, -- Pink for imports
		Define = { fg = colors.preprocessor, bold = true }, -- Pink
		Macro = { fg = colors.preprocessor, bold = true }, -- Pink
		PreCondit = { fg = colors.preprocessor, bold = true }, -- Pink

		-- Types
		Type = { fg = colors.type },
		StorageClass = { fg = colors.keyword, bold = true },
		Structure = { fg = colors.type },
		Typedef = { fg = colors.type },

		-- Special
		Special = { fg = colors.attribute },
		SpecialChar = { fg = colors.string },
		Tag = { fg = colors.keyword, bold = true }, -- Tags should be pink like keywords
		Delimiter = { fg = colors.punctuation },
		SpecialComment = { fg = colors.comment, bold = true },
		Debug = { fg = colors.error },

		-- Underlined (links, etc.)
		Underlined = { fg = colors.info, underline = true },

		-- Ignore
		Ignore = { fg = colors.fg_darker },

		-- Error
		Error = { fg = colors.error, bold = true },

		-- Todo
		Todo = { fg = colors.todo, bold = true },

		-- Additional syntax groups for better coverage

		-- HTML/XML (tags should be pink like keywords)
		htmlTag = { fg = colors.keyword, bold = true }, -- Pink like keywords
		htmlEndTag = { fg = colors.keyword, bold = true }, -- Pink like keywords
		htmlTagName = { fg = colors.keyword, bold = true }, -- Pink like keywords
		htmlArg = { fg = colors.property }, -- Attributes stay green
		htmlString = { fg = colors.string },

		-- CSS
		cssTagName = { fg = colors.keyword, bold = true }, -- CSS selectors pink
		cssClassName = { fg = colors.function_name }, -- Class names green
		cssIdentifier = { fg = colors.function_name }, -- IDs green
		cssProp = { fg = colors.property }, -- Properties green
		cssValueLength = { fg = colors.number },
		cssValueNumber = { fg = colors.number },
		cssColor = { fg = colors.number },
		cssFunction = { fg = colors.type }, -- CSS functions bluish

		-- JavaScript/TypeScript (more balanced)
		javaScriptFunction = { fg = colors.keyword, bold = true },
		javaScriptIdentifier = { fg = colors.fg }, -- Most identifiers white
		javaScriptMember = { fg = colors.property }, -- Object members green
		javaScriptNumber = { fg = colors.number },
		javaScriptNull = { fg = colors.boolean, bold = true },
		javaScriptUndefined = { fg = colors.boolean, bold = true },

		-- JSX specific syntax highlighting
		jsxTag = { fg = colors.keyword, bold = true }, -- JSX tags pink
		jsxTagName = { fg = colors.keyword, bold = true }, -- JSX tag names pink
		jsxAttrib = { fg = colors.property }, -- JSX attributes green
		jsxString = { fg = colors.string },
		jsxComponentName = { fg = colors.type }, -- React component names bluish

		-- Python
		pythonBuiltin = { fg = colors.type },
		pythonException = { fg = colors.type },
		pythonDecorator = { fg = colors.attribute },
		pythonDecoratorName = { fg = colors.attribute },

		-- Lua
		luaFunction = { fg = colors.keyword, bold = true },
		luaTable = { fg = colors.fg },
		luaIn = { fg = colors.keyword, bold = true },

		-- JSON
		jsonKeyword = { fg = colors.property }, -- Green
		jsonString = { fg = colors.string },
		jsonNumber = { fg = colors.number },
		jsonBoolean = { fg = colors.boolean, bold = true },
		jsonNull = { fg = colors.boolean, bold = true },

		-- Diff
		diffAdded = { fg = colors.diff_add_fg, bg = colors.diff_add },
		diffRemoved = { fg = colors.diff_delete_fg, bg = colors.diff_delete },
		diffChanged = { fg = colors.diff_change_fg, bg = colors.diff_change },
		diffFile = { fg = colors.function_name },
		diffNewFile = { fg = colors.git_add },
		diffOldFile = { fg = colors.git_delete },
		diffLine = { fg = colors.info },

		-- Git
		gitcommitComment = { fg = colors.comment },
		gitcommitUnmerged = { fg = colors.git_change },
		gitcommitOnBranch = { fg = colors.fg },
		gitcommitBranch = { fg = colors.function_name },
		gitcommitDiscardedType = { fg = colors.git_delete },
		gitcommitSelectedType = { fg = colors.git_add },
		gitcommitHeader = { fg = colors.fg },
		gitcommitUntrackedFile = { fg = colors.git_ignored },
		gitcommitDiscardedFile = { fg = colors.git_delete },
		gitcommitSelectedFile = { fg = colors.git_add },
		gitcommitUnmergedFile = { fg = colors.git_change },
		gitcommitFile = { fg = colors.fg },

		-- Vim script
		vimCommand = { fg = colors.keyword, bold = true },
		vimFunction = { fg = colors.fg }, -- Function names white
		vimUserFunc = { fg = colors.fg }, -- User functions white
		vimVariable = { fg = colors.fg }, -- Variables white
		vimOption = { fg = colors.property },
		vimHiGroup = { fg = colors.type },
		vimGroup = { fg = colors.type },
		vimSynType = { fg = colors.type },
	}

	-- Apply highlights
	for group, opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, opts)
	end
end

return M
