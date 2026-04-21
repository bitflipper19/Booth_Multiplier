module cntr(
    output reg [2:0] count,
    input rst, dec, clk
);

    always @(posedge clk) begin
        if(rst) count<=3'b100;
        else if(dec) count<=count-1'b1;
    end
    
endmodule