# Booth_Multiplier
Parameterized [4 bit currently] Booth's multiplier in Verilog that implements Booth’s algorithm to multiply two signed numbers in 2’s complement form.

# Block Diagram
![Block Diagram](https://github.com/bitflipper19/Booth_Multiplier/blob/main/images/block_diagram.png)

Taken from [here](https://vlabs.iitkgp.ac.in/coa/exp7/index.html)

# Waveform
![Waveform](https://github.com/bitflipper19/Booth_Multiplier/blob/main/images/waveform.png)

# Waveform (Two cases)
![Waveform](https://github.com/bitflipper19/Booth_Multiplier/blob/main/images/waveform2.png)

# Steps to Run Locally

### Dependencies
- `iverilog`
- `gtkwave`

### Steps
```bash
# Clone repository
git clone https://github.com/bitflipper19/Booth_Multiplier
cd Booth_Multiplier

# Compile
iverilog *.v

# Run simulation
vvp a.out

# View waveform
gtkwave bmx.vcd

# Behavioral design (optional)
cd behavioral
iverilog *.v
vvp a.out
gtkwave bmx.vcd
```