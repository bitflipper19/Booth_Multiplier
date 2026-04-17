module cntr_tb;
    wire [1:0] count;
    reg rst, dec, clk;

    cntr DUT(
        .count(count),
        .rst(rst),
        .dec(dec),
        .clk(clk)
    );

    initial begin
        rst=1'b1;
        dec=1'b1;
        clk=1'b0;
    end

    initial begin
        #12 rst=1'b0;
        #30 rst=1'b1;
        #8 $finish;
    end

    always #5 clk=~clk;

    initial begin
        $dumpfile("cntr.vcd"); $dumpvars(0, cntr_tb);
    end
endmodule