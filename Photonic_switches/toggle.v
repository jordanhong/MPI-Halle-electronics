module toggle (
    input clk, reset, condition,
    output reg en
);
    initial en = 0; // by default enable is at low
    always @ (*) if (condition) en = 1;
    always @ (posedge clk) begin
        //reset toggle the cycle after or at synchronous reset

        if (reset || en) en<= 0; 
    end

endmodule
