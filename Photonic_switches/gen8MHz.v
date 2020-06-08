module gen8MHz(
    input clk, reset, en,
    output en_8MHz, 
    output [4:0] c1, c1_limit
);
    // wire [4:0] c1;
    // wire [4:0] c1_limit;
    assign c1_limit = 5'd24; 
    assign en_8MHz = (c1==c1_limit);

    
    upwardCounter #(5) Counter25 (.clk(clk), .reset(reset), .en(en), .limit(c1_limit), .Q(c1));

endmodule

    
