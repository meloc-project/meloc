# The Meloc specification

- **Current version**: 0.0.0
- **Last update**: 2026, 19 August

Esta **especificación** define el formato obligatorio que todo componente Meloc debe seguir. Úsala como referencia técnica para que tu componente sea válido, portable y ejecutable en cualquier entorno de ejecución compatible.

## Requisitos mínimos
Todo componente Meloc debe ser un archivo [YAML 1.2](https://yaml.org/spec/1.2/) válido. El intérprete debe rechazar el archivo si el formato no lo fuera, con el error n.º 1 y el mensaje «Error al leer el archivo – el contenido no es YAML 1.2 válido».

Además, los siguientes campos son obligatorios:

### `type`
Declara que el archivo es un componente Meloc e indica qué versión de la especificación usa. El intérprete debe rechazar el archivo si no contiene este campo con el error n.º 2 y el mensaje «Error por ausencia del campo `type` – el archivo no se reconoce como componente Meloc válido».

El valor debe ser un texto con el formato «`meloc/component@[versión]`». El intérprete debe rechazar cuyo cualquier otro formato con el error n.º 3 y el mensaje «Error del campo `type` – el valor no sigue el formato esperado: `meloc/component@[versión]`». La versión debe incluir los tres números, sin omitir ninguno. Ver más detalles en [[Sistema de versiones (Meloc Components)]].

El intérprete debe soportar una versión de la especificación concreta, a ser posible la más reciente. Debe rechazar cualquier versión superior a la que soporte, y debe rechazar cualquier versión menor inferior a la que soporte; lo hará con el error n.º 4 y el mensaje «Error del campo `type` – la versión `[0.x.y]` de Meloc Components no es compatible con este intérprete».

Ejemplo:
```yaml
type: meloc/component@0.0.0
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
