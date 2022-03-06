-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- 包管理器
    use {
        "wbthomason/packer.nvim"
    }

   -- 中文文档
    use {
        "yianwillis/vimcdoc",
    }

    -- nvim-tree
    use {
        "kyazdani42/nvim-tree.lua",
        requires = {
            -- 依赖一个图标插件
            "kyazdani42/nvim-web-devicons"
        },
        config = function() 
            -- 插件加载完成后自动运行 lua/conf/nvim-tree.lua 文件中的代码
            require("conf.nvim-tree")
        end
    }

    -- 优秀的暗色主题
    use {
        "catppuccin/nvim",
        -- 改个别名，因为它的名字是 nvim，可能会冲突
        as = "catppuccin",
        config = function()
            -- 插件加载完成后自动运行 lua/conf/catppuccin.lua 文件中的代码
            require("conf.catppuccin")
        end
    }

    -- 炫酷的状态栏插件
    use {
        "windwp/windline.nvim",
        config = function()
            -- 插件加载完成后自动运行 lua/conf/windline.lua 文件中的代码
            require("conf.windline")
        end
    }

    -- 为了能让状态栏显示 git 信息，所以这个插件是必须的
    use {
        "lewis6991/gitsigns.nvim",
        requires = {
            -- 依赖于该插件（一款 Lua 开发使用的插件）
            "nvim-lua/plenary.nvim"
        },
        config = function()
            require("gitsigns").setup()
        end
    }

    -- 支持 LSP 状态的 buffer 栏
    use {
        "akinsho/bufferline.nvim",
        requires = {
            "famiu/bufdelete.nvim" -- 删除 buffer 时不影响现有布局
        },
        config = function()
            require("conf.bufferline")
        end
    }

    -- 搜索时显示条目
    use {
        "kevinhwang91/nvim-hlslens",
        config = function()
            require("conf.nvim-hlslens")
        end
    }

    -- 显示缩进线
    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("conf.indent-blankline")
        end
    }

    -- 自动匹配括号
    use {
        "windwp/nvim-autopairs",
        config = function()
            require("conf.nvim-autopairs")
        end
    }

    -- 快速更改单词
    use {
        "AndrewRadev/switch.vim",
        config = function()
            require("conf.switch")
        end
    }

    -- 快速跳转
    use {
        "phaazon/hop.nvim",
        config = function()
            require("conf.hop")
        end
    }

    -- 自动恢复光标位置
    use {
        "ethanholz/nvim-lastplace",
        config = function()
            require("conf.nvim-lastplace")
        end
    }

    -- 多光标模式
    use {
        "terryma/vim-multiple-cursors",
        config = function()
            require("conf.vim-multiple-cursors")
        end
    }

    -- LSP 基础服务
    use {
        "neovim/nvim-lspconfig",
        config = function()
            require("conf.nvim-lspconfig")
        end
    }
                                            
    -- 自动安装 LSP
    use {
        "williamboman/nvim-lsp-installer",
        config = function()
            require("conf.nvim-lsp-installer")
        end
    }                                          
                                            
    -- LSP UI 美化
    use {
        "tami5/lspsaga.nvim",
        config = function()
            require("conf.lspsaga")
        end
    }

    -- LSP 进度提示
    use {
        "j-hui/fidget.nvim",
        config = function()
            require("conf.fidget")
        end
    }

    -- 插入模式获得函数签名
    use {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("conf.lsp_signature")
        end
    }

    -- 灯泡提示代码行为
    use {
        "kosayoda/nvim-lightbulb",
        config = function()
            require("conf.nvim-lightbulb")
        end
    }

    -- 自动代码补全系列插件
    use {
        "hrsh7th/nvim-cmp",  -- 代码补全核心插件，下面都是增强补全的体验插件
        requires = {
            {"onsails/lspkind-nvim"}, -- 为补全添加类似 vscode 的图标
            {"hrsh7th/vim-vsnip"}, -- vsnip 引擎，用于获得代码片段支持
            {"hrsh7th/cmp-vsnip"}, -- 适用于 vsnip 的代码片段源
            {"hrsh7th/cmp-nvim-lsp"}, -- 替换内置 omnifunc，获得更多补全
            {"hrsh7th/cmp-path"}, -- 路径补全
            {"hrsh7th/cmp-buffer"}, -- 缓冲区补全
            {"hrsh7th/cmp-cmdline"}, -- 命令补全
            {"f3fora/cmp-spell"}, -- 拼写建议
            {"rafamadriz/friendly-snippets"}, -- 提供多种语言的代码片段
            {"lukas-reineke/cmp-under-comparator"}, -- 让补全结果的排序更加智能
            {"tzachar/cmp-tabnine", run = "./install.sh"} -- tabnine 源,提供基于 AI 的智能补全
        },
        config = function()
            require("conf.nvim-cmp")
        end
    }
    -- 就如同上面所说的，nvim-cmp 是补全核心插件，而 vim-vsnip 是补全引擎，补全引擎有很多但我个人觉得 vim-vsnip 是最强大的，因为他可以直接调用 vscode 下的代码片段。在 lua/conf/ 目录下新建 nvim-cmp.lua 文件，并复制粘贴以下代码：-- https://github.com/hrsh7th/nvim-cmp
    -- https://github.com/hrsh7th/vim-vsnip
    -- https://github.com/hrsh7th/cmp-vsnip
    -- https://github.com/hrsh7th/cmp-nvim-lsp
    -- https://github.com/hrsh7th/cmp-path
    -- https://github.com/hrsh7th/cmp-buffer
    -- https://github.com/hrsh7th/cmp-cmdline
    -- https://github.com/f3fora/cmp-spell
    -- https://github.com/rafamadriz/friendly-snippets
    -- https://github.com/lukas-reineke/cmp-under-comparator
    -- https://github.com/tzachar/cmp-tabnine
    
    -- FIX: tabline 在某些计算机上有 1 个 BUG
    -- 当出现：
    --    TabNine is not executable
    -- 等字样时，需要手动执行（仅限 Manjaro）：
    --    rm ~/.local/share/nvim/plugged/cmp-tabnine/binaries
    --    ~/.local/share/nvim/plugged/cmp-tabnine/install.sh
    
    local lspkind = require("lspkind")
    
    local cmp = require("cmp")
    
    cmp.setup(
        ---@diagnostic disable-next-line: redundant-parameter
        {
            -- 指定补全引擎
            snippet = {
                expand = function(args)
                    -- 使用 vsnip 引擎
                    vim.fn["vsnip#anonymous"](args.body)
                end
            },
            -- 指定补全源（安装了补全源插件就在这里指定）
            sources = cmp.config.sources(
                {
                    {name = "vsnip"},
                    {name = "nvim_lsp"},
                    {name = "path"},
                    {name = "buffer"},
                    {name = "cmdline"},
                    {name = "spell"},
                    {name = "cmp_tabnine"}
                }
            ),
            -- 格式化补全菜单
            formatting = {
                format = lspkind.cmp_format(
                    {
                        with_text = true,
                        maxwidth = 50,
                        before = function(entry, vim_item)
                            vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
                            return vim_item
                        end
                    }
                )
            },
            -- 对补全建议排序
            sorting = {
                comparators = {
                    cmp.config.compare.offset,
                    cmp.config.compare.exact,
                    cmp.config.compare.score,
                    cmp.config.compare.recently_used,
                    require("cmp-under-comparator").under,
                    require("cmp_tabnine.compare"),
                    cmp.config.compare.kind,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.order
                }
            },
            -- 绑定补全相关的按键
            mapping = {
                -- 上一个
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                -- 下一个
                ["<C-n>"] = cmp.mapping.select_next_item(),
                -- 选择补全
                ["<CR>"] = cmp.mapping.confirm(),
                --  出现或关闭补全
                ["<C-k>"] = cmp.mapping(
                    {
                        i = function()
                            if cmp.visible() then
                                cmp.abort()
                            else
                                cmp.complete()
                            end
                        end,
                        c = function()
                            if cmp.visible() then
                                cmp.close()
                            else
                                cmp.complete()
                            end
                        end
                    }
                ),
                -- 类似于 IDEA 的功能，如果没进入选择框，tab
                -- 会选择下一个，如果进入了选择框，tab 会确认当前选择
                ["<Tab>"] = cmp.mapping(
                    function(fallback)
                        if cmp.visible() then
                            local entry = cmp.get_selected_entry()
                            if not entry then
                                cmp.select_next_item({behavior = cmp.SelectBehavior.Select})
                            end
                            cmp.confirm()
                        else
                            fallback()
                        end
                    end,
                    {"i", "s", "c"}
                )
            }
        }
    )
    
    -- 命令行 / 模式提示
    cmp.setup.cmdline(
        "/",
        {
            sources = {
                {name = "buffer"}
            }
        }
    )
    
    -- 命令行 : 模式提示
    cmp.setup.cmdline(
        ":",
        {
            sources = cmp.config.sources(
                {
                    {name = "path"}
                },
                {
                    {name = "cmdline"}
                }
            )
        }
    )

    -- git copilot 自动补全
    use {
        "github/copilot.vim",
        config = function()
            require("conf.copilot")
        end
    }

    -- 扩展 LSP 诊断
    use {
        "mfussenegger/nvim-lint",
        config = function()
            require("conf.nvim-lint")
        end
    }

    -- 语法高亮
    use {
        "nvim-treesitter/nvim-treesitter",
        run = {":TSupdate"},
        requires = {
            "p00f/nvim-ts-rainbow" -- 彩虹括号
        },
        config = function()
            require("conf.nvim-treesitter")
        end
    }
end)