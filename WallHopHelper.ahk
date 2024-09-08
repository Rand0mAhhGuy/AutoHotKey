; YOU NEED TO DOWNLOAD AUTO HOTKEY V1.1 SPECIFICALLY TO RUN THIS SCRIPT
Gui, Font, s10
Gui, Add, Text, x10 y10 w230 Center, Made by Rand0mAhhGuy on GitHub!
Gui, Add, Text, x10 y30 w230 Center, Enter your desired hotkey:
Gui, Add, Edit, x10 y50 w150 vNewHotkey
Gui, Add, Button, x170 y50 w70 h24 gUpdateHotkey, Enter
Gui, Add, Text, x0 y80 w160 Center vCurrentHotkeyText, Current Hotkey: None
Gui, Add, Button, x150 y78 w90 h20 gResetHotkey, Clear HotKey
Gui, Add, Button, x10 y105 w180 h40 gToggleHotkey vToggleBtn, Activate
Gui, Add, Button, x200 y105 w40 h40 gShowGuide, Guide
Gui, Show, w250 h155, Wallhop Helper

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
            if (HotkeyStatus = "On") {
                GuiControl,, ToggleBtn, Deactivate
            } else {
                GuiControl,, ToggleBtn, Activate
            }
        }
    } else {
        MsgBox, Invalid Key! Hotkey can only be 1 letter or number.
    }
return

ResetHotkey:
    if (HotkeyKey) {
        Hotkey, %HotkeyKey%, Labels, Off
    }
    HotkeyKey := ""
    GuiControl,, CurrentHotkeyText, Current Hotkey: None
    GuiControl,, ToggleBtn, Activate
    HotkeyStatus := "Off"
return

Labels:
    MouseGetPos, x, y
    MouseMove, x+4, y, 0
    MouseMove, x-4, y, 0
return

IsValidKey(key) {
    return (StrLen(key) = 1 and ((key >= "a" and key <= "z") or (key >= "0" and key <= "9")))
}

ShowGuide:
    Gui, 2:+Resize
    Gui, 2:Font, s10
    Gui, 2:Add, Text, x10 y10 w230 h100 vGuideText, Remember to turn on Shiftlock.`n`nThe script only flicks your camera; you need to jump and walk yourself.`n`nHotkey can only be 1 letter or number.
    Gui, 2:Add, Button, x80 y115 w80 h30 gCloseGuide, Got it!
    Gui, 2:Show, w250 h160, Guide
return

CloseGuide:
    Gui, 2:Destroy
return

GuiClose:
    ExitApp
