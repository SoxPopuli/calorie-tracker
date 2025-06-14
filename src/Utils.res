/** 
Coerces value to value option
Used to prevent use of `Caml_option.some` 
for abstract types we know are not null

```rescript
let props: View.props = {
  style: ?someOption(style),
  children: ?someOption(children),
}

React.createElement(View.make, props)
```
*/
external someOption: 'a => option<'a> = "%identity"
