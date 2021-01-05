module fifo_wrapper #(  parameter   DATA_DEPTH, 
                        parameter   W_DATA,
                        parameter   W_COUNT
                    )(
                        output  [W_DATA-1:0]    rd_data, 
                        output  [W_COUNT-1:0]   words_used,
                        output                  fifo_is_empty, fifo_is_full, fifo_almost_full,

                        input   [W_DATA-1:0]    wr_data, 
                        input                   rd_en, wr_en,
                        input                   clk, rst
                    );

      

scfifo #(
    .add_ram_output_register   ("OFF"),
    .intended_device_family    ("Cyclone V"),
    .lpm_numwords              (DATA_DEPTH),
    .lpm_showahead             ("ON"),
    .lpm_type                  ("scfifo"),
    .lpm_width                 (W_DATA),
    .lpm_widthu                (W_COUNT),       // Width for usedw
    .overflow_checking         ("OFF"),
    .underflow_checking        ("OFF"),
    .use_eab                   ("ON"),
    .almost_full_value         (DATA_DEPTH-1)
) Sync_FIFO (
    // Inputs
    .clock          (clk),
    .sclr           (rst),
    .data           (wr_data),
    .wrreq          (wr_en),
    .rdreq          (rd_en),

    // Outputs
    .empty          (fifo_is_empty),
    .full           (fifo_is_full),
    .usedw          (words_used),                   // Show the number of words stored in the FIFO
    .q              (rd_data),
    .almost_full    (fifo_almost_full),

    // Unused
    .aclr           (),
    .almost_empty   ()
);


endmodule
