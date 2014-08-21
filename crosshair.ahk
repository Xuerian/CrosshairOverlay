#NoEnv
#SingleInstance force

; Simplify tray menu
Menu, Tray, NoStandard
Menu, Tray, Add, Reload, ReloadScript
Menu, Tray, Add, Edit Script, EditScript
Menu, Tray, Add, Exit, ExitScript
Menu, Tray, Default, Reload
if FileExist(A_ScriptDir . "\icon.ico")
	Menu, Tray, Icon, %A_ScriptDir%\icon.ico

; Create crosshair overlay
Gui xh: New
Gui xh: Add, Picture, c000000 Background000000 altsubmit BackgroundTrans, ch.gif
Gui xh: +Owner +AlwaysOnTop +LastFound -Caption +ToolWindow +E0x20
Gui xh: Color, 000000
WinSet, TransColor, 000000
GUI xh: Cancel

; Show while game is active
Loop {
	WinWaitActive, ahk_exe Planetside2_x64.exe
	{
		Gui xh: Show, NA Center
		
		WinWaitNotActive, ahk_exe Planetside2_x64.exe
		{
			Gui xh: Cancel
		}
	}
}
return

; Menu methods
ReloadScript:
  Reload
return

EditScript:
  RunWait, notepad %A_ScriptFullPath%
  Reload
return

ExitScript:
  ExitApp
return
