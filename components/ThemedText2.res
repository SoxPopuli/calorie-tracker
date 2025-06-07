open ReactNative
open Theme

let styles = {
  open Style
  StyleSheet.create({
    "default": s({
      fontSize: 16.0,
      lineHeight: 24.0,
    }),
    "defaultSemiBold": s({
      fontSize: 16.0,
      lineHeight: 24.0,
      fontWeight: #600,
    }),
    "title": s({
      fontSize: 32.0,
      fontWeight: #bold,
      lineHeight: 32.0,
    }),
    "subtitle": s({
      fontSize: 20.0,
      fontWeight: #bold,
    }),
    "link": s({
      lineHeight: 30.0,
      fontSize: 16.0,
      color: "#0a7ea4",
    }),
  })
}

type textTypes = [
  | #default
  | #title
  | #defaultSemiBold
  | #subtitle
  | #link
]

@react.component
let make = (
  ~style: option<ReactNative.Style.t>=?,
  ~lightColor: option<string>=?,
  ~darkColor: option<string>=?,
  ~type_: textTypes=#default,
  ~children: React.element,
) => {
  let color = useThemeColor({light: ?lightColor, dark: ?darkColor}, #text)

  let styleType = switch type_ {
  | #link => styles["link"]
  | #title => styles["title"]
  | #default => styles["default"]
  | #subtitle => styles["subtitle"]
  | #defaultSemiBold => styles["defaultSemiBold"]
  }

  let withStyles = %raw("(color, styleType, style) => [{color}, styleType, style]")

  <Text style={withStyles(color, styleType, style)}> children </Text>
}
