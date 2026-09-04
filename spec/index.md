# The Meloc Specification
- **Current version**: still in development
- **Last update**: 3 September 2026

This **specification** defines the mandatory format that every Meloc module must follow. Use it as a technical reference to make your module valid, portable, and executable in any supported execution environment.

## Representation
Meloc modules are represented using YAML 1.2.

This specification defines the structure and semantics of Meloc modules independently of any implementation, API, or execution environment.

Other tools may provide APIs or alternative representations for creating or manipulating Meloc modules, but these are outside the scope of this specification.

## Concepts
**Interpreter**: a tool able to read and execute Meloc modules. The tool must support one specific version of the Meloc Specification.

**Module**: Meloc’s basic unit of software composition and execution, comparable to a class in an object-oriented language or a WASM module.

Througout this document there are references to errors that the interpreter must throw on specific situations. For more information, see the full list of [Module Errors](module-errors.md).

## Minimum requirements
Meloc modules are built using basic [YAML 1.2](https://yaml.org/spec/1.2/) syntax. If an intended module turns out not to be a valid YAML 1.2 document, the interpreter must reject the file with error #1 and the message "Error reading the file - the content is not valid YAML 1.2."

### YAML features
Not all features included in [YAML 1.2](https://yaml.org/spec/1.2/) are needed for parsing Meloc modules. In fact, our specification only requires the following features:

| Feature                       | Usage in Meloc             |
|-------------------------------|----------------------------|
| UTF-8                         | The whole file (non-ASCII can be used in text values and comments)    |
| Mappings (`{ key: value }`)   | Define objects with fields |
| Sequences (`- item`)          | Item lists                 |
| Text scalar                   | All literal values         |
| Block literals (vertical bar) | Multiline formulas         |
| Comments (`# text`)           | Optional documentation     |

When hosted in a file system, a Meloc module must include the file extension `.yaml` in its name. Note that omitting the extension or including `.yml` instead are not valid options. The corresponding MIME type, when needed, must be `text/yaml`.

This specification uses concepts like text, number, list, or object freely referring to Meloc data types. Although they may be called similarly, Meloc data types are not YAML data types. Any value will be parsed the way Meloc represents data, not the way YAML does. See more information in [[Data Types]].

### `type`
Declares that the file is a Meloc module and indicates which version of the specification it uses. The interpreter must reject the file if it does not contain this field with error #2 and the message "Error due to absence of field `type` - the file is not recognized as a valid Meloc module."

The value must be a text with the format "`meloc/module@[version]`". The interpreter must reject any other format with error #3 and the message "Error in field `type` - the value does not follow the expected format: `meloc/module@[version]`." The version must include all three numbers, without omitting any. See more details in [Version System](version-system.md).

The interpreter must declare which specification version it supports. It must reject any version higher than the one it supports, and it must reject any lower version than the one it supports; it will do so with error #4 and the message "Error in the `type` field - the version `[0.x.y]` of Meloc is not compatible with this interpreter."

Example:
```yaml
type: meloc/module@0.0.0
```

### `name`
Declares the unique name that identifies the module. The interpreter must reject the file if it does not contain this field with error #5 and the message "Error due to absence of field `name` - the module does not have a name that identifies it."

The value must be a safe name - see details in [Safe Names](safe-names.md). The interpreter must reject any other type of name with error #6 and the message "Field error `name` - the value does not meet the safe name requirements - more information at https://github.com/meloc-project/meloc/spec/safe-names.md."

Commonly the module will be hosted in a file system. The file that contains it must have exactly the same name as indicated in the `name` field. This requirement simplifies the process of resolving dependencies, and is mandatory even if the module is not being used as a dependency of another for now. See more details in [[Resolving Dependencies]]. The interpreter must reject any file whose name does not match the value of the `name` field with error #7 and the message "Error reading the file - the file name does not match the value of the `name` field."

Example:
`mood-tracker.yaml`
```yaml
type: meloc/module@0.0.0
name: mood-tracker
```

### `version`
Declares the current version of the module. The interpreter must reject the file if it does not contain this field with error #8 and the message "Error due to absence of field `version` - the module does not indicate what its current version is."

The value must be a text that uses semantic versioning - see more details in [Version System](version-system.md). The interpreter must reject any other format with error #9 and the message "Error of the field `version` - the value does not follow the semantic versioning format."

It is mandatory to always include the three numbers of the version - major, minor and patch. The interpreter must reject the value of the opposite with error n.º 10 and the message "Error in the `version` field - it is mandatory to include the three semantic versioning numbers: major, minor and patch".

If the component is hosted in a file system, the file that contains it can indicate the version within the file name. In such a case, the name of the module and its version must be separated by an address and the version must fit with the one indicated in the `version` field - for example, both `my-component@2` and `my-component@2.5` fit with version `2.5.8` and would be valid. This requirement simplifies the dependency resolution process - see more details in [[Resolving dependencies]]. The interpreter must reject any file whose name includes the version and it does not match the value of the `version` field with error #11 and the message "Error reading file - the version included in the name does not match the value of the `version` field."

Example:
`tic-tac-toe-engine@1.2.yaml`
```yaml
type: meloc/module@0.0.0
name: tic-tac-toe-engine
version: 1.2.0
```

## Beyond what is required
For the module to be consistent, you need additional fields such as those described in this section. Its use is not mandatory and will depend on the purpose or needs of the module  - see more details in [[Design Models]].

### `display-name`
Declare the natural name of the module, as opposed to its safe name - field `name`. The value must be a text.

> **Nota**: queda pendiente definir qué hace el intérprete si encuentra un valor vacío explícito en el campo. ¿Existe un modo estricto en YAML para evitar esto en cualquier campo?

Example:
```yaml
name: tic-tac-toe-engine
display-name: Tic-tac-toe Engine
```

### `persistence`
Declares where the data is stored. The default value is `memory`. Allowed values are `device`, `external`, and `memory`.

### `state`
Declares a list of properties that define the state of the module. Each item in the list is called a state property. See more details in [[State Properties]].

Example:
```yaml
state:
  - name: to-dos
    type: list(record(label: text, is-done: assertion))
```
