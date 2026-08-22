# The Meloc Specification

- **Current version**: 0.0.0
- **Last update**: 2026, 19 August

This **specification** defines the mandatory format that every Meloc module must follow. Use it as a technical reference to make your module valid, portable, and executable in any supported execution environment.

## Minimum requirements

All Meloc modules must be valid [YAML 1.2](https://yaml.org/spec/1.2/) files. Else, the interpreter must reject the file with error #1 and the message "Error reading the file - the content is not valid YAML 1.2."

### `type`
Declares that the file is a Meloc module and indicates which version of the specification it uses. The interpreter must reject the file if it does not contain this field with error #2 and the message "Error due to absence of field `type` - the file is not recognized as a valid Meloc module."

The value must be a text with the format "`meloc/module@[version]`". The interpreter must reject any other format with error #3 and the message "Error in field `type` - the value does not follow the expected format: `meloc/module@[version]`." The version must include all three numbers, without omitting any. See more details in [[Version System]].

The interpreter must declare which specification version it supports. It must reject any version higher than the one it supports, and it must reject any lower version than the one it supports; it will do so with error #4 and the message "Error in the `type` field - the version `[0.x.y]` of Meloc is not compatible with this interpreter."

Example:
```yaml
type: meloc/module@0.0.0
```

### `name`
Declares the unique name that identifies the module. The interpreter must reject the file if it does not contain this field with error #5 and the message "Error due to absence of field `name` - the module does not have a name that identifies it."

The value must be a safe name - see details in [[Safe names]]. The interpreter must reject any other type of name with error #6 and the message "Field error `name` - the value does not meet the secure name requirements - more information at https://github.com/meloc-project/meloc/spec/secure-names.md."

Commonly the module will be hosted in a file system. The file that contains it must have exactly the same name as indicated in the `name` field. This requirement simplifies the process of resolving dependencies, and is mandatory even if the module is not being used as a dependency of another for now. See more details in [[Resolving Dependencies]]. The interpreter must reject any file whose name does not match the value of the `name` field with error #7 and the message "Error reading the file - the file name does not match the value of the `name` field."

> **Nota**: queda pendiente definir qué requisitos aplican a la extensión del archivo. ¿Debe ser siempre `.yml`/`.yaml`?

Example:
`mood-tracker.yaml`
```yaml
type: meloc/module@0.0.0
name: mood-tracker
```

### `version`
Declares the current version of the module. The interpreter must reject the file if it does not contain this field with error #8 and the message "Error due to absence of field `version` - the module does not indicate what its current version is."

The value must be a text that uses semantic versioning - see more details in [[Version System]]. The interpreter must reject any other format with error #9 and the message "Error of the field `version` - the value does not follow the semantic versioning format."

It is mandatory to always include the three numbers of the version - major, minor and patch. The interpreter must reject the value of the opposite with error n.º 10 and the message "Error in the `version` field - it is mandatory to include the three semantic versioning numbers: major, minor and patch".

If the component is hosted in a file system, the file that contains it can indicate the version within the file name. In such a case, the name of the module and its version must be separated by an address and the version must fit with the one indicated in the `version` field - for example, both `my-component@2` and `my-component@2.5` fit with version `2.5.8` and would be valid. This requirement simplifies the dependency resolution process - see more details in [[Resolving dependencies]]. The interpreter must reject any file whose name includes the version and it does not match the value of the `version` field with error #11 and the message "Error reading file - the version included in the name does not match the value of the `version` field."

Example:
`tic-tac-toe-engine@1.2.yaml`
```yaml
type: meloc/module@0.0.0
name: tic-tac-toe-engine
version: 1.2.0
```

## Más allá de lo requerido
Para que el componente sea coherente, necesita campos adicionales como los que se describen en esta sección. Su uso no es obligatorio y dependerá del propósito del componente y sus necesidades —ver más detalles en [[Modelos de diseño (Meloc Components)]].

### `display-name`
Declara el nombre natural del componente, en contraposición con su nombre seguro —campo `name`. El valor debe ser un texto.

> **Nota**: queda pendiente definir qué hace el intérprete si encuentra un valor vacío explícito en el campo. ¿Existe un modo estricto en YAML para evitar esto en cualquier campo?

Ejemplo:
```yaml
name: tic-tac-toe-engine
display-name: Tic-tac-toe Engine
```

### `state`
Declara una lista de propiedades que definen el estado del componente. Cada ítem de la lista se denomina propiedad de estado. Ver más detalles en [[Propiedades de estado (Meloc Components)]].

Ejemplo:
```yaml
type: meloc/component@0.0.0
name: to-dos-tool
version: 0.0.0

state:
  - name: to-dos
    type: list(record(label: text, is-done: assertion))
```
