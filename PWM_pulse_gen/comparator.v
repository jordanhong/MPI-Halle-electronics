module comparator (
    input counter_clk,
    input core_clk,
    input [3:0] in_x, in_y,
    input en,
    output reg comp
);


    always @(*) begin
//        if (en) begin
            if (in_x == in_y) comp <= 1;
            else comp <= 0;
//         end
    end
    
    always @ (negedge core_clk) begin
        // Making sets and resets only high for one core cycle
        if (comp) comp<=0; // if comp is high last cycle, toggle to low
    end

endmodule
