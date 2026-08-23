# Meloc
<img src="logo.png" alt="Meloc Logo" width="100" />

Software definition without programming. Define reusable modules in plain [YAML](https://yaml.org/). No compilers. Just declarations.

See the [specification](spec/index.md).

## What Meloc does

| Meloc                      | Traditional languages                    |
|----------------------------|------------------------------------------|
| Declarative structures     | Imperative code                          |
| Human types (number, text) | Technical types (int32, float64, string) |
| Auditable rules            | Hidden logic                             |

[Read the manifest](manifest.md).

## Minimal example
`hello-world.yaml`
```yaml
type: meloc/module@0.0.0
name: hello-world
version: 1.0.0

methods:
  - name: start
    type: text
    formula: "Hello, world!"
```

This is expected to work well with something like `meloc run hello-world` in your terminal.

Want to know more? See the whole [specification](spec/index.md).

## Current status
- 🔬 Experimental — MVP in development
- 📅 First functional case – Spring 2027

**Note**: Interoperability with existing systems (REST APIs, databases) is planned for future versions.

## Contribute
- Report any issue at GitHub ⚠️
- Test the spec before launch 🚀
- Collaborate on examples of use 💻

## License
Code: MIT License. Logo and Brand: All Rights Reserved.

You may use the Meloc logo to indicate compatibility or attribution. Do not modify the logo or claim ownership.

Contact selector.yardas_0u@icloud.com for commercial use permissions.
