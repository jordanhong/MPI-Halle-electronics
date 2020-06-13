module comparator (
    input counter_clk,
    input [6:0] in_x, in_y,
    input reset,
    output reg comp
);

    // Intialize
    // initial comp = 0;
    
    always @(*)begin 
        // cannot use sync (clk) here, since that would trigger it every clock
        // at reset or high last cycle, toggle to low
        if (reset ) comp = 0;
        else if (in_x == in_y) comp = 1;
    end
   
    always @(posedge counter_clk) if (comp) comp <=0;

endmodule
