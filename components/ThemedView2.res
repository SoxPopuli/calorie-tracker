open ReactNative
open Theme
open Utils

@react.component
let make = (~lightColor, ~darkColor, ~style: ReactNative.Style.t, ~children: React.element) => {
  let color = useThemeColor(
    {
      light: lightColor,
      dark: darkColor,
    },
    #background,
  )->(c => Style.s({color: c}))

  let style = [color, style]->Style.array

  let props: View.props = {
    style: ?someOption(style),
    children: ?someOption(children),
  }

  React.createElement(View.make, props)
}
