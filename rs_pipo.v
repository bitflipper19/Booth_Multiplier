/*
A 9 bit pipo arithmetic right shift register
    1. First 4 bits addressable as accumulator through
       load_acc and clr_acc signals and AS as output

    2. Next 4 bits addressable as multiplier through
       load_mxr signal 
    
    3. Whenever clr_acc is asserted, 9th bit is also made 0

    4. when shift is asserted, all 9 bits are shifted right, arithmetic RS
*/

module rs_pipo(
    output reg [8:0] shf_reg,
    input [3:0] AS, in,
    input clr_acc, load_acc, load_mxr, shift, clk
);

    always @(posedge clk) begin
        if(clr_acc) shf_reg<=9'b0;
        else if(load_mxr) shf_reg[4:1]<=in;
        else if(load_acc) shf_reg[8:5]<=AS;
        else if(shift) shf_reg<={shf_reg[8], shf_reg[8:1]};
    end
    
endmodule