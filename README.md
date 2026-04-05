# Objects Tool
![GitHub repo size](https://img.shields.io/github/repo-size/tanazd2/c-objects)

A macro-based object system for C designed for Termux.

## Features
- Object-like structures in C
- Macro-based DSL
- No malloc
- Supports: `line` (raw), `kv` (key-value), `cmd` (commands)

## Usage
```c
#include "objects.h"
obj(app) {
  line("Start");
  kv(mode,"debug");
  cmd(printf,"Hello\n");
}
```

## Install (Termux)
```sh
git clone https://github.com/YOUR_USERNAME/objects-tool.git
cd objects-tool
chmod +x install.sh
./install.sh
```

## Compile & Run
```sh
clang main.c -o app
./app
```

## Notes
- Commands stored, not auto-executed
- Fixed-size buffers, no malloc
- Object = Data + Metadata + Stored Commands

## License
MIT

