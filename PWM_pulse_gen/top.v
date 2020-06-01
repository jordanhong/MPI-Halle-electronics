module top(
    input clkZ, clkA, clkB,
    input loadA, loadB,
    input [3:0] A_val, B_val,
    output set, reset, signal,
    output [3:0] cA, cB
);

    //===========Debugging purposes==========================//
    // output cA and cB
    //wire [3:0] cA, cB;
    

    // Instantiate counters
    downwardCounter #(4) counterA (.clk(clkA), .reset(loadA), .en(1'b1), .limit(A_val), .Q(cA)); 
    downwardCounter #(4) counterB (.clk(clkB), .reset(loadB), .en(1'b1), .limit(B_val), .Q(cB)); 
    
    //Instantiate comparators
    comparator comparatorA (.in_x (cA), .in_y (4'd0), .comp(reset) );
    comparator comparatorB (.in_x (cB), .in_y (4'd0), .comp(set) );

    // Instantiate RS flip flop
    rsFF pwm_gen (.S(set), .R(reset), .out(signal) );


endmodule
