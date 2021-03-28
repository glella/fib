extern crate pyo3;

use pyo3::prelude::*;

// add bindings to the generated python module
// N.B: names: "fibrs" must be the name of the `.so` or `.pyd` file

/// This module is implemented in Rust.
#[pymodule]
fn fibrs(_py: Python, m: &PyModule) -> PyResult<()> {
    // PyO3 aware function. All of our python interfaces could be declared in a separate module.
    // Note that the `#[pyfn()]` annotation automatically converts the arguments from
    // Python objects to Rust values; and the Rust return value back into a Python object.
    #[pyfn(m, "fib")]
    fn fib(_py: Python, n: u64) -> PyResult<u64> {
        let result = fib_recursive(n);
        Ok(result)
    }

    Ok(())
}

/// Gets the fibonacci number recursively - normal Rust function
#[pyfunction]
fn fib_recursive(n: u64) -> u64 {
    if n <= 1 {
        return n;
    }
    fib_recursive(n - 1) + fib_recursive(n - 2)
}
