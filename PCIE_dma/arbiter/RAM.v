module RAM_wrapper  #(  parameter   W_ADDR = 12,
                        parameter   W_DATA = 64
                    )( 
                        output  [W_DATA-1:0] q_b, 
                        input   [W_ADDR-1:0] address_a, address_b, 
                        input   [W_DATA-1:0] data_a,
                        input                wren_a, rden_b,
                        input                clk_in

                    );

                /* parameters*/
                parameter   INTENDED_DEVICE_FAMILY = "Cyclone V";
                parameter   AVALON_WADDR = W_ADDR;
                parameter   AVALON_WDATA = W_DATA;

                localparam NUMWORDS_AVALON_WADDR = 1<<AVALON_WADDR;
                localparam AVALON_BYTE_WIDTH = AVALON_WDATA/8;  // for epmem byte enables
                

                /* Port declarations */
                wire    [AVALON_BYTE_WIDTH-1:0] byteena_a, byteena_b;

                /* Wire assignments */
                assign byteena_b =  {AVALON_BYTE_WIDTH{1'b0}};
                assign byteena_a =  {AVALON_BYTE_WIDTH{1'b1}};

                // Instantiate Memory (RAM)
                altsyncram # (
                                .address_reg_b                      ("CLOCK0"          ),
                                .indata_reg_b                       ("CLOCK0"          ),
                                .wrcontrol_wraddress_reg_b          ("CLOCK0"          ),
                                .intended_device_family             (INTENDED_DEVICE_FAMILY),
                                .lpm_type                           ("altsyncram"      ),   
                                .numwords_a                         (NUMWORDS_AVALON_WADDR),
                                .numwords_b                         (NUMWORDS_AVALON_WADDR),
                                .operation_mode                     ("BIDIR_DUAL_PORT" ),
                                .outdata_aclr_a                     ("NONE"            ),
                                .outdata_aclr_b                     ("NONE"            ),
                                .outdata_reg_a                      ("CLOCK0"          ),
                                .outdata_reg_b                      ("CLOCK0"          ),
                                .power_up_uninitialized             ("FALSE"           ),
                                .read_during_write_mode_mixed_ports ("DONT_CARE"        ),
                                .widthad_a                          (AVALON_WADDR      ),   
                                .widthad_b                          (AVALON_WADDR      ),   
                                .width_a                            (AVALON_WDATA      ),   
                                .width_b                            (AVALON_WDATA      ),   
                                .width_byteena_a                    (AVALON_BYTE_WIDTH ),
                                .width_byteena_b                    (AVALON_BYTE_WIDTH ),
                                .byteena_reg_b                      ("CLOCK0")
                                ) ep_dpram (
                                .clock0          (clk_in),
                                .wren_a          (wren_a   ),   
                                .address_a       (address_a),
                                .rden_b          (rden_b   ),   
                                .data_a          (data_a   ),   
                                .address_b       (address_b),
                                .q_b             (q_b      ),   
                                .aclr0           (1'b0),
                                .aclr1           (1'b0),
                                .addressstall_a  (1'b0),
                                .addressstall_b  (1'b0),
                                .byteena_a       (byteena_a),
                                .byteena_b       (byteena_b),
                                .clock1          (1'b1),
                                .clocken0        (1'b1),
                                .clocken1        (1'b1),
                                .data_b          (),
                                .q_a             (),
                                .wren_b          (1'b0)
                                );
 
endmodule
