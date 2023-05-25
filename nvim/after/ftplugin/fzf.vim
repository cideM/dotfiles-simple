setl laststatus=0 noshowmode noruler
aug fzf | au! BufLeave <buffer> set laststatus& showmode ruler | aug END

