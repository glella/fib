#fibrs

A Python recursive fib module in Rust

Following Matthias Endler's 'Hello Rust' #8 tutorial: 
https://youtu.be/D9r__qxtRMQ

Updated instructions from library pyo3: 
https://pyo3.rs/v0.13.2/


Steps:

1- Install setuptools_rust

```
pip install setuptools_rust
```


2- Create rust lib crate with: (and then cd into it)

```
cargo new --lib fibrs
```

3- Copy setup.py and adapt for your project

4- Setup Cargo.toml lib and dependencies using: cargo add pyo3
and configuring Cargo.toml as follows:

```
[lib]
crate-type = ["cdylib"]
name = "fibrs"

[dependencies.pyo3]
version = "0.13.2"
features = ["extension-module"]
```


5- Create bindings for our extension creating a sub directory with same crate name and a python init file inside: __init__.py with:

```
from .fibrs import fib
```

6- Create fib module in lib.rs (follow latest docs like this version - tutorial uses an outdated version)

7- For macOS need to create a .cargo/config with:

```
[target.x86_64-apple-darwin]
rustflags = [
  "-C", "link-arg=-undefined",
  "-C", "link-arg=dynamic_lookup",
]

[target.aarch64-apple-darwin]
rustflags = [
  "-C", "link-arg=-undefined",
  "-C", "link-arg=dynamic_lookup",
]
```

8- cargo build --release

9- python setup.py install

10- Try it from another directory - open a terminal and Python REPL and import the module

