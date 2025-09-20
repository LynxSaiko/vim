" ========================================================
" Vim Configuration for vim-devicons with Terminus Font
" ========================================================

" Install plugins using vim-plug
call plug#begin('~/.vim/plugged')

" Install vim-devicons for integration with other plugins
Plug 'ryanoasis/vim-devicons'

call plug#end()

" ========================================================
" Enable vim-devicons and configure basic settings
" ========================================================

" Enable vim-devicons
let g:webdevicons_enable = 1

" Enable NERDTree support for vim-devicons (replace with simple icons)
let g:webdevicons_enable_nerdtree = 1
let g:NERDTreeShowIcons = 0 " Disable default NERDTree icons, use Unicode instead
let g:NERDTreeDirArrowExpandable = '📂' " Folder expandable symbol
let g:NERDTreeDirArrowCollapsible = '📂' " Folder collapsible symbol
let g:NERDTreeFileNode = '📄' " File symbol

" Enable airline statusline and tabline integration
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_airline_tabline = 1

" Optional: Enable icons for other plugins
let g:webdevicons_enable_startify = 1
let g:webdevicons_enable_ctrlp = 1
let g:webdevicons_enable_vimfiler = 1
let g:webdevicons_enable_unite = 1
let g:webdevicons_enable_flagship_statusline = 1
let g:webdevicons_enable_denite = 1

" Optional: Adjust padding after icons in NERDTree and airline
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
let g:WebDevIconsTabAirLineAfterGlyphPadding = ' '
let g:WebDevIconsTabAirLineBeforeGlyphPadding = ' '

" ========================================================
" Customizing Default Symbols (for non-matching file types)
" ========================================================

" Change default symbols used when no match is found
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = '✦'
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = '📂'

" Customize file extension icons (e.g., .js files)
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = '📜'

" Optional: Add custom folder or directory symbols
let g:WebDevIconsUnicodeDecorateFolderNodesExactMatches = 1

" ========================================================
" General Settings (Optional but recommended)
" ========================================================

" Enable line numbers
set number

" Enable relative line numbers
set relativenumber

" Enable syntax highlighting
syntax enable

" Enable line wrapping
set wrap

" Enable search highlighting
set hlsearch

" Enable incremental search
set incsearch

" ========================================================
" Set Font for Terminal (make sure it's Terminus)
" ========================================================
" This is for terminal font configuration, ensure Terminus is selected
" in your terminal emulator settings (not part of .vimrc)
" ========================================================
