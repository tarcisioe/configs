syn region texZone start="\\begin{verbblock}" end="\\end{verbblock}\|%stopzone\>"
syn region texZone start="\\begin{mintedblock}" end="\\end{mintedblock}\|%stopzone\>"
" syn region texZone  start="\\lstinputlisting" end="{\s*[a-zA-Z/.0-9_^]\+\s*}"
" syn match texInputFile "\\lstinline\s*\(\[.*\]\)\={.\{-}}" contains=texStatement,texInputCurlies,texInputFileOpt
