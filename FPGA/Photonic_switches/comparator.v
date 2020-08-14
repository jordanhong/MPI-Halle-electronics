module comparator (
    input counter_clk,
    input [6:0] in_x, in_y,
    input en,
    input reset, //default to zero
    output comp
);

    // reg to store delayed signal (value from last clock cycle)
    reg in_x_d;


    
    // If in_x and in_y is equal, pull comp high
    //always @(*)begin 
    //    if (reset) comp = 0;      
    //    // check if the input x changed in this clock cycle
    //    // If input x was stable at 0, we have the counters waiting at 0
    //    else if (en && (in_x == in_y) && !(in_x_d==in_x) ) comp = 1;
    //end

  
    wire x_stable, y_eq_x;

    assign x_stable = (in_x_d==in_x);
    assign y_eq_x   = (in_x==in_y);

    assign comp = (en && (y_eq_x) && !(x_stable));
    // At each counter clock rising edge
    // Pull down comp if comp was high
    // Update the delayed in_x signal
    always @(posedge counter_clk)begin
        // if (comp) comp <=0;
        in_x_d <= in_x;
    end

endmodule
