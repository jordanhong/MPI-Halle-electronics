module top(
    input clkZ, clkA,clkB,clkCore,
    input [6:0] A_val, B_val,
    output set, reset, signal,
    output [6:0] cA, cB,
    output load
    
);
    //wire load;
    //===========Debugging purposes==========================//
    // output cA and cB
    //wire [3:0] cA, cB;
    
    // Load data 
    toggle T (.clk(clkCore),.condition(clkZ) ,.en(load));
    
    
    
    // Instantiate counters
    downwardCounter #(7) counterA (.clk(clkA), .reset(load), .en(1'b1), .limit(A_val), .Q(cA)); 
    downwardCounter #(7) counterB (.clk(clkB), .reset(load), .en(1'b1), .limit(B_val), .Q(cB)); 
    
    //Instantiate comparators
    comparator comparatorA (.counter_clk(clkA), .core_clk(clkCore), .in_x (cA), .in_y (7'd0), .comp(reset));
    comparator comparatorB (.counter_clk(clkB), .core_clk(clkCore), .in_x (cB), .in_y (7'd0), .comp(set));
 

    // Instantiate RS flip flop
    rsFF pwm_gen (.S(set), .R(reset), .out(signal) );


endmodule
