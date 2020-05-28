// Simple 4 bit divider 
module simple_divider (
    input clk, 
    input [3:0] A,Q,
    output [3:0] B, R,
    output reg done
    );

    // Declare storing reg for R-A concat
    reg [7:0] ra;
    reg [3:0] c;
        

    initial begin
        ra = {4'b0000, A};
        c=0;
        done = 0;
        end
        
        
    assign Q = ra[3:0];
    assign R = ra[7:4];
        
    always @ (posedge clk) begin
      
            if (c<4) begin
                c<=c+1;
                // if (R>=B), then R = R-b, and store q into the lower end of ra;
                if ( ra[6:3] >= B)  ra <= ( (ra<<1) - {B, 4'b0000}) | (8'h01);
                else ra <= (ra<<1) | (8'h00); // the or operation is redundant, just in case
            end
            
            else done <= 1;
        end



        
        
        
    
    endmodule



