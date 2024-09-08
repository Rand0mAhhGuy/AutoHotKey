; YOU NEED TO DOWNLOAD AUTO HOTKEY V1.1 SPECIFICALLY TO RUN THIS SCRIPT
Gui, Font, s10
Gui, Add, Text, x10 y10 w230 Center, Made by Rand0mAhhGuy on GitHub!
Gui, Add, Text, x10 y30 w230 Center, Remember to turn on Shiftlock
Gui, Add, Text, x10 y50 w230 Center, Enter your desired hotkey:
Gui, Add, Edit, x10 y70 w150 vNewHotkey
Gui, Add, Button, x170 y68 w70 h24 gUpdateHotkey, Update
Gui, Add, Text, x10 y100 w230 Center vCurrentHotkeyText, Current Hotkey: None
Gui, Add, Button, x10 y120 w230 h40 gToggleHotkey vToggleBtn, Activate
Gui, Add, Text, x10 y165 w230 Center, The script only flicks your camera; you need to jump and walk yourself.
Gui, Show, w250 h205, Wallhop

HotkeyStatus := "Off"
HotkeyKey := ""
return

ToggleHotkey:
    if (HotkeyKey = "") {
        MsgBox, Please enter a hotkey first!
    } else {
        if (HotkeyStatus = "On") {
            Hotkey, %HotkeyKey%, Labels, Off
            GuiControl,, ToggleBtn, Activate
            HotkeyStatus := "Off"
        } else {
            Hotkey, %HotkeyKey%, Labels, On
            GuiControl,, ToggleBtn, Deactivate
            HotkeyStatus := "On"
        }
    }
return

UpdateHotkey:
    Gui, Submit, NoHide
    if (StrLen(NewHotkey) = 1 and IsValidKey(NewHotkey)) {
        if (NewHotkey != HotkeyKey) {
            if (HotkeyKey) {
                Hotkey, %HotkeyKey%, Labels, Off
            }
            HotkeyKey := NewHotkey
            Hotkey, %HotkeyKey%, Labels, On
            GuiControl,, CurrentHotkeyText, Current Hotkey: %HotkeyKey%
            ; Ensure button reflects new state
            if (HotkeyStatus = "On") {
                GuiControl,, ToggleBtn, Deactivate
            } else {
                GuiControl,, ToggleBtn, Activate
            }
        }
    } else {
        MsgBox, Invalid Key!
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
