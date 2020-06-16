module decoder(
    input clk,
    input reset, // reset triggers the decode process using divider to get A and B from W
    input [12:0] W,
    output [6:0] A, B,
    output done
    // output reg  reset
);
    // function: 
    //      1) Detect change in W 
    //      2) If there is change in W, set load to high at rising clock edge
    //      3) output load(reset), and done(enable for PWMgen)

    wire [12:0] qA, qB;
    wire [6:0] modA, modB;
    assign modA [6:0] = 7'd80;
    assign modB [6:0] = 7'd81;
    wire doneA, doneB;


    // done is 1 when both the division operation is done for A and B
    // done is connected to the enable port for gen_PWM 
    // the counting down will only start when the division is done
    assign done = doneA && doneB;

    general_divider #(.WIDTH_A(13), .WIDTH_B(7)) dA (.clk(clk), .reset(reset),  .A(W),.B(modA),.Q(qA), .R(A), .done(doneA)); 

    general_divider #(.WIDTH_A(13), .WIDTH_B(7)) dB (.clk(clk), .reset(reset), .A(W),.B(modB),.Q(qB), .R(B), .done(doneB)); 

endmodule 
