module cntr(
    output reg [1:0] count,
    input rst, dec, clk
);

    always @(posedge clk) begin
        if(rst) count<=2'b11;
        else if(dec) count<=count-1'b1;
    end
    
endmodule