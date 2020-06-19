module gen_PWM(
    input en,
    input reset,
    input clkCore,              // 200 MHz core clock
    input clkZ,                 // 1 MHz loading clk
    input clkA,                 // 80 MHz clock A 
    input clkB,                 // 81 MHz clock B
    input [6:0] A_val, B_val,   // Decoded A and B values

    output PWMset, PWMreset,    // set and reset signal for PWM 
    output signal, signal_b,    // signal and inverted signal (Debugging purpose)  from RS latch
    output [6:0] cA, cB         // Counter values for A and B (Debugging purpose)
);
    
    // Instantiate counters, counter loads in A and B from reg at rising clkZ
    downwardCounter #(7) counterA (.clk(clkA), .reset(1'b0), .load(clkZ), .en(en), .limit(A_val), .Q(cA)); 
    downwardCounter #(7) counterB (.clk(clkB), .reset(1'b0), .load(clkZ), .en(en), .limit(B_val), .Q(cB)); 
    
    //Instantiate comparators
    comparator comparatorA (.counter_clk(clkA),.in_x (cA), .in_y (7'd0),.en(en), .reset(1'b0), .comp(PWMreset));
    comparator comparatorB (.counter_clk(clkB),.in_x (cB), .in_y (7'd0),.en(en), .reset(1'b0), .comp(PWMset));
 

    // Instantiate RS flip flop
    rsFF pwm_gen (.reset(1'b0), .S(PWMset), .R(PWMreset), .out(signal), .out_b(signal_b) );


endmodule
