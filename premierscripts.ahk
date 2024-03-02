#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#IfWinActive ahk_exe Adobe Premiere Pro.exe

XButton2::addGain()

addGain(amount := 3)
{
send {lbutton}
sleep 5
send g
sleep 5
send %amount%
sleep 5
send {enter}
}
;end of addGain()


XButton1::lessGain()

lessGain(amount := -3)
{
send {lbutton}
sleep 5
send g
sleep 5
send %amount%
sleep 5
send {enter}
}
;end of lessGain()

+b::
send {lbutton}
sleep 5
send +{F1}
sleep 5
KeyWait, b
return
;end of ripple delete at cursor


;SOMETIMES THE PRESET THINGS DIDNT WORK, IS ETHAN ON SCHIZO ARC? OR AM I CODING OOMPALOOMPA SPAGHETTI?


Home::preset("Top - Enter")
^Home::preset("Top - Exit")
Del::preset("Left - Enter")
^Del::preset("Left - Exit")
End::preset("Bottom - Enter")
^End::preset("Bottom - Exit")
PgDn::preset("Right - Enter")
^PgDn::preset("Right - Exit")

preset(type)
{
keywait, %A_PriorHotKey%

coordmode, pixel, Window
coordmode, mouse, Window

BlockInput, SendAndMouse
BlockInput, MouseMove
BlockInput, On
sendinput,{blind}{LCtrl up}{LAlt up}{LShift up}

SetKeyDelay, 0
sleep 25
MouseGetPos, xpos, ypos
sleep 25
send +7
sleep 25
MouseClick, left, 57, 728
send ^a
sleep 25
send {Backspace}
sleep 25
send %type%
sleep 25
MouseClickDrag, left, 93, 790, xpos, ypos
sleep 25

blockinput, MouseMoveOff
BlockInput, off
}


