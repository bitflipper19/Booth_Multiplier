module top(
    output [7:0] result,
    output reg done,
    input [3:0] data_in,
    input clk, rst, start
);
    reg signed [8:0] rs_pipo;
    reg signed [3:0] pipo;
    reg [3:0] state;
    reg [2:0] cntr;
    localparam S0=4'd0, S1=4'd1, S2=4'd2, S3=4'd3, S4=4'd4, 
               S5=4'd5, S6=4'd6, S7=4'd7, S8=4'd8;

    always @(posedge clk) begin
        if(rst) state<=S0;
        else begin 
            case(state)
                S0: if(start) state<=S1;
                S1: state<=S2;
                S2: state<=S3;
                S3: begin
                    if(~(|cntr)) state<=S4;
                    else state<=S5;
                end
                S4: state<=S4;
                S5: begin
                    case({rs_pipo[1], rs_pipo[0]})
                        2'b00: state<=S6;
                        2'b01: state<=S7;
                        2'b10: state<=S8;
                        2'b11: state<=S6;
                    endcase
                end
                S6: state<=S3;
                S7: state<=S3;
                S8: state<=S3;
            endcase
        end
    end

    always @(posedge clk) begin
        done=1'b0;
        if(!rst) case(state)
            S1: begin
                pipo<=data_in;
                cntr<=3'b100;
                rs_pipo<=9'b0;
            end

            S2: rs_pipo[4:1]<=data_in;

            S4: done<=1'b1;
            S6: begin
                rs_pipo<={rs_pipo[8], rs_pipo[8:1]};
                cntr<=cntr-1'b1;
            end
            S7: begin
                rs_pipo[8:5]=rs_pipo[8:5]+pipo;
                rs_pipo<={rs_pipo[8], rs_pipo[8:1]};
                cntr<=cntr-1'b1;
            end
            S8: begin
                rs_pipo[8:5]=rs_pipo[8:5]-pipo;
                rs_pipo<={rs_pipo[8], rs_pipo[8:1]};
                cntr<=cntr-1'b1;
            end
        endcase
    end

    assign result=rs_pipo[8:1];

endmodule