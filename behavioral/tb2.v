module tb;
    wire [7:0] result;
    wire done;
    reg [3:0] mxd, mxr;
    reg clk, rst, start;

    top dut(
        result,
        done,
        mxd, mxr, 
        clk, rst, start
    );

    initial begin
        clk=1'b0;
        rst=1'b0;
        start=1'b0;
        mxd=4'b0100;
        mxr=4'b1011;
    end

    always #5 clk=~clk;

    initial begin
        #6 rst=1'b1;
        #9 rst=1'b0; 
        #1 start=1'b1;
        #99 $finish;
    end

    initial begin
        $dumpfile("behv.vcd"); $dumpvars(0, tb);
    end

endmodule