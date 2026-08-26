-- =============================================
--  C#: Autocmd riêng
-- =============================================

-- ---- Semantic token: tô màu "variable" theo ngữ cảnh ----
-- Khi LSP gửi semantic token loại "variable" trong file .cs,
-- dùng treesitter kiểm tra cú pháp xung quanh để gán đúng highlight:
--   - new X(...)         -> class
--   - x.Method(...)      -> method
--   - x.Prop             -> member
local group = vim.api.nvim_create_augroup("CSharpSemantic", {})

vim.api.nvim_create_autocmd("LspTokenUpdate", {
  group = group,
  pattern = "*.cs",

  callback = function(args)
    local token = args.data.token

    -- Chỉ xử lý token loại "variable"
    if token.type ~= "variable" then
      return
    end

    -- Lấy node treesitter tại vị trí token
    local node = vim.treesitter.get_node({
      bufnr = args.buf,
      pos = { token.line, token.start_col },
    })

    if not node then
      return
    end

    -- Trường hợp: object_creation_expression => biến được khởi tạo = class
    local parent = node:parent()
    if parent and parent:type() == "object_creation_expression" then
      vim.lsp.semantic_tokens.highlight_token(token, args.buf, args.data.client_id, "@csharp.class")
      return
    end

    -- Không nằm trong member_access_expression thì bỏ qua
    if not parent or parent:type() ~= "member_access_expression" then
      return
    end

    -- Chỉ lấy phần NAME sau dấu "." (vd: x.Name => Name)
    local name = parent:field("name")
    if not name or name[1] ~= node then
      return
    end

    -- Name nằm trong invocation_expression => method
    local grandparent = parent:parent()
    if grandparent and grandparent:type() == "invocation_expression" then
      vim.lsp.semantic_tokens.highlight_token(token, args.buf, args.data.client_id, "@csharp.method")
      return
    end

    -- Còn lại là property/member
    vim.lsp.semantic_tokens.highlight_token(token, args.buf, args.data.client_id, "@csharp.member")
  end,
})
