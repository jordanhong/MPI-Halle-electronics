module arbiter  #(  parameter   W_ADDR = 12, 
                    parameter   W_DATA = 128
                )(
                    // Interface with RAM 
                    /* Output to RAM */
                    output  [W_ADDR-1:0]    ram_rd_addr, ram_wr_addr, 
                    output  [W_DATA-1:0]    ram_wr_data,
                    output                  ram_rd_en, ram_wr_en, 
                    /* Input from RAM */
                    input   [W_DATA-1:0]    ram_rd_data, 

                    // Interface with DMA (Master system)
                    /* Output to DMA */
                    output  [W_DATA-1:0]    dma_rd_data, 
                    /* Input from DMA */
                    input   [W_ADDR-1:0]    dma_rd_addr, dma_wr_addr, 
                    input   [W_DATA-1:0]    dma_wr_data,
                    input                   dma_rd_en, dma_wr_en, 

                    // Interface with Custom logic
                    output                  custom_en,     
                    output  [W_DATA-1:0]    custom_rd_data, 
                    /* Input from Custom */
                    input   [W_ADDR-1:0]    custom_rd_addr, custom_wr_addr, 
                    input   [W_DATA-1:0]    custom_wr_data,
                    input                   custom_rd_en, custom_wr_en
                );

                //  Module receives instructions to rd/wr from/to RAM (Endpoint memory)

                //  Determines custom_en
                assign custom_en = ~ (dma_rd_en || dma_wr_en);

                // Read operations 
                assign  ram_rd_en = dma_rd_en || custom_rd_en;
                assign  ram_rd_addr = (dma_rd_en)?  (dma_rd_addr): ((custom_rd_en)?    custom_rd_addr:{W_ADDR{1'bx}});
                assign  dma_rd_data = (dma_rd_en)?  ram_rd_data:{W_DATA{1'bx}}; 
                assign  custom_rd_data = (custom_rd_en)?  ram_rd_data:{W_DATA{1'bx}}; 


              
                // Write operations
                // Input write addr and data to RAM
                assign  ram_wr_en = dma_wr_en || custom_wr_en;
                assign  ram_wr_addr = (dma_wr_en)?  (dma_wr_addr):
                                                    ((custom_wr_en)?    custom_wr_addr:{W_ADDR{1'bx}});
                assign  ram_wr_data = (dma_wr_en)?  (dma_wr_data):
                                                    ((custom_wr_en)?    custom_wr_data:{W_ADDR{1'bx}});
endmodule

               


