scriptencoding utf-8
set encoding=utf-8
set nocompatible

function! SourceFiles()
  return ['bundles', 'functions', 'commands', 'sets', 'aesthetics', 'keymaps', 'autocommands']
endfunction

for file in map(SourceFiles(), '"~/.vimrc." . (v:val)')
  if filereadable(expand(file))
    exec('source ' . file)
  else
    echoerr(string(file) . ' not readable but present in SourceFiles()')
  endif
endfor

if filereadable(expand("~/.vimrc.local"))
  exec('source ~/.vimrc.local')
endif
