module top(
    input clk, reset, en,
    output temp, pwm_freq,
    output [4:0] c1,c2,
    output en_8MHz, en_1MHz
);
    wire [4:0] c1_limit, c2_limit;
    // Setup wire to hold counter results
    // wire [4:0] c1, c2;

    // Setup wire to hold enable for 8counter
   

    // Setup wire to hold enable toggle conditions
    // wire R1_condition, R2_condition;
    // assign R1_condition = (c1==5'd24);
    // assign R2_condition = (c2==5'd7) && (c1==5'd24); 
    

    // Instantiate toggle to enable 8Counter
    // toggle T2 (.clk(clk), .reset(reset), .condition(R1_condition),.en(counter8_en));  

    // Instantiate two counters 25 and 8
    // upwardCounter #(5) Counter25 (.clk(clk), .reset(reset), .en(en), .limit(5'd24), .Q(c1));
    // upwardCounter #(5) Counter8 (.clk(clk), .reset(reset), .en(counter8_en), .limit(5'd7), .Q(c2));

    gen8MHz G8 (.clk(clk), .reset(reset), .en(en), .en_8MHz(en_8MHz), .c1(c1), .c1_limit(c1_limit)); 
    gen1MHz G1 (.clk(clk), .reset(reset),.en_8MHz(en_8MHz), .en_1MHz(en_1MHz),  .c1(c1), .c1_limit(c1_limit), .c2(c2), .c2_limit(c2_limit)); 

    // Instantiate receivers
    receiver R1 (.clk(clk), .reset(reset), .enable_condition(en_8MHz), .signal(temp));
    receiver R2 (.clk(clk), .reset(reset), .enable_condition(en_1MHz), .signal(pwm_freq));


endmodule
