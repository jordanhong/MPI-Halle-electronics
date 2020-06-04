`timescale 1 us / 1 ns
module testbench ();

    reg clkCore, clkZ, clkA, clkB;
    reg [3:0] A_val, B_val;
    wire load;
    parameter Tz = 500;
    parameter T_core = 5.0;
    parameter Ta = 12.5;
    parameter Tb = 12.35;

    wire Set, Reset, Output;
    wire [3:0] counterA, counterB;
    
    
    initial begin
        clkCore = 0;
        clkZ = 1;
        clkA = 0;
        clkB = 0;
        A_val = 4'd15;
        B_val = 4'd2;
    end
        
    
    always #(Tz/2) clkZ = ~clkZ;
    always #(T_core/2) clkCore = ~clkCore;
    always #(Ta/2) clkA = ~clkA;
    always #(Tb/2) clkB = ~clkB;
 

    
    top myTop (.clkZ(clkZ), .clkCore(clkCore), .load(load), .clkA (clkA), .clkB(clkB), .A_val(A_val), .B_val(B_val),.set(Set), .reset(Reset), .signal (Output) , .cA(counterA), .cB(counterB) );
    
    

endmodule
