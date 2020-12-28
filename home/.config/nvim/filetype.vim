" my filetype file
if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    autocmd! BufRead,BufNewFile *.bbx setfiletype tex
    autocmd! BufRead,BufNewFile *.cbx setfiletype tex
    autocmd! BufNewFile,BufReadPost *.md.erb set filetype=markdown
augroup END
