module datapath(
    output [1:0] count, 
    output Q1, Q0, // Q0=(Q)-1
    input [3:0] data_in,
    input load_mxd, load_mxr, load_acc, rst_acc, shift, dec, add, sub, clk
);
    wire [3:0] X, AS;
    wire [8:0] Y;

    pipo mxd(X, data_in, load_mxd, clk);

    /*
    Segregate the Load Accumulator, reset accumulator and
    load multiplier logic. 
    All the 9 bits of this rs_pipo
    must get shifted together so It should be a single 9 bit 
    shift register, with its first 4 bits addressable as accumulator
    and the next 4 as the multiplier. 
    */
    rs_pipo acc_mxr(Y, data_in, load_acc, load_mxr, shift, clk);

    add_sub AS0(AS, Y[4:1]);

endmodule