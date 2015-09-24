;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Autohotkey script
; Author: Ricardo Oliveira (hi@rgoliveira.com)
; URL: bitbucket.org/rgoliveira/dotfiles
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Functions {{{1

TrayTip_Changed(what, newValue, duration:=1, option:=1) {
    TrayTip, %what% changed, %newValue%, duration, option
}

ToggleCapsLock(showTrayTip:=false) {
  if GetKeyState("CapsLock", "T") = 1 {
    SetCapsLockState, off
    TrayTip_Changed("Caps Lock", "OFF")
  }
  else if GetKeyState("CapsLock", "F") = 0 {
    SetCapsLockState, on
    TrayTip_Changed("Caps Lock", "ON")
  }
}
;}}}

; Mappings {{{1

; Caps Lock {{{2

; Shift+Capslock -> Toggle Caps Lock
+Capslock::
  ToggleCapsLock()
Return

; Capslock -> Ctrl
Capslock::Ctrl

;}}}
; RWin (Right Win Key) {{{2

; show tooltip while holding rwin
~RWin::
  KeyWait, RWin, D
    Gui +AlwaysOnTop +ToolWindow
    Gui, Add, Text,, Function Keys:
    Gui, Add, Text,, F12 = Calculator

    Gui, Add, Text,, Others:
    Gui, Add, Text,, Arrow Up/Down = Volume Up/Down:
    Gui, Show, Center W200, Actions
  KeyWait, RWin
    Gui, Destroy
return
~RWin Up:: return

; RWin + F12 -> calculator
>#F12::Run calc.exe

; RWin + Up/Down -> Volume Up/Down
>#Down::Volume_Down
>#Up::Volume_Up

;}}}

;}}}
