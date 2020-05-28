// Simple WIDTH_A bit divider 
module general_divider #(
                        parameter WIDTH_A=4,
                        parameter WIDTH_B=4
                    ) (
                        input clk, 
                        input [(WIDTH_A-1):0] A,
                        input [(WIDTH_B-1):0] B,
                        output [(WIDTH_B-1):0] Q, 
                        output [(WIDTH_A-1):0] R,
                        output reg done
    );


    // Declare Parameters
    //parameter WIDTH_A = 4;
    //parameter WIDTH_B = 4;
    parameter n = WIDTH_A + WIDTH_B;

    // Declare storing reg for R-A concat
    reg [(n-1):0] ra;
    reg [(WIDTH_A-1):0] c;
        

    initial begin
        ra = {{WIDTH_B{1'b0}}, A};
        c=0;
        done = 0;
        end
        
        
    assign Q = ra[(WIDTH_A-1):0];
    assign R = ra[(n-1):WIDTH_A];
        
    always @ (posedge clk) begin
      
            if (c<WIDTH_A) begin
                c<=c+1;
                // if (R>=B), then R = R-b, and store q into the lower end of ra;
                if ( ra[ (n-2):(WIDTH_A-1)] >= B)  ra <= ( (ra<<1) - {B, {WIDTH_A{1'b0}}}) | ( { {(n-1){1'b0}}, 1'b1} );
                else ra <= (ra<<1) | ({n{1'b0}}); // the or operation is redundant, just in case
            end
            
            else done <= 1;
        end



        
        
        
    
    endmodule



