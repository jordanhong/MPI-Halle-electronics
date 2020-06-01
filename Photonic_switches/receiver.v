module receiver(
    input clk, reset,
    input enable_condition,
    output reg signal
);
    // initialize
    initial signal = 0;
    // Instantiate wire to hold enable
    wire en;

// module receives core clock and reset
// Also receives a "condition" - which toggles the enable this receiver module operates at 
// outputs signal that reverses itself from last clock cycle


    toggle T1 (clk, reset, enable_condition, en);
    
    always @ (posedge clk) begin
        if (reset) signal <= 0;  // active high, synchronous reset
        else if (en) signal <= ~ signal; // invertes signal
    end


endmodule
