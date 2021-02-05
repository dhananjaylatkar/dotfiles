fu! RenameGdrive(loc)
  let line=getline('.')
  let file_name=split(line, '/')[0]
  let dest = a:loc
  let base_path = "Pratham/Stuff_copy/"
  if dest ==? "m"
      let dest = "Movies"
  elseif dest ==? "t"
      let dest = "TV"
  elseif dest ==? "a"
      let dest = "Anime"
  elseif dest ==? "c"
      let dest = "Cartoons"
  elseif dest ==? "g"
      let dest = "Games"
  elseif dest ==? "s"
      let dest = "Music"
  endif
  let cmd = 'rclone moveto gdrive:"' . base_path . 'Backup_TD2/' . file_name . '" gdrive:"' . base_path . 'Backup_TD2/' . dest . '/' . file_name . '" --drive-server-side-across-configs -vv'
  echo "Moving " . file_name . " to " . dest
  execute ":!". cmd
endfunction

nnoremap <leader>mm :call RenameGdrive("m")<CR>
nnoremap <leader>mt :call RenameGdrive("t")<CR>
nnoremap <leader>ma :call RenameGdrive("a")<CR>
nnoremap <leader>mc :call RenameGdrive("c")<CR>
nnoremap <leader>mg :call RenameGdrive("g")<CR>
nnoremap <leader>ms :call RenameGdrive("s")<CR>
