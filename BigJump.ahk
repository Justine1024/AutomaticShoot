#NoEnv
#Persistent ; 使脚本持久运行
#UseHook ; 使用更强制的钩子方式
LAlt:: ; 当按下 Alt 键时触发
    Send, {Space} ; 发送空格键
    Sleep, 150
    Send, {Ctrl down} ; 按下 Ctrl 键
    Sleep, 500
    Send, {Ctrl up}
    
return

+p:: ; 当按下 Shift + P 键时触发
    MsgBox "已退出"
    ExitApp ; 退出脚本
return