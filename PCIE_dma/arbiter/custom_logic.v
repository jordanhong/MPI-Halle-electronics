module custom_logic #(  parameter   W_ADDR = 12,
                        parameter   W_DATA = 128
                    )(
                        output      [W_ADDR-1:0]    custom_rd_addr, custom_wr_addr,
                        output                      custom_wren_a, custom_rden_b, 
                        output      [W_DATA-1:0]    custom_wr_data,
                        input       [W_DATA-1:0]    custom_rd_data,
                        input                       custom_en, custom_rst,
                        input                       clk
                    );


                    wire    data_rdy;

                  // Custom read
                  custom_read  # (  .W_ADDR(W_ADDR), 
                                    .W_DATA(W_DATA) 
                                )
                                custom_logic_read 
                                (
                                    .custom_rd_data (custom_rd_data), 
                                    .custom_rd_addr (custom_rd_addr), 
                                    .custom_rden_b  (custom_rden_b),
                                    .data_rdy(data_rdy),
                                    .custom_en (custom_en), .custom_rst (custom_rst), 
                                    .clk (clk)
                                );




                  // Custom write  
                  custom_write # (  .W_ADDR(W_ADDR), 
                                    .W_DATA(W_DATA) 
                                )
                                custom_logic_write 
                                (
                                    .custom_wr_data (custom_wr_data), 
                                    .custom_wr_addr (custom_wr_addr), 
                                    .custom_wren_a  (custom_wren_a),
                                    .custom_rst (custom_rst), 
                                    .data_rdy (data_rdy),
                                    .clk (clk)
                                );

endmodule
