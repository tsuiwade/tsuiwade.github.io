start  http://localhost:4000/
start "" "D:\PicGo\PicGo.exe"
tasklist | find /i "Typora.exe" && echo "Typora is running" || start "" "D:\Typora\Typora.exe"
cmd /k "cd /d C:\Users\tsui\blog&&hexo s"