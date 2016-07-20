import XMonad
import XMonad.Actions.CycleWindows
import XMonad.Actions.FloatSnap
import XMonad.Actions.FocusNth
import XMonad.Actions.Navigation2D
import XMonad.Actions.RotSlaves
import XMonad.Config.Gnome
import XMonad.Layout.NoFrillsDecoration
import XMonad.Layout.SimplestFloat
import XMonad.Util.Themes
import qualified Data.Map as M

main = xmonad
  $ withNavigation2DConfig navigationCfg
  $ gnomeConfig {
    keys = customKeys <+> keys defaultConfig,
    layoutHook = customLayout
  }

customKeys XConfig {XMonad.modMask = modm} = M.fromList [
    ((modm .|. shiftMask                , xK_z), spawn "gnome-screensaver-command -l")
  , ((modm              , xK_Tab), rotAllUp >> focusNth 0)
  , ((modm .|. shiftMask, xK_Tab), rotAllDown >> focusNth 0)
  -- Directional navigation of windows
  , ((modm,               xK_Right), windowGo R False)
  , ((modm,               xK_Left ), windowGo L False)
  , ((modm,               xK_Up   ), windowGo U False)
  , ((modm,               xK_Down ), windowGo D False)
  -- Snap movements
  , ((modm .|. shiftMask, xK_Right), withFocused $ snapMove R Nothing)
  , ((modm .|. shiftMask, xK_Left ), withFocused $ snapMove L Nothing)
  , ((modm .|. shiftMask, xK_Up   ), withFocused $ snapMove U Nothing)
  , ((modm .|. shiftMask, xK_Down ), withFocused $ snapMove D Nothing)
  -- Snap resizing
  , ((modm              , xK_h), withFocused $ snapGrow L Nothing)
  , ((modm .|. shiftMask, xK_l), withFocused $ snapShrink L Nothing)
  , ((modm              , xK_l), withFocused $ snapGrow R Nothing)
  , ((modm .|. shiftMask, xK_h), withFocused $ snapShrink R Nothing)
  , ((modm              , xK_k), withFocused $ snapGrow U Nothing)
  , ((modm .|. shiftMask, xK_j), withFocused $ snapShrink U Nothing)
  , ((modm              , xK_j), withFocused $ snapGrow D Nothing)
  , ((modm .|. shiftMask, xK_k), withFocused $ snapShrink D Nothing)
  ]

navigationCfg = defaultNavigation2DConfig {
  layoutNavigation = [("simplestFloat", centerNavigation)] }

customLayout = deco (simplestFloat ||| Full)
  where deco l = noFrillsDeco shrinkText (theme smallClean) l
