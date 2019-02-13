
;this script will run with pc boot

;1. alt+tab=alt+shift+tab
!Tab::!^Tab

;2. win+f11 : show hide menu
#f11::
WinSet, Style, ^0xC00000, A
WinSet, Style, ^0¡Á40000, A
return

;3. ctrl+alt+a,reboot alt run
^!a::
Run d:\Tools\ALTRun V1.46\altrun_reboot.bat

;4.	ctrl+f12 : always on top, toggle
^F12::
WinSet,AlwaysOnTop,Toggle,A
return

;5.	Set Current active window Transparent.
; HotKey:
;     Ctrl-Alt-0: Switch transparent
;     Ctrl-Alt-=: less transparent
;     Ctrl-Alt--: more transparent
trans := 255
^!=::
	Gosub, GetTrans
	if (trans >=239) {
		trans := 255
	} else {
		trans := trans + 16
	}
    WinSet, Transparent, %trans%, A
    return

^!-::
	Gosub, GetTrans
	if (trans <=66) {
		trans := 50
	} else {
		trans := trans - 16
	}
    WinSet, Transparent, %trans%, A
    return

GetTrans:
	WinGet, transValue, Transparent, A
    if (transValue = "") {
        ; Default transparent value
        trans := 255
    }
    if (transValue <= 50) {
        trans := 50
    }
    if (transValue >= 255) {
        trans := 255
    }
    return

;6.	open total commander shortcut tab
; HotKey:
;     Alt-q: open total commander shortcut tab
;     Then you can use shortcut tab quick open file and program
!q::
Run "d:\tools\totalcmd\TOTALCMD.EXE" /p=r
WinWait, ahk_class TTOTAL_CMD
WinActivate
Send ^1


