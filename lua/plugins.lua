vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'rstacruz/vim-closer'
	use 'williamboman/mason.nvim'    
	use 'williamboman/mason-lspconfig.nvim'
	use 'neovim/nvim-lspconfig'
	use 'simrat39/rust-tools.nvim'
	use 'hrsh7th/nvim-cmp' 
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
	use 'hrsh7th/cmp-vsnip'                             
	use 'hrsh7th/cmp-path'                              
	use 'hrsh7th/cmp-buffer'                            
	use 'hrsh7th/vim-vsnip'
	use 'folke/tokyonight.nvim'
	use 'github/copilot.vim'
	use {'akinsho/git-conflict.nvim', tag = "*", config = function()
  		require('git-conflict').setup()
	end}
    use({
        "stevearc/aerial.nvim",
        config = function()
        require("aerial").setup()
        end,
    })
end)

