module top(
    input clk, reset, en,
    output temp, pwm_freq,
    output [4:0] c1,c2
);

    // Setup wire to hold counter results
    // ================== Debug changes =====================
    // let's try outputting this
    // wire [4:0] c1, c2;

    // Setup wire to hold enable for 8counter
    wire counter8_en;

    // Setup wire to hold enable toggle conditions
    wire R1_condition, R2_condition;
    assign R1_condition = (c1==5'd24);
    assign R2_condition = (c2==5'd7); 
    

    // Instantiate toggle to enable 8Counter
    toggle T2 (clk, reset, R1_condition,counter8_en);  

    // Instantiate two counters 25 and 8
    upwardCounter #(5) Counter25 (clk, reset, en, 5'd24, c1);
    upwardCounter #(5) Counter8 (clk, reset, counter8_en, 5'd7, c2);

    // Instantiate receivers
    receiver R1 (clk, reset, R1_condition, temp);
    receiver R2 (clk, reset, R2_condition, pwm_freq);


endmodule
