module upwardCounter(
    input clk,
    input reset,
    input en,
    input [3:0] limit,
    output reg [3:0] Q
);

    initial Q = 0;

    always @(posedge clk)begin
    
        if (reset || (en && (Q==limit)) ) Q<=0;
        else if (en) Q<= Q+1;

    end

endmodule
