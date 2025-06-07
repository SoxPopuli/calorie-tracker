type themeColorProps = {
  light?: option<string>,
  dark?: option<string>,
}

type themeColorName = [
  | #text
  | #background
  | #tint
  | #icon
  | #tabIconDefault
  | #tabIconSelected
]

@module("@/hooks/useThemeColor")
external useThemeColor: (themeColorProps, themeColorName) => string = "useThemeColor"
