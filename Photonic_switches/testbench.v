`timescale 1 ps / 100 fs
module testbench ();

    reg clkCore, en, reset;
    reg clkA, clkB;
    wire en_8MHz, en_1MHz;
    wire [4:0] c1, c2;
    
    reg [12:0] W = 13'd0002;
    wire [6:0] A_val, B_val;
    wire En;
    wire enS, enR;
    wire PWMreset, PWMset, signal, signal_b;
    wire latch;
    wire [6:0] cA, cB;
   
    // Parameters in ns 
//    parameter T_core = 5.0;                                 
//    // Testing frequency for A(4MHz) and B(5MHz) 
//    // parameter Ta = 250;                                 
//    // parameter Tb = 200;
//
//    parameter Ta = 12.5;
//    parameter Tb = 10; // somehow generating 81 Mhz doesn't work. Using 100 MHz instead   

//  Parameters in ps
    parameter T_core = 5000;                                 
    // Testing frequency for A(4MHz) and B(5MHz) 
    // parameter Ta = 250000;                                 
    // parameter Tb = 200000;

    parameter Ta = 12500;
    parameter Tb = 12346;   

    assign latch = ~signal & ~signal_b; 


    initial begin
        clkCore = 1;
        clkA = 1;
        clkB = 1;
        reset = 1;
        en = 1;
        
        #(T_core/2) reset = 0;
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
                .PWMreset(PWMreset), .PWMset(PWMset), .signal(signal), .signal_b(signal_b),
                .cA(cA), .cB(cB),

                .c1(c1), .c2(c2),
                .en_8MHz(en_8MHz), .en_1MHz(en_1MHz),
                .A_val(A_val), .B_val(B_val), 
                .En(En),
                .enS(enS), .enR(enR)
                );
    

    
//===================== Debugging use only, work example=====================
   
//    wire R1_condition;
//    wire [4:0] c1;
//    assign R1_condition = (c1==5'd24);
//    upwardCounter #(5) Counter25 (clk, reset, en, 5'd24, c1);
//    receiver R1 (clk, reset, R1_condition, Temp);

endmodule
