import XMonad
import XMonad.Config.Gnome
import qualified Data.Map as M

main = xmonad $ gnomeConfig {
    keys = customKeys <+> keys defaultConfig
  }

customKeys XConfig {XMonad.modMask = modm} = M.fromList [
    ((modm .|. shiftMask, xK_z), spawn "gnome-screensaver-command -l")
  ]
