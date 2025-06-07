type themeColorProps = {
  light?: string,
  dark?: string,
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
