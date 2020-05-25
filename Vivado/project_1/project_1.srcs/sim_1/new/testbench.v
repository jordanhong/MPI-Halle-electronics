`timescale 1ns / 1ps
module testbench();
    reg [1:0] in;
    wire out;

    initial begin
        in[1:0] = 2'b0;
        #10 in[1:0] = 2'b01;
        #10 in[1:0] = 2'b10;
        #10 in[1:0] = 2'b11;
    end
    top AND (in , out);

endmodule

