`timescale 1 ns / 100 ps
module testbench ();

    reg clk, en, reset;
    parameter T = 10;
    wire Temp, pwmF;
    wire [4:0] count25, count8;


    initial begin
        clk = 0;
        reset = 0;
        en = 1;
        
//        #(10*T/2) en = 0;
//        #(3*T/2)  en = 1;
//        # (3*T/2) reset = 1;
//        # (4*T/2) reset = 0;
        end
        
        
    always #(T/2) clk = ~clk;


    top myTop ( clk, reset, en, Temp, pwmF, count25, count8);
    
    
    
//===================== Debugging use only, work example=====================
   
//    wire R1_condition;
//    wire [4:0] c1;
//    assign R1_condition = (c1==5'd24);
//    upwardCounter #(5) Counter25 (clk, reset, en, 5'd24, c1);
//    receiver R1 (clk, reset, R1_condition, Temp);

endmodule
