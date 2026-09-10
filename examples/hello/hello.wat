(module
  (memory (export "memory") 1)

  (data (i32.const 0) "Hello, ")

  (global $result_pointer i32 (i32.const 64))

  (func
    (export "result_pointer")
    (result i32)
    (global.get $result_pointer)
  )

  (func
    (export "greet")
    (param $name_pointer i32)
    (param $name_length i32)

    (memory.copy
      (global.get $result_pointer)
      (i32.const 0)
      (i32.const 7)
    )

    (memory.copy
      (i32.add (global.get $result_pointer) (i32.const 7))
      (local.get $name_pointer)
      (local.get $name_length)
    )

    (i32.store8
      (i32.add
        (global.get $result_pointer)
        (i32.add (i32.const 7) (local.get $name_length))
      )
      (i32.const 33)
    )
  )
)
