`timescale 1 ns / 100 ps

module testbench();
    parameter T =10;
    parameter wA=8;
    parameter wB=4;
    reg [(wA-1):0] A = 8'h8c;
    reg [(wB-1):0] B = 4'b1001;
    wire [(wA-1):0] Q_gen;
    wire [(wB-1):0] R_gen;
    //wire [3:0] Q_sim, R_sim;
    wire DONE_gen;
    //wire DONE_sim;
    reg clk;
    reg reset;
    wire [(2*wA-1):0] RA; 


    initial begin
        //A= 8'h8c;     
        //B= 4'b1001;
        {reset, clk} = 2'b00;

        #(21*T/2) begin
            A= 8'h8d;     
            // B= 4'b1001;
            reset = 1;
        end
       #(T/2) reset = 0;
    end 
     
    always #(T/2) clk = ~clk;
    
    general_divider #(.WIDTH_A(wA), .WIDTH_B(wB)) SD (.clk(clk),.reset(reset), 
                                                      .A(A), .B(B),
                                                      .Q(Q_gen), .R(R_gen), 
                                                      .done(DONE_gen), .ra(RA)
                                                  );
    //simple_divider SSD (clk, A, B, Q_sim, R_sim, DONE_sim);


        

                
endmodule
