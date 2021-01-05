/* Example: custom_write:
*   - Writes a piece of data when the reading is finished.
*   - Check in file (RAM.mem) : RAM[5] = 128'hffffffff50;
*/
module custom_write #(  parameter   W_ADDR = 12,
                        parameter   W_DATA = 128
                    )
                    (
                        output      [W_DATA-1:0]    custom_wr_data, 
                        output      [W_ADDR-1:0]    custom_wr_addr, 
                        output                      custom_wren_a,
                        input                       custom_rst, 
                        input                       data_rdy, 
                        input                       clk
                    );


                    parameter EXAMPLE_ADDR_5 =  12'd5;
                    reg       [W_DATA-1:0]   data5;
                    reg                      custom_wren_a_reg;



                    assign custom_wren_a = custom_wren_a_reg;

                    // --------------------------- Custom write logic : write to addr5 ---------------------------------------------------
                    assign custom_wr_data [W_DATA-1:0] = data5 [W_DATA-1:0];
                    assign custom_wr_addr [W_ADDR-1:0] = EXAMPLE_ADDR_5; 



                    always @(posedge clk) begin: custom_write
                        if (custom_rst)     custom_wren_a_reg <= 0;
                        if (data_rdy) 
                            data5[W_DATA-1:0] = 128'hffffffff50;
                            custom_wren_a_reg <= 1;
                    end
endmodule
