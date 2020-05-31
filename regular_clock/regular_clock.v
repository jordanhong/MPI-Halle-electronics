module regular_clock (
    input clk, reset, en,
    output  [5:0] hh, mm, ss,
    output  reg hh_en, mm_en);

    initial begin
        mm_en = 0;
        hh_en = 0;
        end
    
    always @(*) begin
        // once the counter reaches the limit, immediately updates the toggle.
        // this toggle once enables, will take effect the next clock cycle;

        if (ss == 59) mm_en = 1;
        if (mm ==59 && ss==59) hh_en = 1;
    end
    
    always @(posedge clk)begin
        
        // at clock edge, if the toggles are on, turn them off
        if (mm_en) mm_en <= 0;
        if (hh_en) hh_en<= 0;
        end
     
    upwardCounter #(6) SS (clk, reset, en, 6'd59, ss);
    upwardCounter #(6) MM (clk, reset, en&mm_en, 6'd59, mm);
    upwardCounter #(6) HH (clk, reset, en&hh_en, 6'd23, hh);
    
    


endmodule
        
        
        


