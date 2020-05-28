`timescale 1 ns / 100 ps
module testbench2();

    wire [7:0] a,b; 
    reg [12:0] w=0;
    integer i=0;

    decoder DA (i, a, b);

    initial begin
        for (i=0; i< 6480; i=i+1) begin
            w <= w+1;
            //delay
            end
    end

endmodule 
