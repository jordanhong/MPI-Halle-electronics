`timescale 1 us / 1 ns
module testbench ();
    //wire clkCore, clkZ, clka, clkB;
    reg clkCore, clkZ, clkA, clkB;
    reg [6:0] A_val, B_val;
    wire load;
    parameter Tz = 50;
    parameter T_core = 5.0;
    parameter Ta = 5.0;
    parameter Tb = 4;

    wire Set, Reset, Output;
    wire [6:0] counterA, counterB;
    
    
    initial begin
        clkCore = 0;
        clkZ = 1;
        clkA = 1;
        clkB = 1;
        A_val = 7'd2;
        B_val = 7'd2;
    end
        
    
    always #(Tz/2) clkZ = ~clkZ;
    always #(T_core/2) clkCore = ~clkCore;
    always #(Ta/2) clkA = ~clkA;
    always #(Tb/2) clkB = ~clkB;
 

    top myTop (.clkZ(clkZ), .clkCore(clkCore), .load(load), .clkA (clkA), .clkB(clkB), .A_val(A_val), .B_val(B_val),.set(Set), .reset(Reset), .signal (Output) , .cA(counterA), .cB(counterB) );
    
    

endmodule
