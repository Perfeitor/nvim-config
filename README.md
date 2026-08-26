# 🧩 Nvim Config — Git hóa theo ngôn ngữ

Cấu hình Neovim được tổ chức theo **Git branches**: mỗi ngôn ngữ là 1 nhánh riêng, cài đặt chung nằm trên `main`. Muốn làm việc với nhiều ngôn ngữ thì chỉ cần **merge n nhánh vào nhau** — không đụng file dùng chung, nên tránh được conflict.

## 📚 Mục lục

- [Cài đặt](#-cài-nhanh)
- [Mô hình nhánh](#-mô-hình-nhánh)
- [Cấu trúc thư mục](#-cấu-trúc-thư-mục)
- [Tạo môi trường đa ngôn ngữ](#-tạo-môi-trường-đa-ngôn-ngữ)
- [Tạo nhánh ngôn ngữ mới](#-tạo-nhánh-ngôn-ngữ-mới)
- [Cập nhật](#-cập-nhật-khi-main-có-thay-đổi)
- [Lưu ý](#-lưu-ý)

## 🚀 Cài nhanh

```bash
git clone https://github.com/Perfeitor/nvim-config.git ~/.config/nvim
```

> Mặc định chỉ có `main` (cấu hình chung + Lua). Muốn thêm ngôn ngữ, xem phần **🌐 Tạo môi trường đa ngôn ngữ**.

## 🧹 Xoá plugin không sử dụng

Chạy trong Neovim:

```vim
:lua vim.pack.del(vim.tbl_map(function(p) return p.spec.name end, vim.tbl_filter(function(p) return not p.active end, vim.pack.get())))
```

## 🌿 Mô hình nhánh

```text
main             → ⚙️ Cài đặt chung + Lua
lang/csharp      → 🟣 Toàn bộ phần C#
lang/python      → 🐍 Toàn bộ phần Python
lang/go          → 🐹 Toàn bộ phần Go
```

- **`main` là nhánh bắt buộc.**
- Các `lang/*` là tùy chọn.
- Mỗi nhánh ngôn ngữ chỉ **thêm file mới** vào `lua/langs/<ngôn ngữ>/`.
- Merge nhiều nhánh = ghép nhiều ngôn ngữ, **không sửa file dùng chung** → gần như không có conflict.

### 🧭 Cách hoạt động

```text
                    ┌─────────────┐
                    │    main     │
                    │   ⚙️ Core   │
                    └──────┬──────┘
                           │
          ┌────────────────┼────────────────┐
          ▼                ▼                ▼
     lang/csharp       lang/python       lang/go
         🟣                 🐍               🐹
          │                │                │
          └────────────────┼────────────────┘
                           ▼
                    ┌─────────────┐
                    │   my-env    │
                    │  🧩 Merge   │
                    └─────────────┘
```

## 📁 Cấu trúc thư mục

```text
~/.config/nvim/
├── init.lua                    → 🚪 Entry point
└── lua/
    ├── core/                   ← ⚙️ Cài đặt chung
    │   ├── init.lua            → thứ tự nạp
    │   ├── langs.lua           → 🔍 Language loader
    │   ├── pack.lua            → 📦 Plugin dùng chung
    │   ├── keymaps.lua         → ⌨️ Phím tắt dùng chung
    │   ├── options.lua         → ⚙️ Option dùng chung
    │   └── autocmds.lua        → 🔄 Autocmd dùng chung
    │
    ├── langs/                  ← 🌐 Cấu hình theo ngôn ngữ
    │   ├── lua/                → 🌙 Lua mặc định
    │   └── csharp/             → 🟣 C#
    │       ├── init.lua        → điểm vào
    │       ├── lsp.lua         → 🧠 LSP
    │       ├── options.lua     → ⚙️ Option riêng
    │       ├── autocmds.lua    → 🔄 Autocmd riêng
    │       └── keymaps.lua     → ⌨️ Keymap riêng
    │
    └── plugins/                ← 🧩 Config plugin dùng chung
```

Cơ chế **loader** (`core/langs.lua`) tự quét `lua/langs/*/`, nên thêm ngôn ngữ mới **chỉ cần thêm một thư mục** — không phải sửa code dùng chung.

Đó là lý do các nhánh `lang/*` có thể merge với nhau mà không tạo conflict.

## 🌐 Tạo môi trường đa ngôn ngữ

```bash
cd ~/.config/nvim

# Tạo nhánh làm việc từ main
git checkout main
git checkout -b my-env

# Merge các ngôn ngữ cần dùng
git merge lang/csharp lang/python lang/go
```

Lúc này `my-env` có đầy đủ C#, Python và Go.

Muốn sử dụng một tổ hợp ngôn ngữ khác, chỉ cần tạo một nhánh môi trường khác và merge các nhánh tương ứng.

## ➕ Tạo nhánh ngôn ngữ mới

Ví dụ với Go:

```bash
git checkout main
git checkout -b lang/go

mkdir -p lua/langs/go

# Tạo:
# lua/langs/go/init.lua
# lua/langs/go/lsp.lua
# lua/langs/go/options.lua
# lua/langs/go/autocmds.lua
# lua/langs/go/keymaps.lua

git add lua/langs/go
git commit -m "lang/go: thêm hỗ trợ Go"
git push -u origin lang/go
```

### `lua/langs/go/init.lua`

```lua
require("langs.go.lsp")
require("langs.go.options")
require("langs.go.autocmds")
require("langs.go.keymaps")
```

## 🔄 Cập nhật khi `main` có thay đổi

```bash
git checkout my-env
git merge main
```

Vì các nhánh ngôn ngữ chỉ thêm file riêng, việc merge thay đổi chung từ `main` vẫn sạch.

## 📝 Lưu ý

- 📦 `pack/` và `nvim-pack-lock.json` nằm trong `.gitignore`: plugin được cài tự động theo branch hiện tại.
- 🧠 LSP của từng ngôn ngữ được khai báo trong `lua/langs/<tên>/lsp.lua` qua `vim.lsp.enable()`.
- 🛠️ Nếu server chưa được cài, chạy `:MasonInstall <tên-server>` một lần.
- 🧩 Autocmd phụ thuộc plugin nên đặt trong config của chính plugin đó để tránh cảnh báo `same file required with different names` từ `lua-language-server`.
```
