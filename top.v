module top(
    output [7:0] result,
    output done,
    input [3:0] data_in,
    input clk, rst, start
);

    wire [1:0] count; wire Q1, Q0, load_mxd, load_mxr, clr_acc, 
    load_acc, shift, rst_cntr, dec, add, sub;
    datapath D0(
        result,
        count,
        Q1, Q0,
        data_in,
        load_mxd, load_mxr, 
        clr_acc, load_acc, 
        shift, rst_cntr, 
        dec, add, sub, clk
    );

    controller fsm(
        load_mxd, load_mxr, 
        clr_acc, load_acc, 
        shift, dec, add, 
        sub, done, rst_cntr,
        count, Q1, Q0, clk, rst, start
    );
    
endmodule