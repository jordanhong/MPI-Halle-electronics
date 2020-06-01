module comparator (
    input [3:0] in_x, in_y,
    output reg comp
);

    always @(*) begin
        if (in_x == in_y) comp = 1;
        else comp = 0;
    end
endmodule
