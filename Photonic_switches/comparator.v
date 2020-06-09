module comparator (
    input counter_clk,
    input core_clk,
    input [6:0] in_x, in_y,
    //input en,
    output reg comp
);

    // Intialize
    initial comp = 0;
    
    always @(*) if (in_x == in_y) comp = 1;
    always @ (negedge core_clk) if (comp) comp<=0;

endmodule
