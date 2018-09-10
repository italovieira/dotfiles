import XMonad
import XMonad.Util.Run (spawnPipe)
import XMonad.Config.Desktop

main = do
    spawnPipe "xmobar"

    xmonad desktopConfig
        { modMask  = mod4Mask
        , terminal = "termite"
        }
