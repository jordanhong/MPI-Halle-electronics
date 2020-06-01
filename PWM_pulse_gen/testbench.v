`timescale 1 ns / 100 ps
module testbench ();

    reg clkZ, clkA, clkB;
    reg [3:0] A_val, B_val;
    parameter Tz = 10;
    parameter Ta = 9;
    parameter Tb = 8;

    wire Set, Reset, Output;
    wire [3:0] counterA, counterB;
    
    
    initial begin
        clkZ = 0;
        clkA = 0;
        clkB = 0;
        A_val = 4'd3;
        B_val = 4'd2;
    end
        
        
    always begin
        #(Tz/2) clkZ = ~clkZ;
        #(Ta/2) clkA = ~clkA;
        #(Tb/2) clkB = ~clkB;
    end


    top myTop (.clkZ(clkZ), .clkA (clkA), .clkB(clkB), .A_val(A_val), .B_val(B_val),.set(Set), .reset(Reset), .signal (Output) , .cA(counterA), .cB(counterB) );
    
    

endmodule
