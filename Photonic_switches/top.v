module top(
    input clk, reset, en,
    input clkA, clkB,
    input [12:0] W,
    input PWMreset, PWMset, signal,
    input [6:0] cA, cB,

    output [4:0] c1,c2, output en_8MHz, en_1MHz,
    output [6:0] A_val, B_val,
    output En
);



    // Generate toggle enables for 8MHz and 1MHz
    wire [4:0] c1_limit, c2_limit;

    gen8MHz G8 (.clk(clk), .reset(reset), .en(en), .en_8MHz(en_8MHz), .c1(c1), .c1_limit(c1_limit)); 
    gen1MHz G1 (.clk(clk), .reset(reset), .en(en), .en_8MHz(en_8MHz), .en_1MHz(en_1MHz),  .c1(c1), .c1_limit(c1_limit), .c2(c2), .c2_limit(c2_limit)); 


    // Core functions 
    

    // Decode W to A and B
    decoder D0 (.clk(clk), .W(W), .A(A_val), .B(B_val), .done(En));
      
    // Generate PWM based on A and B values
    gen_PWM P0 (.en(en && En),
                .clkZ(en_1MHz), .clkA(clkA), .clkB(clkB), .clkCore(clk),
                .A_val(A_val), .B_val(B_val), .PWMset(PWMset), .PWMreset(PWMreset), .signal(signal), 
                .reset(reset),
                .cA(cA), .cB(cB)
                );


         


endmodule
