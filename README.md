# Meloc
<img src="logo.png" alt="Meloc Logo" width="100" />

A specification to build software through declarations. Define reusable modules in plain [YAML](https://yaml.org/). No compilers. Just declarations.

See the [specification](spec/index.md).

> **Note**: a module is Meloc’s basic unit of software composition, just like a class is for object-oriented programming.

## Why Meloc?
Meloc deliberately limits how software behavior can be expressed. This reduces expressiveness, but makes modules easier to understand, reason about, test, and audit.

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
