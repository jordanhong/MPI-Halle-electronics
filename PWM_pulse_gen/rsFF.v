module rsFF (
    input S, R,
    output reg out
);

    always @ (*) begin
        if (S) out = 1;
        if (R) out = 0;
    end

endmodule
        
