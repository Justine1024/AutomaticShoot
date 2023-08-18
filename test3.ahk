#NoEnv
#Persistent ; 使脚本持久运行
#UseHook ; 使用更强制的钩子方式
SendMode Input
SetWorkingDir %A_ScriptDir%

;标记变量，表示是否启用该程序
Fire :=true

; 标记变量，表示鼠标左键是否被按下
MouseLeftDown := false

; 标记变量，表示是否禁用 WASD 键
DisableWASD := false
#If (Fire)
	; 按下鼠标左键时设置标记为 true，并模拟按下左 Ctrl 键
	~LButton::
		MouseLeftDown := true
		Send, {LControl down}
		DisableWASD := true
		return

	; 松开鼠标左键时设置标记为 false，并模拟松开左 Ctrl 键
	~LButton Up::
		MouseLeftDown := false
		Send, {LControl up}
		DisableWASD := false
		return

; 拦截按下 WASD 键的事件
	#If (DisableWASD)
		w::return
		a::return
		s::return
		d::return
		#If
#If
+o::
    Fire :=true
    return
    
+l::
    Fire :=false
    return    
    
+p::
	MsgBox "已退出"
    ExitApp
    return
