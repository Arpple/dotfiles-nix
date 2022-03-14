Config { font = "xft:Meslo LG M DZ for Powerline:size=11:bold:antialias=true"
       , bgColor = "black"
       , fgColor = "grey"
       , position = TopW L 100
       , border = BottomB
       , borderColor =  "#646464"
       , commands = [ Run Cpu ["-L","3","-H","50","--normal","green","--high","red"] 10
                    , Run Memory ["-t","Mem: <usedratio>%"] 10
                    , Run Date "%a %b %_d %l:%M" "date" 10
                    , Run StdinReader
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = "%StdinReader% }{ %cpu% | %memory% | <fc=#ee9a00>%date%</fc>"
       }
