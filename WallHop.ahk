; DOWNLOAD AUTO HOT KEY V1.1 TO USE
; Configuration
HotkeyKey := "e" ; The key to toggle the script
; End of Configuration

Gui, Font, s10
Gui, Add, Text, x10 y10 w230 Center, Made by Rand0mAhhGuy on GitHub!
Gui, Add, Text, x10 y30 w230 Center, Remember to turn on Shiftlock
Gui, Add, Text, x10 y60 w230 Center, Enter your desired hotkey:
Gui, Add, Edit, x10 y80 w150 vNewHotkey, %HotkeyKey%
Gui, Add, Button, x170 y78 w70 h24 gUpdateHotkey, Enter
Gui, Add, Button, x20 y120 w100 h40 vActivateBtn gActivateHotkey, Activate
Gui, Add, Button, x130 y120 w100 h40 vDeactivateBtn gDeactivateHotkey, Deactivate
Gui, Add, Text, x10 y170 w230 Center, The script only flicks your camera; you need to jump and walk yourself.
Gui, Show, w250 h230, Wallhop
return

ActivateHotkey:
Hotkey, %HotkeyKey%, Labels, On
return

DeactivateHotkey:
Hotkey, %HotkeyKey%, Labels, Off
return

UpdateHotkey:
Gui, Submit, NoHide
if (StrLen(NewHotkey) = 1 and IsValidKey(NewHotkey)) {
    if (NewHotkey != HotkeyKey) {
        Hotkey, %HotkeyKey%, Labels, Off
        HotkeyKey := NewHotkey
        Hotkey, %HotkeyKey%, Labels, On
    }
} else {
    MsgBox, Please enter only 1 key.
}
return

Labels:
MouseGetPos, x, y
MouseMove, x+4, y, 0
MouseMove, x-4, y, 0
return

IsValidKey(key) {
    return (key >= "a" and key <= "z") or (key >= "0" and key <= "9") or (key = " ") or (key = "Enter")
}

GuiClose:
ExitApp
