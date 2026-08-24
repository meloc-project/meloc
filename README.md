# Meloc
<img src="logo.png" alt="Meloc Logo" width="100" />

A specification to build software through declarations. Define reusable software modules with rules, states and contracts in plain [YAML](https://yaml.org/). The runtime handles execution. You focus on behavior, not implementation.

See the [specification](spec/index.md).

## What Meloc does
Meloc uses modules as its basic unit of software composition and execution, comparable to a class in an object-oriented language or a WASM module. Here are the differences:


|                      | Traditional languages    | Meloc                                   |
| -------------------- | ------------------------ | --------------------------------------- |
| **Expressions**      | Imperative code          | Declarative formulas and rules          |
| **Control flow**     | Free                     | Predictable and structured              |
| **State management** | Free                     | Explicitly declared                     |
| **Auditability**     | Depends on the code      | A design priority                       |
| **Efficiency**       | Can be a primary concern | Secondary to clarity and predictability |
| **Environment**      | Platform dependent       | Modular and runtime-agnostic            |

## Why Meloc?
Meloc deliberately limits how software behavior can be declared. This reduces expressiveness, but makes modules easier to understand, reason about, test, and audit.

Meloc aims to be a good alternative to general-purpose programming languages for most software, while leaving specialized low-level and high-performance use cases to other technologies.

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

A Meloc module does not execute environment-specific instructions such as `print()`. Its start method simply returns text. The environment consuming the module decides what to do with that result.

Because Meloc does not prescribe instructions that depend on a specific runtime environment, the same module can be interpreted from a console, web application, game, mobile app, or other environment.

Want to know more? See the whole [specification](spec/index.md).

## Current status
- 🔬 Experimental — MVP in development
- 📅 First functional case – Spring 2027

> **Note**: Interoperability with existing systems (REST APIs, databases) is planned for future versions.

## Contribute
- Report any issue at GitHub ⚠️
- Test the spec before launch 🚀
- Collaborate on examples of use 💻

## License
Code: MIT License. Logo and Brand: All Rights Reserved.

You may use the Meloc logo to indicate compatibility or attribution. Do not modify the logo or claim ownership.

Contact selector.yardas_0u@icloud.com for commercial use permissions.
