module gen1MHz(
    input clk, reset,en, 
    input [4:0] c1, c1_limit,
    input en_8MHz,
    output en_1MHz,
    output [4:0] c2, c2_limit
);
    // wire [4:0] c2;
    // wire [4:0] c2_limit;
    assign c2_limit = 5'd7;
    assign en_1MHz = en && (c1==c1_limit) && (c2==c2_limit);
    
   

    upwardCounter #(5) Counter8 (.clk(clk), .reset(reset), .en(en && en_8MHz), .limit(c2_limit), .Q(c2));
    

endmodule

    
