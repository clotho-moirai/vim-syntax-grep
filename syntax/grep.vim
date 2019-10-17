if exists("b:current_syntax")
    finish
endif

" ファイルパス + 行番号
syn match grepFpLineNum /^[^:]\+:[0-9]\+:/ contains=grepFilePath
" ファイルパス のみ
syn match grepFilePath /^[^:]\+/ contained containedin=grepFpLineNum
" 2019-10-07T23:59:59.999+09:00
" 2019-10-07T14:59:59.999Z
syn match grepDateTime /[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}T[0-9]\{2\}:[0-9]\{2\}:[0-9]\{2\}.[0-9]\{3\}\(Z\|+09:00\)/

syn match grepLineHdr /\[[[:alnum:]]\{8\} [^\]]\+\]/ contains=grepLhOpId
syn match grepLhOwner /\[[[:alnum:]]\{8\} [^\]]\+\] [^ :]\+:/ contains=grepOwner,grepLhOpId
syn match grepLhClass /\[[[:alnum:]]\{8\} [^\]]\+\] \[[[:alnum:]:~]\+\]/ contains=grepClass,grepLhOpId

syn match grepOwner / [^\[ :']\+:/ contained containedin=grepLhOwner
syn match grepClass /\[[[:alnum:]:~]\+\]/ contained containedin=grepLhClass

syn match grepOpId /grepOpId=[[:alnum:]-]\+/
syn match grepLhOpId /grepOpId=[[:alnum:]-]\+/ contained containedin=grepLineHdr,grepLhOwner
syn match grepId /[0-9]\{16\}/

" 行番号 だけ （ファイルパスは grepFilePath で上書き）
hi def link grepFpLineNum Special
" ファイルパス のみ
hi def link grepFilePath String
hi def link grepDateTime Comment

hi def link grepLineHdr Function
hi def link grepLhOwner Function
hi def link grepLhClass Function

hi def link grepOwner Title
hi def link grepClass Title

hi def link grepOpId LineNr
hi def link grepLhOpId LineNr
hi def link grepId LineNr

let b:current_syntax = "grep"

