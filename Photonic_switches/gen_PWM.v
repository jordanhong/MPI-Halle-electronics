module gen_PWM(
    input en,
    input clkZ, clkA,clkB,clkCore,
    input [6:0] A_val, B_val,
    input reset,
    output PWMset, PWMreset, signal,
    output [6:0] cA, cB
);
    
    // Instantiate counters, counter loads in A and B from reg at rising clkZ
    downwardCounter #(7) counterA (.clk(clkA), .reset(clkZ), .en(en), .limit(A_val), .Q(cA)); 
    downwardCounter #(7) counterB (.clk(clkB), .reset(clkZ), .en(en), .limit(B_val), .Q(cB)); 
    
    //Instantiate comparators
    comparator comparatorA (.counter_clk(clkA), .core_clk(clkCore), .in_x (cA), .in_y (7'd0), .comp(PWMreset));
    comparator comparatorB (.counter_clk(clkB), .core_clk(clkCore), .in_x (cB), .in_y (7'd0), .comp(PWMset));
 

    // Instantiate RS flip flop
    rsFF pwm_gen (.S(PWMset), .R(PWMreset), .out(signal), .reset(reset) );


endmodule
