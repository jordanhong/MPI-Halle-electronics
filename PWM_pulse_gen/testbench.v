`timescale 1 us / 1 ns
module testbench ();

    reg clkZ, clkA, clkB;
    reg [3:0] A_val, B_val;
    reg loadA, loadB;
    parameter Tz = 5.0;
    parameter Ta = 12.5;
    parameter Tb = 12.35;

    wire Set, Reset, Output;
    wire [3:0] counterA, counterB;
    
    
    initial begin
        clkZ = 0;
        clkA = 0;
        clkB = 0;
        A_val = 4'd2;
        B_val = 4'd15;
        loadA = 1;
        loadB = 1;
        
        #(Tb) begin
            loadA = 0;
            loadB = 0;
            end
    end
        
        
    always #(Tz/2) clkZ = ~clkZ;
    always #(Ta/2) clkA = ~clkA;
    always #(Tb/2) clkB = ~clkB;
 


    top myTop (.clkZ(clkZ), .loadA(loadA), .loadB(loadB), .clkA (clkA), .clkB(clkB), .A_val(A_val), .B_val(B_val),.set(Set), .reset(Reset), .signal (Output) , .cA(counterA), .cB(counterB) );
    
    

endmodule
