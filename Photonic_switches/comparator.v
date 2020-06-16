module comparator (
    input counter_clk,
    input [6:0] in_x, in_y,
    input en,
    input reset,
    output reg comp
);

    // reg to store delayed signal (value from last clock cycle)
    reg in_x_d;

    always @(*)begin 
        // need asynchrnous update here; otherwise the signal will delay by
        // a clock cycle (simultaneously updated)
        if (reset) comp = 0;

        // check if the input x changed in this clock cycle
        else if (en && (in_x == in_y) && !(in_x_d==in_x) ) comp = 1;
    end
   
    always @(posedge counter_clk)begin
        if (comp) comp <=0;
        in_x_d <= in_x;
    end

endmodule
