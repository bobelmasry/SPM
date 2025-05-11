# 8x8 Signed Serial-Parallel Multiplier (SPM) – CSCE2301/230 Project 2

## Overview

This project implements an **8-bit Signed Serial-Parallel Multiplier (SPM)** on the **Artix-7 FPGA** using the **Basys 3 development board**. The design multiplies two signed 8-bit integers using a hybrid Serial-Parallel architecture, balancing speed and resource efficiency. The output product is displayed on a 4-digit 7-segment display, with scrolling and control handled by onboard push buttons.

## Team Members

- Aly Youssef
- Omar Beheiry
- Omar Al Sawy

(Each member will detail their contributions in the final report.)

---

## Features

- **Serial Input Multiplier (SW7–SW0)** and **Parallel Multiplicand (SW15–SW8)**
- **7-Segment Display Output**:
  - Right 3 digits display decimal product
  - Leftmost digit displays sign
- **Button-Controlled Navigation**:
  - `BTNL` and `BTNR`: Scroll digits of the product
  - `BTNC`: Start multiplication process
- **LED Indicator**:
  - `LD0`: Lights up upon multiplication completion

---

## System Components

### 1. **SPM Unit (Serial-Parallel Multiplier)**
   - Processes one operand serially and the other in parallel
   - Handles sign extension and signed arithmetic

### 2. **7-Segment Display Driver**
   - Converts binary result to decimal using BCD conversion
   - Manages digit scrolling

### 3. **Control Logic**
   - Coordinates input reading, multiplication cycles, output updating, and LED signaling

---

## Repository Structure

```bash
├── logisim/
│   ├── spm.circ                  # Logisim Evolution file for SPM
│   └── segment_driver.circ      # Logisim Evolution file for 7-segment display driver
├── src/
│   ├── spm.v                     # Verilog implementation of the SPM
│   ├── display_driver.v         # Verilog for 7-segment display driver
│   └── top_module.v             # Top-level integration file
├── report/
│   └── spm_report.pdf           # Final report (10 pages)
├── README.md                    # This file
└── LICENSE
