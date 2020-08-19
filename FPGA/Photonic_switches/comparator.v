module comparator (
    input counter_clk,
    input [6:0] in_x, in_y,
    input en,
    input reset, //default to zero
    output comp
);

    // reg to store delayed signal (value from last clock cycle)
    reg in_x_d;
    wire x_stable, y_eq_x;

    assign x_stable = (in_x_d==in_x);
    assign y_eq_x   = (in_x==in_y);
    assign comp = (en && (y_eq_x) && !(x_stable));

    always @(posedge counter_clk)begin
        in_x_d <= in_x;
    end

endmodule
