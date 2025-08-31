local M = {}

function M.setup(colors)
	local highlights = {
		-- Identifiers (more balanced approach)
		["@variable"] = { fg = colors.fg }, -- Most variables should be white, not green
		["@variable.builtin"] = { fg = colors.keyword, bold = true }, -- Built-ins like 'this', 'self' should be pink and bold
		["@variable.parameter"] = { fg = colors.purple }, -- Parameters purple like Xcode
		["@variable.member"] = { fg = colors.property }, -- Object properties stay green

		-- Constants
		["@constant"] = { fg = colors.constant }, -- Light blue
		["@constant.builtin"] = { fg = colors.constant }, -- Light blue
		["@constant.macro"] = { fg = colors.constant }, -- Light blue

		-- Modules and namespaces
		["@module"] = { fg = colors.type },
		["@module.builtin"] = { fg = colors.type },

		-- Strings and characters
		["@string"] = { fg = colors.string },
		["@string.documentation"] = { fg = colors.comment },
		["@string.regexp"] = { fg = colors.string },
		["@string.escape"] = { fg = colors.operator },
		["@string.special"] = { fg = colors.operator },
		["@string.special.symbol"] = { fg = colors.property },
		["@string.special.url"] = { fg = colors.info, underline = true },
		["@string.special.path"] = { fg = colors.string },
		["@character"] = { fg = colors.string },
		["@character.special"] = { fg = colors.operator },

		-- Booleans and numbers
		["@boolean"] = { fg = colors.boolean, bold = true },
		["@number"] = { fg = colors.number },
		["@number.float"] = { fg = colors.number },

		-- Types
		["@type"] = { fg = colors.type },
		["@type.builtin"] = { fg = colors.type },
		["@type.definition"] = { fg = colors.type },
		["@type.qualifier"] = { fg = colors.keyword, bold = true },

		-- Attributes and properties
		["@attribute"] = { fg = colors.attribute },
		["@attribute.builtin"] = { fg = colors.attribute },
		["@property"] = { fg = colors.property }, -- Keep green for actual properties

		-- Functions (reduce green usage)
		["@function"] = { fg = colors.type }, -- Function names should be bluish in most contexts
		["@function.builtin"] = { fg = colors.function_name }, -- Built-in functions can be green
		["@function.call"] = { fg = colors.type }, -- Function calls bluish
		["@function.macro"] = { fg = colors.function_name }, -- Macros green
		["@function.method"] = { fg = colors.type }, -- Method calls bluish
		["@function.method.call"] = { fg = colors.type }, -- Method calls bluish
		["@constructor"] = { fg = colors.type }, -- Constructors should be type color

		-- Keywords and operators (BOLD keywords)
		["@keyword"] = { fg = colors.keyword, bold = true }, -- Pink and BOLD
		["@keyword.coroutine"] = { fg = colors.keyword, bold = true },
		["@keyword.function"] = { fg = colors.keyword, bold = true },
		["@keyword.operator"] = { fg = colors.keyword, bold = true },
		["@keyword.import"] = { fg = colors.preprocessor, bold = true }, -- Pink for imports and BOLD
		["@keyword.storage"] = { fg = colors.keyword, bold = true },
		["@keyword.repeat"] = { fg = colors.keyword, bold = true },
		["@keyword.return"] = { fg = colors.keyword, bold = true },
		["@keyword.debug"] = { fg = colors.keyword, bold = true },
		["@keyword.exception"] = { fg = colors.keyword, bold = true },
		["@keyword.conditional"] = { fg = colors.keyword, bold = true },
		["@keyword.conditional.ternary"] = { fg = colors.operator },
		["@keyword.directive"] = { fg = colors.preprocessor, bold = true }, -- Pink and BOLD
		["@keyword.directive.define"] = { fg = colors.preprocessor, bold = true }, -- Pink and BOLD

		-- Operators
		["@operator"] = { fg = colors.operator },

		-- Punctuation
		["@punctuation.delimiter"] = { fg = colors.punctuation },
		["@punctuation.bracket"] = { fg = colors.punctuation },
		["@punctuation.special"] = { fg = colors.operator },

		-- Comments
		["@comment"] = { fg = colors.comment, italic = true },
		["@comment.documentation"] = { fg = colors.comment, italic = true },
		["@comment.error"] = { fg = colors.fixme, bold = true },
		["@comment.warning"] = { fg = colors.todo, bold = true },
		["@comment.todo"] = { fg = colors.todo, bold = true },
		["@comment.note"] = { fg = colors.note, bold = true },

		-- Literals
		["@string.doc"] = { fg = colors.comment },

		-- Misc
		["@error"] = { fg = colors.error },
		["@none"] = {},
		["@preproc"] = { fg = colors.preprocessor, bold = true }, -- Pink and BOLD

		-- Tags (HTML/XML/JSX) - Make div/tags same as keywords (pink and bold)
		["@tag"] = { fg = colors.keyword, bold = true }, -- Pink like keywords and BOLD
		["@tag.attribute"] = { fg = colors.property }, -- Attributes stay green
		["@tag.delimiter"] = { fg = colors.punctuation },

		-- Language specific adjustments

		-- Swift specific treesitter groups
		["@keyword.modifier.swift"] = { fg = colors.keyword, bold = true },
		["@attribute.swift"] = { fg = colors.swift_attribute },
		["@parameter.swift"] = { fg = colors.purple }, -- Parameters purple
		["@variable.parameter.swift"] = { fg = colors.purple }, -- Parameters purple
		["@type.builtin.swift"] = { fg = colors.type },
		["@function.builtin.swift"] = { fg = colors.function_name },
		["@function.swift"] = { fg = colors.type }, -- Swift functions bluish
		["@function.call.swift"] = { fg = colors.type }, -- Swift function calls bluish
		["@variable.builtin.swift"] = { fg = colors.keyword, bold = true },

		-- Objective-C specific treesitter groups
		["@keyword.directive.objc"] = { fg = colors.objc_directive, bold = true }, -- Pink and BOLD
		["@type.builtin.objc"] = { fg = colors.type },
		["@property.objc"] = { fg = colors.property },
		["@parameter.objc"] = { fg = colors.fg }, -- Parameters white

		-- Python specific
		["@keyword.function.python"] = { fg = colors.keyword, bold = true },
		["@constructor.python"] = { fg = colors.type },
		["@function.builtin.python"] = { fg = colors.function_name },
		["@type.builtin.python"] = { fg = colors.type },
		["@variable.builtin.python"] = { fg = colors.keyword, bold = true }, -- self, cls should be pink and bold

		-- JavaScript/TypeScript specific
		["@constructor.javascript"] = { fg = colors.type },
		["@keyword.function.javascript"] = { fg = colors.keyword, bold = true },
		["@function.javascript"] = { fg = colors.type }, -- JS functions bluish
		["@function.call.javascript"] = { fg = colors.type }, -- JS function calls bluish
		["@variable.builtin.javascript"] = { fg = colors.keyword, bold = true }, -- this, arguments should be pink and bold
		["@variable.parameter.javascript"] = { fg = colors.purple }, -- JS parameters purple
		["@parameter.javascript"] = { fg = colors.purple }, -- JS parameters purple
		["@constructor.typescript"] = { fg = colors.type },
		["@keyword.function.typescript"] = { fg = colors.keyword, bold = true },
		["@function.typescript"] = { fg = colors.type }, -- TS functions bluish
		["@function.call.typescript"] = { fg = colors.type }, -- TS function calls bluish
		["@variable.builtin.typescript"] = { fg = colors.keyword, bold = true },
		["@variable.parameter.typescript"] = { fg = colors.purple }, -- TS parameters purple
		["@parameter.typescript"] = { fg = colors.purple }, -- TS parameters purple

		-- Go specific (for your Go code example)
		["@keyword.function.go"] = { fg = colors.keyword, bold = true },
		["@type.builtin.go"] = { fg = colors.constant }, -- Go built-in types use same blue as nil
		["@type.go"] = { fg = colors.constant }, -- Go types use same blue as nil
		["@type.definition.go"] = { fg = colors.constant }, -- Go struct definitions use same blue as nil
		["@function.builtin.go"] = { fg = colors.function_name },
		["@function.go"] = { fg = colors.constant }, -- Go functions use same blue as nil
		["@function.call.go"] = { fg = colors.constant }, -- Go function calls use same blue as nil
		["@function.method.go"] = { fg = colors.constant }, -- Go methods use same blue as nil
		["@variable.parameter.go"] = { fg = colors.purple }, -- Go parameters purple
		["@parameter.go"] = { fg = colors.purple }, -- Go parameters purple (alternative capture)

		-- C/C++ specific
		["@type.builtin.c"] = { fg = colors.type },
		["@keyword.storage.c"] = { fg = colors.keyword, bold = true },
		["@preproc.c"] = { fg = colors.preprocessor, bold = true }, -- Pink and BOLD
		["@variable.parameter.c"] = { fg = colors.fg },
		["@variable.parameter.cpp"] = { fg = colors.fg },

		-- Lua specific
		["@constructor.lua"] = { fg = colors.fg },
		["@keyword.function.lua"] = { fg = colors.keyword, bold = true },
		["@variable.builtin.lua"] = { fg = colors.keyword, bold = true },

		-- Rust specific
		["@attribute.rust"] = { fg = colors.attribute },
		["@keyword.storage.rust"] = { fg = colors.keyword, bold = true },
		["@type.builtin.rust"] = { fg = colors.type },
		["@variable.parameter.rust"] = { fg = colors.fg },

		-- Java specific
		["@attribute.java"] = { fg = colors.keyword, bold = false }, -- Spring Boot annotations like @RestController, @Autowired
		["@keyword.function.java"] = { fg = colors.keyword, bold = true },
		["@constructor.java"] = { fg = colors.type },
		["@function.builtin.java"] = { fg = colors.function_name },
		["@type.builtin.java"] = { fg = colors.type },
		["@variable.parameter.java"] = { fg = colors.purple }, -- Java parameters purple

		-- JSON specific
		["@label.json"] = { fg = colors.property },

		-- YAML specific
		["@field.yaml"] = { fg = colors.property },

		-- CSS specific
		["@property.css"] = { fg = colors.property },
		["@type.css"] = { fg = colors.type },
		["@string.css"] = { fg = colors.string },
		["@number.css"] = { fg = colors.number },

		-- HTML specific - divs and tags should be pink like keywords and bold
		["@tag.html"] = { fg = colors.keyword, bold = true }, -- Pink like keywords and BOLD
		["@tag.attribute.html"] = { fg = colors.property }, -- Attributes green
		["@string.html"] = { fg = colors.string },

		-- JSX/TSX specific - React components and HTML tags
		["@tag.jsx"] = { fg = colors.keyword, bold = true }, -- Pink like keywords and BOLD
		["@tag.tsx"] = { fg = colors.keyword, bold = true }, -- Pink like keywords and BOLD
		["@tag.builtin.jsx"] = { fg = colors.keyword, bold = true }, -- HTML tags in JSX (div, span, etc.) should be pink and bold
		["@tag.builtin.tsx"] = { fg = colors.keyword, bold = true }, -- HTML tags in TSX (div, span, etc.) should be pink and bold
		["@tag.attribute.jsx"] = { fg = colors.property },
		["@tag.attribute.tsx"] = { fg = colors.property },

		-- Markdown specific
		["@markup.heading"] = { fg = colors.function_name, bold = true },
		["@markup.heading.1"] = { fg = colors.function_name, bold = true },
		["@markup.heading.2"] = { fg = colors.function_name, bold = true },
		["@markup.heading.3"] = { fg = colors.function_name, bold = true },
		["@markup.heading.4"] = { fg = colors.function_name },
		["@markup.heading.5"] = { fg = colors.function_name },
		["@markup.heading.6"] = { fg = colors.function_name },
		["@markup.list"] = { fg = colors.keyword, bold = true },
		["@markup.list.checked"] = { fg = colors.git_add },
		["@markup.list.unchecked"] = { fg = colors.keyword, bold = true },
		["@markup.link"] = { fg = colors.info },
		["@markup.link.label"] = { fg = colors.info },
		["@markup.link.url"] = { fg = colors.string, underline = true },
		["@markup.raw"] = { fg = colors.string },
		["@markup.raw.block"] = { fg = colors.string },
		["@markup.quote"] = { fg = colors.comment },
		["@markup.math"] = { fg = colors.function_name },
		["@markup.strong"] = { bold = true },
		["@markup.italic"] = { italic = true },
		["@markup.strikethrough"] = { strikethrough = true },
		["@markup.underline"] = { underline = true },

		-- Diff
		["@diff.plus"] = { fg = colors.diff_add_fg, bg = colors.diff_add },
		["@diff.minus"] = { fg = colors.diff_delete_fg, bg = colors.diff_delete },
		["@diff.delta"] = { fg = colors.diff_change_fg, bg = colors.diff_change },

		-- Git commit
		["@text.gitcommit"] = { fg = colors.fg },

		-- URI/URL
		["@text.uri"] = { fg = colors.info, underline = true },

		-- EEx (Embedded Elixir) specific
		["@keyword.eex"] = { fg = colors.keyword, bold = true },
		["@function.eex"] = { fg = colors.type },
		["@function.call.eex"] = { fg = colors.type },
		["@variable.eex"] = { fg = colors.fg },
		["@variable.parameter.eex"] = { fg = colors.purple },
		["@string.eex"] = { fg = colors.string },
		["@punctuation.delimiter.eex"] = { fg = colors.operator }, -- EEx delimiters <%= %>
		["@punctuation.bracket.eex"] = { fg = colors.operator }, -- EEx brackets
		["@tag.eex"] = { fg = colors.keyword, bold = true }, -- HTML tags in EEx
		["@tag.attribute.eex"] = { fg = colors.property }, -- HTML attributes in EEx
		["@embedded.eex"] = { fg = colors.fg }, -- General embedded content

		-- Spell
		["@spell"] = {},
		["@nospell"] = {},
	}

	-- Apply highlights
	for group, opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, opts)
	end
end

return M
