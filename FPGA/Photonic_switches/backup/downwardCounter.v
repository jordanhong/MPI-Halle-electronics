module downwardCounter #( parameter WIDTH = 1)
                    (
                        input clk,
                        input load,
                        input reset, // force to 0 
                        input en,
                        input [WIDTH-1 :0] limit,
                        output reg [WIDTH-1 :0] Q
                    );


    always @(reset) if (reset && !load) Q=0; 
    always @(posedge clk)begin
        // we only want load in limit (load) when the decoder is done
        // gating load with enable prevents counter from loading not ready
        // values from the register Q 
        if (en & load) Q<= limit;
        else if (clk&en) begin
            if (Q!=0) Q <= Q-1;
        end
    end

endmodule
