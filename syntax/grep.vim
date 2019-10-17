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

syn match grepOpId /opID=[[:alnum:]-]\+/
syn match grepLhOpId /opID=[[:alnum:]-]\+/ contained containedin=grepLineHdr,grepLhOwner,grepLhClass
syn match grepId /[0-9]\{16\}/

" 行番号 だけ （ファイルパスは grepFilePath で上書き）
hi def link grepFpLineNum Special
" ファイルパス のみ
hi def link grepFilePath String
hi def link grepDateTime Comment

hi def link grepLineHdr grepLineHdrs
hi def link grepLhOwner grepLineHdrs
hi def link grepLhClass grepLineHdrs
hi def link grepLineHdrs Function

hi def link grepOwner grepIndicators
hi def link grepClass grepIndicators
hi def link grepIndicators Title

hi def link grepOpId grepIds
hi def link grepLhOpId grepIds
hi def link grepId grepIds
hi def link grepIds DiffChange

let b:current_syntax = "grep"

