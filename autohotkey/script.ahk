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

; Shift+Capslock -> Toggle Caps Lock
+Capslock::
  ToggleCapsLock()
Return

; Capslock -> Ctrl
Capslock::Ctrl

;}}}
