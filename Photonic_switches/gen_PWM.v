module gen_PWM(
    input en,
    input clkZ, clkA,clkB,clkCore,
    input [6:0] A_val, B_val,
    input reset,
    output PWMset, PWMreset, signal, signal_b,
    output [6:0] cA, cB,
    output enS, enR
);
    
    // Instantiate counters, counter loads in A and B from reg at rising clkZ
    downwardCounter #(7) counterA (.clk(clkA), .load(clkZ), .en(en), .limit(A_val), .Q(cA)); 
    downwardCounter #(7) counterB (.clk(clkB), .load(clkZ), .en(en), .limit(B_val), .Q(cB)); 
    
    //Instantiate comparators
    comparator comparatorA (.counter_clk(clkA),.in_x (cA), .in_y (7'd0), .reset(reset), .comp(PWMreset));
    comparator comparatorB (.counter_clk(clkB),.in_x (cB), .in_y (7'd0), .reset(reset), .comp(PWMset));
 

    // Instantiate RS flip flop
    rsFF pwm_gen (.S(PWMset), .R(PWMreset), .out(signal), .out_b(signal_b) );


endmodule
