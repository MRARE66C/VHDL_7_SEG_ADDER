set /p temp="File name:"
xc3sprog.exe -c ftdi -L -v -p 0 %temp%.bit
PAUSE