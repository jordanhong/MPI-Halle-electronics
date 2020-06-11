module rsFF (
    input S, R,
    input reset,
    output reg out
);

//    always @ (*) begin
//        if (S) out = 1;
//        if (R) out = 0;
//    end
   
    
//    always @ (posedge S) if (!R) out = 1;
//    always @ (posedge R) out = 0;

    always @(posedge S) out = 1;
    always @(posedge R) out = 0;
    always @ (reset) if (reset) out = 0;

endmodule
        
