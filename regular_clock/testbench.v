`timescale 1 ns / 100 ps
module testbench();

    
    reg clk, en, reset;
    parameter T = 10;
    wire [5:0] hour, min, sec;
    wire h_en, m_en; 

    initial begin
        clk = 0;
        reset = 0;
        en = 1;
        
        #(10*T/2) en = 0;
        #(3*T/2)  en = 1;
        # (3*T/2) reset = 1;
        # (4*T/2) reset = 0;
        end
        
        
    always #(T/2) clk = ~clk;


    regular_clock C0 (clk, reset, en, hour, min, sec, h_en, m_en);
    
endmodule
