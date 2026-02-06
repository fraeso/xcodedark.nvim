local M = {}

function M.setup(colors)
	local highlights = {
		-- LSP semantic tokens
		["@lsp.type.class"] = { fg = colors.type },
		["@lsp.type.decorator"] = { fg = colors.attribute },
		["@lsp.type.enum"] = { fg = colors.type },
		["@lsp.type.enumMember"] = { fg = colors.constant },
		["@lsp.type.function"] = { fg = colors.function_name },
		["@lsp.type.interface"] = { fg = colors.type },
		["@lsp.type.keyword"] = { fg = colors.keyword, bold = true },
		["@lsp.type.macro"] = { fg = colors.function_name },
		["@lsp.type.method"] = { fg = colors.function_name },
		["@lsp.type.modifier"] = { fg = colors.keyword, bold = true },
		["@lsp.type.namespace"] = { fg = colors.type },
		["@lsp.type.parameter"] = { fg = colors.parameter },
		["@lsp.type.property"] = { fg = colors.property },
		["@lsp.type.struct"] = { fg = colors.type },
		["@lsp.type.type"] = { fg = colors.type },
		["@lsp.type.typeParameter"] = { fg = colors.type },
		["@lsp.type.variable"] = { fg = colors.variable },

		-- LSP semantic token modifiers
		["@lsp.mod.readonly"] = { fg = colors.constant },
		["@lsp.mod.static"] = { fg = colors.constant },
		["@lsp.mod.deprecated"] = { fg = colors.fg_dark, strikethrough = true },
		["@lsp.mod.abstract"] = { italic = true },
		["@lsp.mod.async"] = { italic = true },
		["@lsp.mod.modification"] = { underline = true },
		["@lsp.mod.documentation"] = { fg = colors.comment },
		["@lsp.mod.defaultLibrary"] = { fg = colors.type },

		-- Python specific LSP highlights
		["@lsp.type.function.python"] = { fg = colors.function_name },
		["@lsp.type.method.python"] = { fg = colors.function_name },
		["@lsp.type.property.python"] = { fg = colors.property },
		["@lsp.type.variable.python"] = { fg = colors.variable },
		["@lsp.type.parameter.python"] = { fg = colors.parameter },
		["@lsp.type.class.python"] = { fg = colors.type },
		["@lsp.type.decorator.python"] = { fg = colors.attribute },
		["@lsp.type.selfParameter.python"] = { fg = colors.keyword },
		["@lsp.type.clsParameter.python"] = { fg = colors.keyword },

		-- JavaScript/TypeScript specific LSP highlights
		["@lsp.type.function.javascript"] = { fg = colors.function_name },
		["@lsp.type.function.typescript"] = { fg = colors.function_name },
		["@lsp.type.method.javascript"] = { fg = colors.function_name },
		["@lsp.type.method.typescript"] = { fg = colors.function_name },
		["@lsp.type.property.javascript"] = { fg = colors.property },
		["@lsp.type.property.typescript"] = { fg = colors.property },
		["@lsp.type.variable.javascript"] = { fg = colors.variable },
		["@lsp.type.variable.typescript"] = { fg = colors.variable },
		["@lsp.type.parameter.javascript"] = { fg = colors.parameter },
		["@lsp.type.parameter.typescript"] = { fg = colors.parameter },
		["@lsp.type.class.javascript"] = { fg = colors.type },
		["@lsp.type.class.typescript"] = { fg = colors.type },
		["@lsp.type.interface.typescript"] = { fg = colors.type },
		["@lsp.type.enum.typescript"] = { fg = colors.type },
		["@lsp.type.enumMember.typescript"] = { fg = colors.constant },
		["@lsp.type.namespace.typescript"] = { fg = colors.type },
		["@lsp.type.typeParameter.typescript"] = { fg = colors.type },

		-- Go specific LSP highlights
		["@lsp.type.function.go"] = { fg = colors.function_name },
		["@lsp.type.method.go"] = { fg = colors.function_name },
		["@lsp.type.property.go"] = { fg = colors.property },
		["@lsp.type.variable.go"] = { fg = colors.variable },
		["@lsp.type.parameter.go"] = { fg = colors.parameter },
		["@lsp.type.struct.go"] = { fg = colors.type },
		["@lsp.type.interface.go"] = { fg = colors.type },
		["@lsp.type.typeAlias.go"] = { fg = colors.type },

		-- Lua specific LSP highlights
		["@lsp.type.function.lua"] = { fg = colors.function_name },
		["@lsp.type.method.lua"] = { fg = colors.function_name },
		["@lsp.type.property.lua"] = { fg = colors.property },
		["@lsp.type.variable.lua"] = { fg = colors.variable },
		["@lsp.type.parameter.lua"] = { fg = colors.parameter },

		-- LSP references and definitions
		LspReferenceText = { bg = colors.bg_highlight },
		LspReferenceRead = { bg = colors.bg_highlight },
		LspReferenceWrite = { bg = colors.bg_highlight, underline = true },

		-- LSP code lens
		LspCodeLens = { fg = colors.fg_dark, italic = true },
		LspCodeLensSeparator = { fg = colors.fg_darker },

		-- LSP signature help
		LspSignatureActiveParameter = { fg = colors.parameter, bold = true },

		-- LSP inlay hints
		LspInlayHint = { fg = colors.fg_darker, italic = true },

		-- LSP progress
		LspProgressSpinner = { fg = colors.info },
		LspProgressTitle = { fg = colors.fg },
		LspProgressMessage = { fg = colors.fg_alt },
		LspProgressPercentage = { fg = colors.fg_dark },

		-- Document highlights
		DocumentHighlight = { bg = colors.bg_highlight },
		DocumentHighlightText = { bg = colors.bg_highlight },
		DocumentHighlightRead = { bg = colors.bg_highlight },
		DocumentHighlightWrite = { bg = colors.bg_highlight, underline = true },
	}

	-- Apply highlights
	for group, opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, opts)
	end
end

return M
