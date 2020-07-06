module downwardCounter #( parameter WIDTH = 1)
                    (
                        input clk,
                        input load,
                        input reset, // pass in 0
                        input en,
                        input [WIDTH-1 :0] limit,
                        output reg [WIDTH-1 :0] Q
                    );


    always @(*) begin
        // If load signal is high, load in counter start value
        if (load) Q = limit;
        else if (reset) Q = 0;
    end

    always @(posedge clk)begin
        // we only want load in limit (load) when the decoder is done
        // gating load with enable prevents counter from loading not ready
        // values from the register Q 

        // if (en & load) Q<= limit;
        if (en&& !load) begin
            if (Q!=0) Q <= Q-1;
        end
    end

endmodule
