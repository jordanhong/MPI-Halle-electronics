module upwardCounter #( parameter WIDTH = 1)
                    (
                        input clk, 
                        input reset,
                        input en,
                        input [WIDTH-1 :0] limit,
                        output reg [WIDTH-1 :0] Q
                    );

    initial Q = 0;
        
//    always @(*) begin
//        // once the counter reaches the limit, immediately updates the toggle.
//        // this toggle once enables, will take effect the next clock cycle;
//        // see (***)
//        if (Q==limit) toggle <= 1;
//        end
        
        
    always @(posedge clk)begin
//        if (toggle) toggle <= 0; //turn off fram last cycle
    
        if (reset) begin
//            toggle <= 0;
            Q <= 0;
            end
            
        else if (en) begin
            if (Q==limit) begin
                    Q <= 0;
                    //***
                    // If we has put the statement here, then the toggle will update the cycle after Q==limit
                    // and the module which the toggle enables will take effect the cycle after
                    end
            else Q <= Q + 1;
            
            end
    end

endmodule
