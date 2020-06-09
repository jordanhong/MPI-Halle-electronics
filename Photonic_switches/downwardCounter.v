module downwardCounter #( parameter WIDTH = 1)
                    (
                        input clk,
                        input reset,
                        input en,
                        input [WIDTH-1 :0] limit,
                        output reg [WIDTH-1 :0] Q
                    );



    always @(posedge clk, posedge reset)begin
        // remove rollover      
        if (reset) Q<= limit;
        else if (clk&en) begin
            if (Q!=0) Q <= Q-1;
        end
    end

endmodule
