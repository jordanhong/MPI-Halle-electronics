module comparator (
    input counter_clk,
    input core_clk,
    input [6:0] in_x, in_y,
    input reset,
    output reg comp
);

    // Intialize
    initial comp = 0;
    
    always @(*)begin 
        if (reset) comp = 0;
        else if (in_x == in_y) comp = 1;
    end
    always @ (negedge core_clk) if (comp) comp<=0;

endmodule
