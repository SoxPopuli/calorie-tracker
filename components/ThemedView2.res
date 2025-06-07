open ReactNative
open Theme

@react.component
let make = (~lightColor, ~darkColor, ~style: ReactNative.Style.t, ~children: React.element) => {
  let color = useThemeColor(
    {
      light: lightColor,
      dark: darkColor,
    },
    #background,
  )

  let withStyle = %raw("(color, style) => [{color}, style]")
  <View style={withStyle(color, style)}> children </View>
}
