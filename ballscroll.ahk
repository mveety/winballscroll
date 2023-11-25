#NoEnv
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%
#InstallMouseHook
#UseHook

;$*XButton1::
;	return

;$*XButton1 UP::
;	return

$*XButton2::  ; disabled xbutton1 up hotkey for some reason
	movedx := 0
	movedy := 0
	pixelsMoved := 0
	MouseGetPos, ox, oy
	SetTimer, WatchTheMouse, 15
	return

*XButton2 UP::
	SetTimer, WatchTheMouse, off
	return

WatchTheMouse:
	MouseGetPos, nx, ny
	movedx := movedx+nx-ox
	movedy := movedy+ny-oy
	pixelsMoved := pixelsMoved + Abs(nx-ox) + Abs(ny-oy)
	timesY := Abs(movedy) / 24
	Loop, %timesY%
	{
	    If (movedy > 0)
	    {
	        Click WheelDown
	        movedy := movedy - 24
	    }
	    Else
	    {
	        Click WheelUp
	        movedy := movedy + 24
	    }
	}
	MouseMove ox, oy, 0
	return

