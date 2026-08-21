# The Meloc Specification

- **Current version**: 0.0.0
- **Last update**: 2026, 19 August

This **specification** defines the mandatory format that every Meloc module must follow. Use it as a technical reference to make your component valid, portable, and executable in any supported execution environment.

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
Declara el nombre único que identifica al componente. El intérprete debe rechazar el archivo si no contiene este campo con el error n.º 5 y el mensaje «Error por ausencia del campo `name` – el componente no tiene un nombre que lo identifique».

El valor debe ser un nombre seguro —ver los detalles en [[Nombres seguros (Meloc Components)]]. El intérprete debe rechazar cualquier otro tipo de nombre con el error n.º 6 y el mensaje «Error del campo `name` – el valor no cumple los requisitos de nombre seguro —más información en https://sitio-web/docs/spec/secure-names».

Comúnmente el componente estará alojado en un sistema de ficheros. El archivo que lo contenga debe tener exactamente el mismo nombre que se indique en el campo `name`. Este requisito simplifica el proceso de resolución de dependencias, y es obligatorio incluso si el componente no esta siendo usado como dependencia de otro por el momento. Ver más detalles en [[Resolución de dependencias (Meloc Components)]]. El intérprete debe rechazar cualquier archivo cuyo nombre no coincida con el valor del campo `name` con el error n.º 7 y el mensaje «Error al leer el archivo – el nombre del archivo no coincide con el valor del campo `name`».

> **Nota**: queda pendiente definir qué requisitos aplican a la extensión del archivo. ¿Debe ser siempre `.yml`/`.yaml`?

Ejemplo:
`budget-calculator.yaml`
```yaml
type: meloc/component@0.0.0
name: budget-calculator
```

### `version`
Declara la versión actual del componente. El intérprete debe rechazar el archivo si no contiene este campo con el error n.º 8 y el mensaje «Error por ausencia del campo `version` – el componente no indica cuál es su versión actual».

El valor debe ser un texto que use versionado semántico —ver más detalles en [[Sistema de versiones (Meloc Components)]]. El intérprete debe rechazar cualquier otro formato con el error n.º 9 y el mensaje «Error del campo `version` – el valor no sigue el formato de versionado semántico».

Es obligatorio incluir siempre los tres números de la versión —mayor, menor y parche—. El intérprete debe rechazar el valor de lo contrario con el error n.º 10 y el mensaje «Error del campo `version` – es obligatorio incluir los tres números de versionado semántico: mayor, menor y parche».

Si el componente está alojado en un sistema de ficheros, el archivo que lo contenga puede  indicar la versión dentro del nombre del archivo. En tal caso, el nombre del componente y su versión deben separarse por una arroba y la versión debe encajar con la que se indique en el campo `version` —por ejemplo, tanto `mi-componente@2` como `mi-componente@2.5` encajan con la versión `2.5.8` y serían válidos. Este requisito simplifica el proceso de resolución de dependencias —ver más detalles en [[Resolución de dependencias (Meloc Components)]]. El intérprete debe rechazar cualquier archivo cuyo nombre incluya la versión y esta no coincida con el valor del campo `version` con el error n.º 11 y el mensaje «Error al leer el archivo – la versión incluida en el nombre no coincide con el valor del campo `version`».

Ejemplo:
`tic-tac-toe-engine@1.2.yaml`
```yaml
type: meloc/component@0.0.0
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
