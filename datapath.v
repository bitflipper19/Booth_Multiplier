/*
Status Signals (Output to Controller):
    1. count: current value of down counter
    2. Q1, Q0: LSB of Multiplier and the logical bit right of LSB

Control Signals (Input from Controller):
    1. load_mxd: load signal of Multiplicand
    2. load_mxr: load signal of Multiplier
    3. clr_acc: clear accumulator, sets it to 4'b0
    4. load_acc: load signal for accumulator, held high to load the adder output
    5. shift: Perform the arithmetic right shift
    6. rst_cntr: reset counter back to 2'b11
    7. dec: decrement counter
    8. add/sub: add or subtract

Others:
    1. data_in: Input data bus
    2. clk: Clock
    3. result: output, valid only when done goes high
*/

module datapath(
    output [7:0] result,
    output [2:0] count, 
    output Q1, Q0, // Q0=(Q)-1
    input [3:0] data_in,
    input load_mxd, load_mxr, clr_acc, load_acc, shift, rst_cntr, 
          dec, add, sub, clk
);
    wire [3:0] X, AS;
    wire [8:0] Y;

    pipo mxd(X, data_in, load_mxd, clk);

    /*
    Segregate the Load Accumulator, reset accumulator and
    load multiplier logic. 
    All the 9 bits of this rs_pipo must get 
    shifted together so It should be a single 9 bit 
    shift register, with its first 4 bits addressable 
    as accumulator and the next 4 as the multiplier. 
    */
    rs_pipo acc_mxr(Y, AS, data_in, clr_acc, load_acc, load_mxr, shift, clk);

    add_sub AS0(AS, Y[8:5], X, add, sub);

    /*
    This counter counts for 4 steps, 1 step takes = 2 clk cycles
    therefore, counter counts 8 clk cycles? (probably)
    */
    cntr C0(count, rst_cntr, dec, clk);

    assign {Q1, Q0}=Y[1:0];
    assign result=Y[8:1];

endmodule