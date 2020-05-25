`timescale 1ns / 1ps


module top(
    input [1:0] in,
    output out
    );
    
    assign out = & in;
    
    
endmodule
