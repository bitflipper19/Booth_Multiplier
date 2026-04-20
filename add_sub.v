module add_sub(
    output reg [3:0] AS,
    input [3:0] A, B,
    input add, sub
);

    always @(*) begin
        if(add) AS=A+B;
        else if(sub) AS=A-B;
    end
    
endmodule