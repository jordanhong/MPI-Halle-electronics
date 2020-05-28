`timescale 1 ns / 100 ps

module testbench();
    parameter T =10;
    reg [3:0] A= 4'b1111;
    reg [3:0] B= 4'b0011;
    wire [3:0] Q_gen;
    wire [3:0] R_gen;
    //wire [3:0] Q_sim, R_sim;
    wire DONE_gen;
    //wire DONE_sim;
    reg clk;
    
    initial clk = 0;
    
    always #(T/2) clk = ~clk;
    
    general_divider #(.WIDTH_A(4), .WIDTH_B(4)) SD (clk, A, B, Q_gen, R_gen, DONE_gen);
    //simple_divider SSD (clk, A, B, Q_sim, R_sim, DONE_sim);


        

                
endmodule
