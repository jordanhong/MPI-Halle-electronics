module toggle (
    input clk,condition,
    output reg en
);
    always @ (*) if (condition) en = 1;
    always @ (posedge clk) begin
        //reset toggle the cycle after or at synchronous reset

        if (en) en<= 0; 
    end

endmodule
