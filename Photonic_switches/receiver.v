module receiver(
    input clk, reset,
    input enable_condition,
    output reg signal
);
    // initialize
    initial signal = 0;
    
    always @ (posedge clk) begin
        if (reset) signal <= 0;  // active high, synchronous reset
        else if (enable_condition) signal <= ~ signal; // invertes signal
    end


endmodule
