module downwardCounter #( parameter WIDTH = 1)
                    (
                        input clk,
                        input reset,
                        input en,
                        input [WIDTH-1 :0] limit,
                        output reg [WIDTH-1 :0] Q
                    );


    //assign Q = limit;

    always @(posedge clk)begin
        
        if (reset || (en && (Q==0)) ) Q<= limit;
        else if (en) Q <= Q-1;
    end

endmodule
