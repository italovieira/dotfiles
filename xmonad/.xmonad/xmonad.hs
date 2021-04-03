import XMonad
import XMonad.Util.Run (spawnPipe, hPutStrLn)
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Config.Desktop
import XMonad.Layout.NoBorders (smartBorders)
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops (ewmh)

main = do
    spawn "~/.fehbg"
    h <- spawnPipe "xmobar"

    let outputFile = " $HOME/Pictures/screenshots/$(date +%F-%T).png"
    let notifyScreenshot = " && notify-send 'Screenshot saved to clipboard'"
    let copyToClipboard = " | xclip -selection clipboard -t image/png -i"

    xmonad $ ewmh desktopConfig
        { modMask  = mod4Mask
        , terminal = "alacritty -e tmux"
        , layoutHook = smartBorders $ layoutHook desktopConfig
        , logHook = dynamicLogWithPP $ xmobarPP { ppOutput = hPutStrLn h }
        } `additionalKeysP`
        [ ("M-p", spawn "rofi -show")
        , ("M-<F1>", spawn "bluetoothctl power on && notify-send 'Bluetooth turned on'")
        , ("M-S-x",  spawn "loginctl lock-session")
        , ("<Print>", spawn $ "maim " ++ copyToClipboard ++ notifyScreenshot)
        , ("S-<Print>", spawn $ "maim -s " ++ copyToClipboard ++ notifyScreenshot)
        , ("C-<Print>", spawn $ "maim -i $(xdotool getactivewindow) " ++ copyToClipboard ++ notifyScreenshot)
        ]
