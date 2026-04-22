module tb;
    wire [7:0] result;
    wire done;
    reg [3:0] data_in;
    reg clk, rst, start;

    top dut(
        result,
        done,
        data_in, clk,
        rst, start
    );

    initial begin
        start=1'b1;
        clk=1'b1;
        rst=1'b1;
        data_in=4'b0111;
    end

    always #5 clk=~clk;

    initial begin
        #12 rst=1'b0;
        #28 data_in=4'b1011;
        #150 rst=1'b1;
        #17 rst=1'b0; data_in=4'b1010;
        #23 data_in=4'b0100;
        #150 $finish;
    end

    initial begin
        $dumpfile("bmx.vcd"); $dumpvars(0, tb);
    end

endmodule