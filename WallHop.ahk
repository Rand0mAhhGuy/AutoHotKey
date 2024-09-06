; Configuration
HotkeyKey := "e" ; The key to toggle the script
; End of Configuration

Gui, Add, Text, x5 y5 w240 Center, Modified By Rand0mAhhGuy!
Gui, Font, s12
Gui, Add, Text, x5 y20 w240 Center, Remember to turn on Shiftlock, you can change the Hotkey in the script
Gui, Add, Button, x30 y80 w90 h60 vActivateBtn gActivateHotkey, Activate
Gui, Add, Button, x130 y80 w90 h60 vDeactivateBtn gDeactivateHotkey, Deactivate
Gui, Add, Text, x5 y150 w240 Center, The script only flicks your camera, you have to jump and walk yourself.
Gui, Show, w250 h210, Wallhop

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
