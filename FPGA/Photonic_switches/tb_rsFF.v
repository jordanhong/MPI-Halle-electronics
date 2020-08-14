`timescale 1ns /1ps
module tb_rsFF;
    parameter step = 10;

    reg R, S, reset;
    wire out;


    rsFF DUT (  .reset(reset), 
                .S(S), .R(R),
                .out(out)
            );


    initial begin
        R = 0;
        S = 0;
        reset = 0; 
        
        #(step) reset = 1;
        #(step) reset = 0;

        #(step) S = 1;
        #(step) S = 0;

        #(step) S = 1;
        #(step) R = 1;
        #(step) R = 0;
        #(step) S = 0;


        #(step) R = 1;
        #(step) S = 1;
        #(step) R = 0;
        #(step) R = 1;
        #(step) S = 0;
    end
endmodule


