# 涛叔的 vim 配置

这是我的 vim 配置，仅支持 NeoVim。我写的 vim 相关文章可以到[博客](https://taoshu.in/vim/)阅读。

## 配置原则

尽量使用 NeoVim 的默认配置、默认功能和默认键位映射。只个改必要的配置，只添加必要的插件。

拥抱现代化的 NeoVim，拥抱异步，拥抱 lua。使用24位真彩色主题。

还有一点，只加自己能看懂的配置！从网上无脑复制别人配置的行为很不VIM。

## 插件管理

使用 vim 内置的 packages 功能配合 git submodule 管理插件，可以参考我的[文章](https://taoshu.in/vim/plug-git.html)。

默认插件位置 `~/.config/nvim/pack/vendor/start`。其中的 vendor 可以根据个人喜好修改。

## 目录结构

配置目录结构如下：

```
▸ autoload/
▸ ftplugin/
▸ pack/vendor/start/
  init.vim
  LICENSE
  README.md
  vim.lua
```

所有的个人工具方法都组织到 `autoload/lv.vim` 中，使用 `lv#` 名称空间。

针对特定文件类型的配置组织到 `ftplugin/*.vim` 中，vim 会按需加载。

主配置文件为 `init.vim`，lua 的部分组织到 `vim.lua` 文件。

## 常用插件

### 主题

选用 [tender](https://github.com/jacoborus/tender.vim)，使用24位真彩色。整个色调比较性冷淡，专注于内容。

### 文件操作

- [ag](https://github.com/epii1/ag.vim) 搜索文件内容
- [fzf](https://github.com/epii1/fzf.vim) 搜索文件路径
- [mru](https://github.com/epii1/mru.vim) 管理最近文件列表
- [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) 查看目录结构

以上列出的 ag/fzf/mru 都是我自己定制的插件，代码最多也就一百多行，够用就好，方便定制。
这三个插件也是学习 vim/neovim 插件开发的好素材，不要错过。

### Git集成

- [fugitive](https://github.com/tpope/vim-fugitive) 在 vim 中执行 git 命令，目前只依赖 Git blame
- [gitsigns](https://github.com/lewis6991/gitsigns.nvim) 快速显示文件内容修改信息
- [vimagit](https://github.com/jreybert/vimagit) magit 的 vim 版本，交互式、分部提交，非常方便

### 编程相关

- lsp 使用官方的 [lspconfig](https://github.com/neovim/nvim-lspconfig) 配置以及内置的 lsp 功能
- 自动补全使用纯 lua 实现的 [cmp](https://github.com/hrsh7th/nvim-cmp)
- 代码高亮、缩进和错误检查使用 [treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- 符号列表使用 [tagbar](https://github.com/preservim/tagbar)
- 快速注释使用 [tcomment](https://github.com/tomtom/tcomment_vim)
- 按函数或者声明移动使用 [jumpy](https://github.com/arp242/jumpy.vim)
