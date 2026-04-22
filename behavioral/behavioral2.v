module top(
    output [7:0] result,
    output done,
    input [3:0] data_in,
    input clk, rst, start
);

    reg [3:0] acc, Q, mxd;
    reg Q_1;
    reg [2:0] cntr;
    wire [3:0] add_sub;

    always @(posedge clk) begin
        if(rst) begin
            acc<=4'b0; Q<=4'b0; Q_1<=1'b0; cntr<=3'b100;
        end

        else if(start) begin
            // do
        end
    end
    
endmodule