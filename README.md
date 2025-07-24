# 🧮 Parameterized FIFO Design in Verilog

## 📌 Description
A flexible, parameterized FIFO module supporting custom **DATA_WIDTH** and **DEPTH**, designed for use in scalable digital systems. Supports synchronous write/read operations and includes full/empty flag logic.

## 🚀 Features
- Parameterized via `DATA_WIDTH` and `DEPTH` generics.
- Full and empty status flag implementation.
- Handles overflow and underflow.

## 🧪 Testbench
- Modular **`task`-based testbench** structure for maintainability.
- Three test cases
- Outputs monitored using `$display` with timestamps via `$time`.

## 🛠 Tools Used
- Verilog
- Xilinx Vivado

## 📁 Files
-[fifo source code](FIFO-Design-using-verilog/src/fifosyn.v)
-[fifo test bench code](FIFO-Design-using-verilog/src/fifosyn_tb.v)
