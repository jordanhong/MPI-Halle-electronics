/* Example custom_read:
*   - instantiates FIFO 
*   - reads concacenated data from RAM, split into 2-byte data (pulse widths)
*   - reads into FIFO
*/


/* Can check memory file: custom_logic_FIFO.mem (I saved the memory file from
* Modelsim here)
*   - should have memory contents (2-byte pulse-widths) from address 0 (data
*   0000) to address f (data 194f)
*/

 module custom_read #(  parameter   W_ADDR = 12,
                        parameter   W_DATA = 128
                    )(
                        output      [W_ADDR-1:0]    custom_rd_addr,
                        output                      custom_rden_b, 
                        output      reg             data_rdy,
                        input       [W_DATA-1:0]    custom_rd_data,
                        input                       custom_en, custom_rst,
                        input                       clk
                    );

                    parameter EXAMPLE_ADDR_0 =  12'd0;
                    parameter EXAMPLE_ADDR_1 =  12'd1;
                    parameter EXAMPLE_ADDR_2 =  12'd2;
                    parameter EXAMPLE_ADDR_3 =  12'd3;
                    parameter EXAMPLE_ADDR_4 =  12'd4;
 
                    reg    [2:0]    index;                           // selector index for RAM addr
                    reg    [2:0]    index_d_intermediate, index_d;   // selector index for RAM data (delayed since reading takes a clock cycle) 
                    reg             custom_rden_b_reg;      

                    wire    [W_ADDR-1:0]    addr0, addr1, addr2, addr3, addr4, addr5;
                    reg     [W_DATA-1:0]    data0, data1, data2, data3, data4, data5;
                    reg     [W_ADDR-1:0]    custom_rd_addr_reg;
                    reg     [255:0]  bank;

                   
                    // Assign output rd/wr enable
                    assign custom_rden_b = custom_rden_b_reg;

                    // Assign example addr in RAM
                    assign addr0 [W_ADDR-1:0] = EXAMPLE_ADDR_0;
                    assign addr1 [W_ADDR-1:0] = EXAMPLE_ADDR_1;
                    assign addr2 [W_ADDR-1:0] = EXAMPLE_ADDR_2;
                    assign addr3 [W_ADDR-1:0] = EXAMPLE_ADDR_3;
                    assign addr4 [W_ADDR-1:0] = EXAMPLE_ADDR_4;

                    // --------------------------- Custom read logic ---------------------------------------------------

                    // MUX: Assign RD address based on index selector 
                    assign custom_rd_addr = custom_rd_addr_reg;
                    always @(*) begin: Mux
                        // Assign default
                        custom_rd_addr_reg [W_ADDR-1:0] = {W_ADDR{1'bx}}; // default
                        case(index)
                            (3'd0):    if (custom_rden_b)  custom_rd_addr_reg [W_ADDR-1:0] = addr0[W_DATA-1:0];
                            (3'd1):    if (custom_rden_b)  custom_rd_addr_reg [W_ADDR-1:0] = addr1[W_DATA-1:0];
                            (3'd2):    if (custom_rden_b)  custom_rd_addr_reg [W_ADDR-1:0] = addr2[W_DATA-1:0];
                            (3'd3):    if (custom_rden_b)  custom_rd_addr_reg [W_ADDR-1:0] = addr3[W_DATA-1:0];
                            (3'd4):    if (custom_rden_b)  custom_rd_addr_reg [W_ADDR-1:0] = addr4[W_DATA-1:0];
                        endcase
                    end

                 
                    // DeMUX: Assign read in data 
                    always @(*) begin: DeMux
                        // Assign default
                        data0 [W_DATA-1:0] = data0[W_DATA-1:0];
                        data1 [W_DATA-1:0] = data1[W_DATA-1:0];
                        data2 [W_DATA-1:0] = data2[W_DATA-1:0];
                        data3 [W_DATA-1:0] = data3[W_DATA-1:0];
                        data_rdy = data_rdy;
                        bank = bank;
                        case(index_d)
                            (3'd0):    if (custom_rden_b)  data0[W_DATA-1:0] = custom_rd_data[W_DATA-1:0];
                            (3'd1):    if (custom_rden_b)  data1[W_DATA-1:0] = custom_rd_data[W_DATA-1:0];
                            (3'd2):    if (custom_rden_b)  data2[W_DATA-1:0] = custom_rd_data[W_DATA-1:0];
                            (3'd3):    if (custom_rden_b)  data3[W_DATA-1:0] = custom_rd_data[W_DATA-1:0];
                            (3'd4):    if (custom_rden_b)  begin 
                                            data4[W_DATA-1:0] = custom_rd_data[W_DATA-1:0];
                                            data_rdy = 1;
                                            bank [255:0] = { {data1[63:0]}, {data2[63:0]}, {data3[63:0]}, {data4[63:0]} };
                                        end
                        endcase
                    end


                    // addr selector index counter
                    always @(posedge clk) begin: index_addr_selector
                        if (custom_rst)begin
                            index <= 0;
                            custom_rden_b_reg <= 1;
                        end 
                        else if (custom_en) index <= index + 1;
                    end


                    // Data selector index for data
                    // Note: Need index_d_intermediate because q_b (read out
                    // from RAM) is registered, hence it takes 2 cycles to
                    // read.
                    always @(posedge clk) begin: index_data_selector
                        if (custom_rst)     index_d <= 3'bxxx;
                        else if (custom_rden_b) begin
                            index_d_intermediate <= index;
                            index_d <= index_d_intermediate;
                            if (index_d==3'b100) begin
                                // Turn off custom read after last was read
                                custom_rden_b_reg <= 0;
                            end

                        end
                    end
    

                    // --------------------------- Custom logic : data processing ---------------------------------------------------
                    // Accumulate data
                    // Instantiate fifo to store widths
                    reg            rd_en, wr_en;
                    wire  [15:0]    rd_data;
                    wire  [4:0]    words_used;
                    wire           fifo_is_empty, fifo_is_full, fifo_almost_full;
                    
                    // Input (reg)
                    reg   [15:0]   wr_data;
                 
                    fifo_wrapper #( 
                                    .DATA_DEPTH (16), 
                                    .W_DATA     (16),
                                    .W_COUNT    (5)

                                ) FIFO (
                                    // Output
                                    .rd_data        (rd_data), 
                                    .words_used     (words_used),
                                    .fifo_is_empty  (fifo_is_empty), 
                                    .fifo_is_full   (fifo_is_full), 
                                    .fifo_almost_full(fifo_almost_full),

                                    // Input
                                    .wr_data        (wr_data), 
                                    .rd_en          (rd_en), 
                                    .wr_en          (wr_en), 
                                    .clk            (clk), 
                                    .rst            (custom_rst)
                                );


                    // 
                    reg     [4:0] cnt;
                    // Write data into fifo
                    always @(posedge clk) begin: custom_data_processing
                        if (custom_rst) begin
                            wr_en <= 0;
                            rd_en <= 0;
                            cnt   <= 0;
                            data_rdy <= 0;
                        end
                        else begin
                            if (wr_en) begin
                                cnt     <= cnt+1;
                                bank    <= bank << 16;
                                wr_data <= bank [255:240];
                            end
                            else if (data_rdy && cnt <15) begin
                                // Have to prepare wr_data now 
                                // first value gets pushed in at next clock edge
                                wr_en <= 1;
                                bank    <= bank << 16;
                                wr_data <= bank [255:240];
                            end

                            if (cnt==15) begin
                                wr_en <= 0;
                                rd_en <= 1;
                            end
                        end
                    end

                


endmodule
