module top(
    input clk, reset, load, en, //system wide clk, reset, en, load(load counter values for 8MHz and 1 MHz)
    input clkA, clkB, // clock A (80 MHz) and clock B (81 MHz)
    input [12:0] W, // Input pulse width vector
    output PWMreset, PWMset, signal, signal_b, //output signal for PWM (set, reset, signal, signal_b (for debugging, to be removed))
    output [6:0] cA, cB, // counter values for counter A and counter B 

    output [4:0] c1,c2, // counter values for enable at 8MHz and 1MHz (to be removed)
    output en_8MHz, en_1MHz, //enable toggle at 8MHz and 1MHz
    output [6:0] A_val, B_val, // Decoded A value and B value
    output decoderDone // signal when decoder is done
);



    // Generate enable signals at 8 MHz and 1 MHz
    gen8MHz G8 (.clk(clk),.load(load), .en(en), .en_8MHz(en_8MHz), .c1(c1)); 
    gen1MHz G1 (.clk(clk),.load(load), .en(en), .en_8MHz(en_8MHz), .en_1MHz(en_1MHz),  .c1(c1), .c2(c2)); 

    // Decode W to A and B
    decoder D0 (.clk(clk), .reset(reset), .W(W), .A(A_val), .B(B_val), .done(decoderDone));
      
    // Generate PWM based on A and B values
    gen_PWM P0 (.en(en & decoderDone),
                .clkZ(en_1MHz), .clkA(clkA), .clkB(clkB), .clkCore(clk),
                .A_val(A_val), .B_val(B_val), .PWMset(PWMset), .PWMreset(PWMreset), .signal(signal), .signal_b(signal_b), 
                .reset(reset),
                .cA(cA), .cB(cB)
                );


         


endmodule
