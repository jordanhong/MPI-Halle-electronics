module comparator (
    input clk,
    input [3:0] in_x, in_y,
    output reg comp
);


    always @(posedge clk) begin
        // Making sets and resets only high for one core cycle
        if (comp) comp<=0; // if comp is high last cycle, toggle to low
        
        else if (in_x == in_y) comp <= 1;
        else comp <= 0;
    end
endmodule
