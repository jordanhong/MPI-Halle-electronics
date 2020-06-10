`timescale 1 ns / 100 ps
module testbench ();

    reg clkCore, en, reset;
    reg clkA, clkB;
    wire Temp;
    wire en_8MHz, en_1MHz;
    wire [4:0] c1, c2;
    
    reg [12:0] W = 13'd6479;
    wire [6:0] A_val, B_val;
    wire En;
    wire PWMreset, PWMset, signal;
    wire [6:0] cA, cB;
    
    parameter T_core = 5.0;                                 
    parameter Ta = 12.5;                                 
    parameter Tb = 12.35;
    


    initial begin
        clkCore = 0;
        clkA = 1;
        clkB = 1;
        reset = 0;
        en = 1;
        
        //#(349*T_core) en = 0;
        //#(30*T_core/2)  en = 1;
        //#(39*T_core/2) reset = 1;
        //#(3*T_core/2) reset = 0;
        end
        
        
    always #(T_core/2) clkCore = ~clkCore;                                 
    always #(Ta/2) clkA = ~clkA;
    always #(Tb/2) clkB = ~clkB; 


    top myTop ( .clk(clkCore), .reset(reset), .en(en), 
                .clkA(clkA), .clkB(clkB),
                .W(W),
                .PWMreset(PWMreset), .PWMset(PWMset), .signal(signal),
                .cA(cA), .cB(cB),

                .temp(Temp),
                .c1(c1), .c2(c2),
                .en_8MHz(en_8MHz), .en_1MHz(en_1MHz),
                .A_val(A_val), .B_val(B_val), 
                .En(En)
                );
    

    
//===================== Debugging use only, work example=====================
   
//    wire R1_condition;
//    wire [4:0] c1;
//    assign R1_condition = (c1==5'd24);
//    upwardCounter #(5) Counter25 (clk, reset, en, 5'd24, c1);
//    receiver R1 (clk, reset, R1_condition, Temp);

endmodule
