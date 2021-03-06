`timescale 1 ps / 1 fs
module testbench ();

    reg clkCore, en, reset; 
    reg clkA, clkB;
    wire en_8MHz, en_1MHz;
    wire [4:0] c1, c2;
    
    reg [12:0] W = 13'd0002;
    wire [6:0] A_val, B_val;
    wire decoderDone;
    wire PWMreset, PWMset, signal;
    wire [6:0] cA, cB;
    reg load;   

    // Testing frequency for A(4MHz) and B(5MHz) 
    // parameter Ta = 250000;                                 
    // parameter Tb = 200000;

    //  Parameters in ps
    parameter T_core = 5000;                                 
    parameter Ta = 12500;
    parameter Tb = 12345.679;   



    initial begin
        clkCore = 1;
        clkA = 1;
        clkB = 1;
        reset = 1;
        en = 1;
        load = 1;

        #(T_core/2) begin
            // load tells the system that we wrote a new value, 
            // so load all parameters and enable decoder
            reset = 0; 
            load = 0;
        end

        #(2531*T_core/2) begin
            load = 1;
            W = 13'd6479;
        end
        #(3*T_core/2) load = 0;

        #(4531*T_core/2) begin
            load = 1;
            W = 13'd3000;
        end
        #(3*T_core/2) load = 0;

        #(2531*T_core/2) begin
            load = 1;
            W = 13'd0;
        end
        #(3*T_core/2) load = 0;

        #(3000*T_core/2) begin
            load = 1;
            W = 13'd1000;
        end
        #(3*T_core/2) load = 0;

        #(3000*T_core/2) begin
            load = 1;
            W = 13'd500;
        end
        #(3*T_core/2) load = 0;


        #(3000*T_core/2) begin
            load = 1;
            W = 13'd6480;
        end
        #(3*T_core/2) load = 0;



        end
       
    // Configure clk signals to invert 
    always #(T_core/2) clkCore = ~clkCore;                                 
    always #(Ta/2) clkA = ~clkA;
    always #(Tb/2) clkB = ~clkB; 


    top myTop ( .clk(clkCore), .reset(reset), .en(en), .load(load),
                .clkA(clkA), .clkB(clkB),
                .W(W),
                .PWMreset(PWMreset), .PWMset(PWMset), .signal(signal),
                .cA(cA), .cB(cB),

                .c1(c1), .c2(c2),
                .en_8MHz(en_8MHz), .en_1MHz(en_1MHz),
                .A_val(A_val), .B_val(B_val), 
                .decoderDone(decoderDone)
                );
    

    
//===================== Debugging use only, work example=====================
   
//    wire R1_condition;
//    wire [4:0] c1;
//    assign R1_condition = (c1==5'd24);
//    upwardCounter #(5) Counter25 (clk, reset, en, 5'd24, c1);
//    receiver R1 (clk, reset, R1_condition, Temp);

endmodule
