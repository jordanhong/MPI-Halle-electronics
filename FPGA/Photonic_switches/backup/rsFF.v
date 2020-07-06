module rsFF (
    input reset, //asynchronous reset
    input S, R,
    output  out,
    output out_b
);
    // Normally having both S and R is illegal, since simultaneous falling
    // will trigger racing effect (metastable)
    // However, here S and R signals 


   // wire out_b; 
   rsLatch r0 (.en(1'b1),.reset(1'b0), .S(S), .R(R||reset), .Q(out), .Qb(out_b) );

endmodule
        
