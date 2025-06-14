module S = {
  @genType @unboxed
  type t =
    | @as("a") A
    | Other(string)

  external toString: t => string = "%identity"
}

@genType @react.component
let make = (~content=S.Other("hi")) => {
  <ThemedText2 darkColor="chartreuse" type_={#default}>
    {content->S.toString->React.string}
  </ThemedText2>
}
