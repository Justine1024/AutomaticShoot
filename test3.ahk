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

Rw:=false
Ra:=false
Rs:=false
Rd:=false

#If (Fire)
	; 按下鼠标左键时设置标记为 true，并模拟按下左 Ctrl 键
	$LButton::
		MouseLeftDown := true
		Send, {RButton}
		Send, {LControl down}
		Send, {LButton down}
		DisableWASD := true
		return

	; 松开鼠标左键时设置标记为 false，并模拟松开左 Ctrl 键
	$LButton Up::
		MouseLeftDown := false
		Send, {LControl up}
		Send, {LButton up}
		Send, {RButton}		
		DisableWASD := false
		return
	
	w:: 			; 当按下 "w" 键时触发
		wState := GetKeyState("w")
		Rw:=true
		if (DisableWASD) ; 如果禁用了 WASD
		{
			if(wState = 1)
			{
				Send, {w up} 
				Rw:=false
			} ; 发送 "w up" 来模拟松开 "w" 键
			return ; 结束此次触发
		}
		else
		{
			Send, {w down} ; 发送 "w down" 来模拟按下 "w" 键
			return
		}
	w up::
		if(Rw = 1)
		{
			Send, {w up} 
			Rw:=false
		} 
		return
		;aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
	a:: 			; 当按下 "a" 键时触发
		aState := GetKeyState("a")
		Ra:=true
		if (DisableWASD) ; 如果禁用了 WASD
		{
			if(aState = 1)
			{
				Send, {a up} 
				Ra:=false
			} ; 发送 "a up" 来模拟松开 "a" 键
			return ; 结束此次触发
		}
		else
		{
			Send, {a down} ; 发送 "a down" 来模拟按下 "a" 键
			return
		}
	a up::
		if(Ra = 1)
		{
			Send, {a up} 
			Ra:=false
		} 
		return
		;sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
	s:: 			; 当按下 "s" 键时触发
		sState := GetKeyState("s")
		Rs:=true
		if (DisableWASD) ; 如果禁用了 WASD
		{
			if(sState = 1)
			{
				Send, {s up} 
				Rs:=false
			} ; 发送 "w up" 来模拟松开 "w" 键
			return ; 结束此次触发
		}
		else
		{
			Send, {s down} ; 发送 "w down" 来模拟按下 "w" 键
			return
		}
	s up::
		if(Rs = 1)
		{
			Send, {s up} 
			Rs:=false
		} 
		return
		;dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
	d:: 			; 当按下 "w" 键时触发
		dState := GetKeyState("d")
		Rd:=true
		if (DisableWASD) ; 如果禁用了 WASD
		{
			if(dState = 1)
			{
				Send, {d up} 
				Rd:=false
			} ; 发送 "d up" 来模拟松开 "d" 键
			return ; 结束此次触发
		}
		else
		{
			Send, {d down} ; 发送 "d down" 来模拟按下 "d" 键
			return
		}
	d up::
		if(Rd = 1)
		{
			Send, {d up} 
			Rd:=false
		} 
		return
		

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
