open ReactNative

// module ThemedText = {
//   @module("@/components/ThemedText") @react.component
//   external make: (~children: React.element) => React.element = "ThemedText"
// }

module S = {
  @genType @unboxed
  type t =
    | @as("a") A
    | Other(string)

  external to_string: t => string = "%identity"
}

@genType @react.component
let make = (~content=S.Other("hi")) => {
  <ThemedText2 darkColor="chartreuse" type_={#link}>
    {content->S.to_string->React.string}
  </ThemedText2>
}
