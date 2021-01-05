`timescale 1ns/1ps
module tb_arbiter;
    parameter step = 10;
    parameter   w_addr = 12;
    parameter   w_data = 128;

    wire  [w_addr-1:0]    ram_rd_addr, ram_wr_addr; 
    wire  [w_data-1:0]    ram_wr_data;
    wire                  ram_rd_en, ram_wr_en; 
    /* Input from RAM */
    wire   [w_data-1:0]    ram_rd_data; 

    // Interface with DMA (Master system)
    /* OutpUT TO DMA */
    wire  [w_data-1:0]    dma_rd_data; 
    /* Input from DMA */
    reg   [w_addr-1:0]    dma_rd_addr, dma_wr_addr; 
    reg   [w_data-1:0]    dma_wr_data;
    reg                   dma_rd_en, dma_wr_en;

    // Interface with Custom logic
    wire                  custom_en;
    wire  [w_data-1:0]    custom_rd_data;
    /* Input from Custom */
    wire  [w_addr-1:0]    custom_rd_addr, custom_wr_addr;
    wire  [w_data-1:0]    custom_wr_data;
    wire                  custom_rd_en, custom_wr_en;

  
    reg rst,clk_in;

    initial begin
        rst = 1;
        clk_in = 0;
        dma_wr_en = 1;
        dma_rd_en = 0;

        // Write data (pulse widths) into dma
        #(2*step) rst = 0;
        #(2*step) {dma_wr_addr, dma_wr_data} = {12'd0, 128'h0000_0000_0000_0010};
        #(2*step) {dma_wr_addr, dma_wr_data} = {12'd1, 128'h0000_0064_012c_03e8};
        #(2*step) {dma_wr_addr, dma_wr_data} = {12'd2, 128'h05dc_07d0_09c4_0bb8};
        #(2*step) {dma_wr_addr, dma_wr_data} = {12'd3, 128'h0dac_0fa0_1194_1388};
        #(2*step) {dma_wr_addr, dma_wr_data} = {12'd4, 128'h157c_1770_189c_194f};

        #(2*step) dma_wr_en = 0;
    end

    always #(step) clk_in = ~clk_in;


            
    RAM_wrapper     #(  .W_ADDR(w_addr), 
                        .W_DATA(w_data)
                     ) 
                    dut_RAM 
                    (  
                        .q_b(ram_rd_data), 
                        .address_a(ram_wr_addr), 
                        .address_b(ram_rd_addr), 
                        .data_a (ram_wr_data), 
                        .wren_a(ram_wr_en), 
                        .rden_b(ram_rd_en),
                        .clk_in(clk_in)
                        );

    custom_logic    #(  .W_ADDR(w_addr), 
                        .W_DATA(w_data)
                     ) 
                     dut_logic
                     (
                         .custom_rd_addr(custom_rd_addr), 
                         .custom_wr_addr(custom_wr_addr),
                         .custom_wren_a(custom_wr_en), 
                         .custom_rden_b(custom_rd_en), 
                         .custom_wr_data(custom_wr_data),
                         .custom_rd_data(custom_rd_data), 
                         .custom_en(custom_en), 
                         .custom_rst(rst),
                         .clk(clk_in)
                     );




     arbiter #(  .W_ADDR(w_addr), 
                 .W_DATA(w_data)
             )
             dut_arbiter (
                 .ram_rd_addr(ram_rd_addr), .ram_wr_addr(ram_wr_addr), 
                 .ram_wr_data(ram_wr_data),
                 .ram_rd_en(ram_rd_en), .ram_wr_en(ram_wr_en), 
                                                  
                 .ram_rd_data(ram_rd_data), 
                                                  
                                                  
                 .dma_rd_data(dma_rd_data), 
                                                  
                 .dma_rd_addr(dma_rd_addr), .dma_wr_addr(dma_wr_addr), 
                 .dma_wr_data(dma_wr_data),
                 .dma_rd_en(dma_rd_en), .dma_wr_en(dma_wr_en), 
 
                 .custom_en(custom_en),
                 .custom_rd_data(custom_rd_data),
                 .custom_rd_addr(custom_rd_addr), .custom_wr_addr(custom_wr_addr),
                 .custom_wr_data(custom_wr_data), 
                 .custom_rd_en(custom_rd_en), .custom_wr_en(custom_wr_en)
 
             );

endmodule
