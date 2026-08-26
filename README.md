# Nvim Config — Git hóa theo ngôn ngữ

Cấu hình Neovim được tổ chức theo **git branches**: mỗi ngôn ngữ là 1 nhánh riêng, cài đặt chung nằm trên `main`. Muốn làm việc với nhiều ngôn ngữ thì chỉ cần **merge n nhánh vào nhau** — không bao giờ conflict.

## Cài nhanh (clone về)

```bash
git clone https://github.com/Perfeitor/nvim-config.git ~/.config/nvim
```

> Mặc định bạn chỉ có `main` (cấu hình chung + Lua). Muốn thêm ngôn ngữ, xem phần "Tạo môi trường đa ngôn ngữ".

## Xoá các plusins không sử dụng, nhập lệnh trong vim

```
lua vim.pack.del(vim.tbl_map(function(p) return p.spec.name end, vim.tbl_filter(function(p) return not p.active end, vim.pack.get())))
```

## Mô hình nhánh

```
main             → cài đặt CHUNG + Lua (ngôn ngữ mặc định)
lang/csharp      → toàn bộ phần C# (LSP, highlight, autocmd, keymap)
lang/python      → toàn bộ phần Python (nếu có)
lang/go          → toàn bộ phần Go (nếu có)
```

- **Chỉ có `main` là bắt buộc.** Các nhánh `lang/*` là tùy chọn, mỗi nhánh chỉ **thêm file mới** vào `lua/langs/<ngôn ngữ>/`.
- Merge n nhánh = ghép n thư mục ngôn ngữ lại, **không đụng file dùng chung** → không bao giờ conflict.

## Cấu trúc thư mục

```
~/.config/nvim/
├── init.lua                    → require("core") + require("plugins")
└── lua/
    ├── core/                   ← cài đặt chung
    │   ├── init.lua            → thứ tự nạp: pack → keymaps → options → autocmds → langs
    │   ├── langs.lua           → LOADER: tự quét mọi thư mục trong lua/langs/
    │   ├── pack.lua            → plugin dùng chung
    │   ├── keymaps.lua         → phím tắt dùng chung
    │   ├── options.lua         → option dùng chung
    │   └── autocmds.lua        → autocmd dùng chung
    ├── langs/                  ← 1 thư mục = 1 ngôn ngữ
    │   ├── lua/                → (trên main) ngôn ngữ mặc định
    │   └── csharp/             → (trên nhánh lang/csharp)
    │       ├── init.lua        → require các file con
    │       ├── lsp.lua         → vim.lsp.config + vim.lsp.enable
    │       ├── options.lua     → indent, highlight riêng
    │       ├── autocmds.lua    → autocmd riêng (semantic token...)
    │       └── keymaps.lua     → phím tắt buffer-local cho ngôn ngữ đó
    └── plugins/                ← config plugin dùng chung (chỉ sửa trên main)
```

Cơ chế **loader** (`core/langs.lua`) tự quét `lua/langs/*/`, nên thêm ngôn ngữ mới **chỉ cần thêm 1 thư mục** — không phải sửa file nào dùng chung. Đó là lý do merge không conflict.

## Tạo môi trường đa ngôn ngữ

```bash
cd ~/.config/nvim

# Tạo nhánh làm việc từ main
git checkout main
git checkout -b my-env

# Merge các ngôn ngữ bạn cần (merge nhiều nhánh 1 lúc)
git merge lang/csharp lang/python lang/go
```

Lúc này config có đủ mọi thứ. Muốn bỏ bớt ngôn ngữ thì đổi nhánh khác, hoặc `git merge` lại với nhánh mong muốn.

## Tạo nhánh ngôn ngữ mới (ví dụ: Go)

```bash
git checkout main
git checkout -b lang/go

mkdir -p lua/langs/go
# ... tạo lua/langs/go/{init,lsp,options,autocmds,keymaps}.lua ...

git add lua/langs/go
git commit -m "lang/go: thêm hỗ trợ Go"
git push -u origin lang/go
```

`lua/langs/go/init.lua` là điểm vào, ví dụ:

```lua
require("langs.go.lsp")
require("langs.go.options")
require("langs.go.autocmds")
require("langs.go.keymaps")
```

## Cập nhật khi `main` có thay đổi chung

```bash
git checkout my-env
git merge main        # luôn sạch, các nhánh ngôn ngữ chỉ thêm file
```

## Lưu ý

- `pack/` và `nvim-pack-lock.json` nằm trong `.gitignore`: plugin được cài tự động theo đúng branch đang đứng, không cần track.
- Server LSP của từng ngôn ngữ được khai báo trong `lua/langs/<tên>/lsp.lua` qua `vim.lsp.enable()`. Nếu chưa tự cài, chạy `:MasonInstall <tên server>` một lần (ví dụ `:MasonInstall gopls`).
- Các autocmd gắn với một plugin cụ thể nên đặt ngay trong file config của plugin đó (tránh cảnh báo "same file required with different names" của lua-language-server).
