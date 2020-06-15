module gen1MHz(
    input clk, load, en, 
    input [4:0] c1, c1_limit,
    input en_8MHz,
    output en_1MHz,
    output [4:0] c2, c2_limit
);
    // wire [4:0] c2;
    // wire [4:0] c2_limit;
    assign c2_limit = 5'd7;
    assign en_1MHz = en && (c1==0) && (c2==0);
    
   

    upwardCounter #(5) Counter8 (.clk(clk), .reset(load), .en(en && en_8MHz), .limit(c2_limit), .Q(c2));
    

endmodule

    
