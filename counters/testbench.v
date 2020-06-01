`timescale 1 ns / 100 ps

module testbench();

//    parameter T = 10;
//    reg clk, reset, en;
//    reg [3:0] limit = 10; //Initialize limit to be 10.
//    wire [3:0] q_up, q_down;

//    initial begin
//        clk = 0; // initialize clk from zero
//        reset = 0;// active high reset
//        en = 0; // active high enable 

//        #(T*3/2) en = 1;
//        #(T*5/2) reset = 1;
//        #(T*6/2) reset = 0;
//        #(T*9/2) en = 0;
//        #(T*10/2) en =1;
//    end

//    // configure clk
//    always #(T/2) clk = ~clk;


//    // instantiate module 

//    upwardCounter#(4) C0 (.clk (clk), .reset(reset), .en(en), .limit(limit), .Q(q_up));
//    downwardCounter#(4) D0 (.clk (clk), .reset(reset), .en(en), .limit(limit), .Q(q_down));




    reg [3:0] A= 4'b1110;
    reg [3:0] B= 4'b1001;
    wire [3:0] Q, R;
    
    
    simple_divider ( A, B, Q, R);


        

                
endmodule