// All the implementations were tested on a Nexys 4 DDR FPGA board

module top(
    output [7:0] result,
    output reg done,
    input [3:0] mxd, mxr,
    input clk, rst, start
);

    reg [3:0] acc, Q, acc_next;
    reg Q_1;
    reg [2:0] cntr;

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            acc<=0; Q<=mxr; cntr<=3'b100; Q_1<=0; done<=0;
        end
        else if(start) begin
            done<=1'b0;
            if(|cntr) begin
                acc_next = acc;
                case({Q[0], Q_1})
                    2'b01: acc_next = acc + mxd;
                    2'b10: acc_next = acc + (~mxd + 1);
                endcase

                {acc, Q, Q_1} <= {acc_next[3], acc_next, Q};
                cntr <= cntr - 1'b1;
            end
            else done <= 1;
        end
    end

    assign result = {acc, Q};    
endmodule