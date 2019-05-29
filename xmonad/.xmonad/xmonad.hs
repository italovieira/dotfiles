import XMonad
import XMonad.Util.Run (spawnPipe, hPutStrLn)
import XMonad.Config.Desktop
import XMonad.Layout.NoBorders (smartBorders)
import XMonad.Hooks.DynamicLog

main = do
    h <- spawnPipe "xmobar"

    xmonad desktopConfig
        { modMask  = mod4Mask
        , terminal = "alacritty -e tmux"
        , layoutHook = smartBorders $ layoutHook desktopConfig
        , logHook = dynamicLogWithPP $ xmobarPP { ppOutput = hPutStrLn h }
        , workspaces = map show [1..9]
        }
