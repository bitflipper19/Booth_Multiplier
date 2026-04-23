module pipo(
    output reg [3:0] out,
    input [3:0] in,
    input load, clk
);

    always @(posedge clk) begin
        if(load) out<=in;
    end
    
endmodule