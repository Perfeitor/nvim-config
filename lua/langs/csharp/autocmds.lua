-- =============================================
--  C#: language-specific autocmds
-- =============================================

-- ---- Semantic tokens: color "variable" by context ----
-- When the LSP sends a "variable" semantic token in a .cs file,
-- use treesitter to inspect the surrounding syntax and assign the right highlight:
--   - new X(...)         -> class
--   - x.Method(...)      -> method
--   - x.Prop             -> member
local group = vim.api.nvim_create_augroup("CSharpSemantic", {})

vim.api.nvim_create_autocmd("LspTokenUpdate", {
  group = group,
  pattern = "*.cs",

  callback = function(args)
    local token = args.data.token

    -- Only handle "variable" tokens
    if token.type ~= "variable" then
      return
    end

    -- Get the treesitter node at the token position
    local node = vim.treesitter.get_node({
      bufnr = args.buf,
      pos = { token.line, token.start_col },
    })

    if not node then
      return
    end

    -- Case: object_creation_expression => initialized variable = class
    local parent = node:parent()
    if parent and parent:type() == "object_creation_expression" then
      vim.lsp.semantic_tokens.highlight_token(token, args.buf, args.data.client_id, "@csharp.class")
      return
    end

    -- Not inside member_access_expression -> skip
    if not parent or parent:type() ~= "member_access_expression" then
      return
    end

    -- Only take the NAME after the "." (e.g. x.Name => Name)
    local name = parent:field("name")
    if not name or name[1] ~= node then
      return
    end

    -- Name inside invocation_expression => method
    local grandparent = parent:parent()
    if grandparent and grandparent:type() == "invocation_expression" then
      vim.lsp.semantic_tokens.highlight_token(token, args.buf, args.data.client_id, "@csharp.method")
      return
    end

    -- Everything else is a property/member
    vim.lsp.semantic_tokens.highlight_token(token, args.buf, args.data.client_id, "@csharp.member")
  end,
})
