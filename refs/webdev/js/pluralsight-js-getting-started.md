# Notes from JavaScript: Getting Started

By Mark Zamoyta

## Notice

I skipped most of this course due to having most of the fundamentals under my belt. Notes below are what stuck out from 2x speed watch of selected sections.

## Section 3: Working with JavaScript Files

- 

## Section 4: Variables and Constants

- Valid variable names:
  - Start with:
    - `_ $ letter`
  - Followed by zero or more:
    - `_ $ letter number`
- Starting with underscore `_` typically means it's private
- Starting with dollar sign `$` typically used for automaticaly generated code
- Two underscores `__before__` and `__after__` are typically used for non-standard features
- Succinct but descriptive is ideal when naming variables/functions/methods/etc
- Big difference between `var` and `let` is that `var` is hoisted but `let` is not

## Section 5: Types and Operators

- Keep in mind floats are handled in a weird way. `1.1 + 1.3 = 2.4000000000000004`
- Symbols are a type of hidden property you can put inside an object

## Section 6: Program Flow

- `let` is local to most immediate scope:
  - `if (1 > 0) {let a = 0} console.log(a)` would throw an error

## Section 7: Functions

- Function Declaration/Statement:
  - `function showMessage() {}`
- Function Expression:
  - `let fn = function showMessage() {}`
  - The `showMessage` naming of the function is optional here, and cannot be used to call the function. Only available via `fn()`

## Section 8: Objects and the DOM

- Declare symbols with `let mySymbol = Symbol()`, then use in object like this: `let person = { [mySymbol]: 'secret info' }`
- DOM: Document Object Model

## Section 9: Arrays

- 

## Section 10: Scope and Hoisting
