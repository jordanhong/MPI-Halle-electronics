`timescale 1 ns / 100 ps
module testbench ();

    reg clkCore, en, reset;
    reg clkA, clkB;
    parameter T = 10;
    wire Temp;
    wire en_8MHz, en_1MHz;
    wire [4:0] c1, c2;

    wire [6:0] A_val, B_val;
    wire PWMreset, PWMset, signal;
    wire [6:0] cA, cB;
    wire load;

    assign A_val [6:0] = 7'd2;
    assign B_val [6:0] = 7'd15;
    
    
    parameter T_core = 5.0;                                 
    parameter Ta = 12.5;                                 
    parameter Tb = 12.35;
    


    initial begin
        clkCore = 0;
        clkA = 1;
        clkB = 1;
        reset = 0;
        en = 1;
        
//        #(10*T/2) en = 0;
//        #(3*T/2)  en = 1;
//        # (39*T/2) reset = 1;
//        # (3*T/2) reset = 0;
        end
        
        
    always #(T_core/2) clkCore = ~clkCore;                                 
    always #(Ta/2) clkA = ~clkA;
    always #(Tb/2) clkB = ~clkB; 


    top myTop ( .clk(clkCore), .reset(reset), .en(en), 
                .clkA(clkA), .clkB(clkB),
                .A_val(A_val), .B_val(B_val), 
                .PWMreset(PWMreset), .PWMset(PWMset), .signal(signal),
                .cA(cA), .cB(cB),

                .temp(Temp),
                .c1(c1), .c2(c2),
                .en_8MHz(en_8MHz), .en_1MHz(en_1MHz),
                .load(load)
                );
    

    
//===================== Debugging use only, work example=====================
   
//    wire R1_condition;
//    wire [4:0] c1;
//    assign R1_condition = (c1==5'd24);
//    upwardCounter #(5) Counter25 (clk, reset, en, 5'd24, c1);
//    receiver R1 (clk, reset, R1_condition, Temp);

endmodule
