# Meloc
<img src="logo.png" alt="Meloc Logo" width="100" />

A specification to build software through declarations. Define reusable modules in plain [YAML](https://yaml.org/). No compilers. Just declarations.

See the [specification](spec/index.md).

## What Meloc does
> **Note**: A module is Meloc’s basic unit of software composition and execution, comparable to a class in an object-oriented language or a WASM module.

|Meloc                                                |Traditional languages               |
|-----------------------------------------------------|------------------------------------|
|Declarative structures                               |Imperative code                     |
|Explicitly declared state                            |Freely managed state                |
|Declarative formulas and rules                       |Instructions and algorithms         |
|Deliberately constrained control flow                |Freely defined control flow         |
|Human-readable abstractions                          |Implementation-oriented abstractions|
|Auditability as a design priority                    |Depends on the code                 |
|Deliberately constrained expressiveness              |General-purpose expressiveness      |
|Efficiency is secondary to clarity and predictability|Efficiency can be a primary concern |
|Designed to be runtime-agnostic                      |Interoperability depends on the ecosystem|

## Why Meloc?
Meloc deliberately limits how software behavior can be expressed. This reduces expressiveness, but makes modules easier to understand, reason about, test, and audit.

Meloc aims to be a good alternative to general-purpose programming languages for most software, while leaving specialized low-level and high-performance use cases to other technologies.

|                     | Traditional languages         | Meloc |
|----------------------|--------------------------------|---|
| **Purpose**          | Express any algorithm          | Describe software behavior |
| **Logic**            | Instructions and algorithms    | **Declarative formulas and rules** |
| **Control flow**     | Freely defined                 | **Deliberately constrained** |
| **State**            | Freely managed                 | **Explicitly declared** |
| **Behavior**         | Implemented step by step       | Derived from state, formulas, and methods |
| **Abstraction**      | Can reach low-level operations | **Deliberately separated from low-level operations**           |
| **Auditability**     | Depends on the code            | **A design priority** |
| **Expressiveness**   | General-purpose                | **Deliberately constrained** |
| **Efficiency**       | Can be a primary concern       | Secondary to clarity and predictability |
| **Interoperability** | Broad                          | Secondary to clarity and predictability |

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
