module top(
    input clk, reset, en,
    output temp, pwm_freq
    //output [4:0] c1,c2,
    //output R1_condition, R2_condition
);

    // Setup wire to hold counter results
    wire [4:0] c1, c2;

    // Setup wire to hold enable for 8counter
    wire counter8_en;

    // Setup wire to hold enable toggle conditions
    wire R1_condition, R2_condition;
    assign R1_condition = (c1==5'd24);
    assign R2_condition = (c2==5'd7) && (c1==5'd24); 
    

    // Instantiate toggle to enable 8Counter
    toggle T2 (.clk(clk), .reset(reset), .condition(R1_condition),.en(counter8_en));  

    // Instantiate two counters 25 and 8
    upwardCounter #(5) Counter25 (.clk(clk), .reset(reset), .en(en), .limit(5'd24), .Q(c1));
    upwardCounter #(5) Counter8 (.clk(clk), .reset(reset), .en(counter8_en), .limit(5'd7), .Q(c2));

    // Instantiate receivers
    receiver R1 (.clk(clk), .reset(reset), .enable_condition(R1_condition), .signal(temp));
    receiver R2 (.clk(clk), .reset(reset), .enable_condition(R2_condition), .signal(pwm_freq));


endmodule
