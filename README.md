# Meloc
<img src="logo.png" alt="Meloc Logo" width="100" />

A [specification](spec/index.md) to build software through declarations. Build Meloc modules just writing them in YAML. Focus on what your module does, not how. No imperative code, no technical types. Only rules, states, and contracts.

Meloc aspires to redesign the way that we build software. I look for active ways to make development more natural and make safer and more flexible results. The project was built based on the principles found in this manifest.

## Why Meloc is different
|                 | Meloc                | Java/JavaScript/Python  | C++/Rust/Go            |
| --------------- | -------------------- | ----------------------- | -----------------------|
| **Paradigm**    | Declarative          | Imperative (high level) | Imperative (low level) |
| **Expressions** | Structures and rules | High-level instructions | Low-level instructions |
| **Types**       | Functional           | Half-functional         | Technical              |

## Initial example
`hello-world.yaml`
```yaml
type: meloc@0.0.0
name: hello-world
version: 1.0.0

methods:
  - name: greet
    type: text
    formula: "Hello, world!"
```

This is expected to work well with something like `meloc hello-world --call greet`.

Want to know more? See the whole [specification](spec/index.md).

## Current status
- Experimental 🧪 — MVP still in development
- First functional case 📅 — Spring 2027

## Contribute
- Report any issue at GitHub ⚠️
- Test the spec before launch 🚀
- Collaborate on examples of use 💻

## License
Code: MIT License. Logo and Brand: All Rights Reserved.

You may use the Meloc logo to indicate compatibility or attribution. Do not modify the logo or claim ownership.

Contact selector.yardas_0u@icloud.com for commercial use permissions.
