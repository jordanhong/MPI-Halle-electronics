module gen1MHz(
    input clk, reset, 
    input [4:0] c1, c1_limit,
    input en_8MHz,
    output en_1MHz,
    output [4:0] c2, c2_limit
);
    // wire [4:0] c2;
    // wire [4:0] c2_limit;
    assign c2_limit = 5'd7;
    assign en_1MHz = (c1==c1_limit) && (c2==c2_limit);
    
   
    wire counter8_en;

    // Instantiate toggle to enable 8Counter
    //toggle T2 (.clk(clk), .reset(reset), .condition(en_8MHz),.en(counter8_en)); 
    assign  counter8_en = en_8MHz;

    upwardCounter #(5) Counter8 (.clk(clk), .reset(reset), .en(counter8_en), .limit(c2_limit), .Q(c2));
    

endmodule

    
