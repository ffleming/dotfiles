if !exists(':Tabularize')
  echom 'No :Tabularize'
  finish " Tabular.vim wasn't loaded
endif

AddTabularPattern! symbol_hash /^.\{-}: /l0
AddTabularPattern! rocket_hash /=>/l1r1
AddTabularPattern! = /=
AddTabularPattern! space / /l0
