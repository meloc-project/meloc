# Safe Names
A safe name is a unique text that identifies a module or an element within it. Its purpose is to describe what it represents in a short, neutral, and humanly-readable format. The field `name`, present both in the module and in most of its elements, is a clear example of the use of safe names, unlike the field `display-name`, which allows text of any kind.

The requirements of the text are as follows:

- The minimum length is one character
- The maximum length is 64 characters
- May contain lowercase letters and numbers
- Words are separated by dashes, instead of spaces
- No other signs are allowed - which excludes spaces, periods, commas, parentheses, bars, addresses, questions, diacritics, special characters, etc.

Example:
```yaml
name: tic-tac-toe-engine
display-name: Tic-tac-toe Engine
```
