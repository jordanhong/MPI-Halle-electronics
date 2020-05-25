`timescale 1 ns / 100 ps

module testbench();

    parameter T = 10;
    reg clk, reset, en;
    reg [3:0] limit = 10; //Initialize limit to be 10.
    wire [3:0] q_up, q_down;
    
    initial begin
        clk = 0; // initialize clk from zero
        reset = 0;// active high reset
        en = 0; // active high enable 
    
        #(T*3/2) en = 1;
        #(T*5/2) reset = 1;
        #(T*6/2) reset = 0;
        #(T*9/2) en = 0;
        #(T*10/2) en =1;
    end
    
    // configure clk
    always #(T/2) clk = ~clk;
    
    
    // instantiate module 
    
    upwardCounter C0 (clk, reset, en, limit, q_up);
    downwardCounter D0 (clk, reset, en, limit, q_down);

endmodule
