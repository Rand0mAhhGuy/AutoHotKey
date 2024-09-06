; Configuration
HotkeyKey := "e" ; The key to toggle the script
; End of Configuration

Gui, Add, Text, x5 y10 w240 Center, Modified By Rand0mAhhGuy!
Gui, Font, s12
Gui, Add, Text, x5 y50 w240 Center, Remember to turn on Shiftlock
Gui, Add, Button, x30 y90 w90 h60 vActivateBtn gActivateHotkey, Activate
Gui, Add, Button, x130 y90 w90 h60 vDeactivateBtn gDeactivateHotkey, Deactivate
Gui, Add, Text, x5 y160 w240 Center, The script only flicks your camera, you have to jump and walk yourself.
Gui, Show, w250 h220, Wallhop

return

ActivateHotkey:
Hotkey, %HotkeyKey%, Labels, On
return

DeactivateHotkey:
Hotkey, %HotkeyKey%, Labels, Off
return

Labels:
MouseGetPos, x, y
MouseMove, x+4, y, 0
MouseMove, x-4, y, 0
return

GuiClose:
ExitApp
