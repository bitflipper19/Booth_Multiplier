module controller(
    output reg load_mxd, load_mxr, clr_acc, load_acc, shift, 
           dec, add, sub, done, rst_cntr, // control signals
    input [2:0] count, // status signal
    input Q1, Q0, clk, rst, start // status signals
);
    reg [3:0] state;
    localparam S0=4'b0000, S1=4'b0001, S2=4'b0010, S3=4'b0011, S4=4'b0100, S5=4'b0101,
               S6=4'b0110, S7=4'b0111, S8=4'b1000; 

    always @(posedge clk) begin
        if(rst) state<=S0;
        else case(state)
            S0: if(start) state<=S1;
            S1: state<=S2;
            S2: state<=S3;
            S3: begin
                if(!(|count)) state<=S4;
                else state<=S5; 
            end
            S4: state<=S4;
            S5: begin
                case({Q1, Q0})
                    2'b00: state<=S6;
                    2'b01: state<=S7;
                    2'b10: state<=S8;
                    2'b11: state<=S6;
                endcase
            end
            S6: state<=S3;
            S7: state<=S3;
            S8: state<=S3;
            default: state<=S0;
        endcase
    end

    always @(*) begin
        load_mxd=1'b0; load_mxr=1'b0; load_acc=1'b0; clr_acc=1'b0;
        shift=1'b0; dec=1'b0; add=1'b0; sub=1'b0; done=1'b0; rst_cntr=1'b0;

        if(!rst) case(state)
            S1: begin
                load_mxd=1'b1;
                clr_acc=1'b1;
                rst_cntr=1'b1;
            end

            S2: load_mxr=1'b1;
            S4: done=1'b1;
            S6: begin 
                dec=1'b1;
                shift=1'b1;
            end
            S7: begin
                dec=1'b1;
                add=1'b1;
                shift=1'b1;
                load_acc=1'b1;
            end
            S8: begin
                dec=1'b1;
                sub=1'b1;
                shift=1'b1;
                load_acc=1'b1;
            end
        endcase
    end
    
endmodule