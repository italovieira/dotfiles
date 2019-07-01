import XMonad
import XMonad.Util.Run (spawnPipe, hPutStrLn)
import XMonad.Util.EZConfig (additionalKeys)
import XMonad.Config.Desktop
import XMonad.Layout.NoBorders (smartBorders)
import XMonad.Hooks.DynamicLog

main = do
    h <- spawnPipe "xmobar"

    xmonad $ desktopConfig
        { modMask  = mod4Mask
        , terminal = "alacritty -e tmux"
        , layoutHook = smartBorders $ layoutHook desktopConfig
        , logHook = dynamicLogWithPP $ xmobarPP { ppOutput = hPutStrLn h }
        } `additionalKeys`
        [ ((mod4Mask, xK_F1),  spawn "bluetoothctl power on")
        , ((mod4Mask, xK_F10), spawn "playerctl play-pause")
        , ((mod4Mask, xK_F11), spawn "playerctl previos")
        , ((mod4Mask, xK_F12), spawn "playerctl next")
        ]
