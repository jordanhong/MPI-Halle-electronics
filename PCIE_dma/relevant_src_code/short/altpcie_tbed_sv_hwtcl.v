// (C) 2001-2020 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

module altpcie_tbed_sv_hwtcl  # (
  parameter pll_refclk_freq_hwtcl                 = "100 MHz",
  parameter gen123_lane_rate_mode_hwtcl           = "gen1",
  parameter lane_mask_hwtcl                       = "x4",
  parameter apps_type_hwtcl                       = 1,// "1:Link training and configuration", "2:Link training, configuration and chaining DMA","3:Link training, configuration and target"
  parameter port_type_hwtcl                       = "Native endpoint",
  parameter enable_pipe32_sim_hwtcl               = 0,
  parameter enable_pipe32_phyip_ser_driver_hwtcl  = 0,
  parameter enable_tl_only_sim_hwtcl              = 0,
  parameter deemphasis_enable_hwtcl               = "false",
  parameter pld_clk_MHz                           = 125,
  parameter millisecond_cycle_count_hwtcl         = 124250,
  parameter use_crc_forwarding_hwtcl              = 0,
  parameter ecrc_check_capable_hwtcl              = 0,
  parameter ecrc_gen_capable_hwtcl                = 0,
  parameter serial_sim_hwtcl                      = 1
) (
  // Clock
  output                  refclk,
  output                  npor,
  output                  pin_perst,
     // Reset signals
  output                 simu_mode_pipe,
  output  [31 : 0]       test_in,

  //TL BFM ports
  input   [1000 : 0]    tlbfm_in,
  output  [1000 : 0]    tlbfm_out,


  // Input PIPE simulation _ext for simulation only
  input [1:0]            sim_pipe_rate,
  input [4:0]            sim_ltssmstate,
  output                 sim_pipe_pclk_in,

  output                 phystatus0,
  output                 phystatus1,
  output                 phystatus2,
  output                 phystatus3,
  output                 phystatus4,
  output                 phystatus5,
  output                 phystatus6,
  output                 phystatus7,
  output  [7 : 0]        rxdata0,
  output  [7 : 0]        rxdata1,
  output  [7 : 0]        rxdata2,
  output  [7 : 0]        rxdata3,
  output  [7 : 0]        rxdata4,
  output  [7 : 0]        rxdata5,
  output  [7 : 0]        rxdata6,
  output  [7 : 0]        rxdata7,
  output                 rxdatak0,
  output                 rxdatak1,
  output                 rxdatak2,
  output                 rxdatak3,
  output                 rxdatak4,
  output                 rxdatak5,
  output                 rxdatak6,
  output                 rxdatak7,
  output                 rxelecidle0,
  output                 rxelecidle1,
  output                 rxelecidle2,
  output                 rxelecidle3,
  output                 rxelecidle4,
  output                 rxelecidle5,
  output                 rxelecidle6,
  output                 rxelecidle7,
  output                 rxfreqlocked0,
  output                 rxfreqlocked1,
  output                 rxfreqlocked2,
  output                 rxfreqlocked3,
  output                 rxfreqlocked4,
  output                 rxfreqlocked5,
  output                 rxfreqlocked6,
  output                 rxfreqlocked7,
  output  [2 : 0]        rxstatus0,
  output  [2 : 0]        rxstatus1,
  output  [2 : 0]        rxstatus2,
  output  [2 : 0]        rxstatus3,
  output  [2 : 0]        rxstatus4,
  output  [2 : 0]        rxstatus5,
  output  [2 : 0]        rxstatus6,
  output  [2 : 0]        rxstatus7,
  output                 rxvalid0,
  output                 rxvalid1,
  output                 rxvalid2,
  output                 rxvalid3,
  output                 rxvalid4,
  output                 rxvalid5,
  output                 rxvalid6,
  output                 rxvalid7,

  // Output Pipe interface
  input [2 : 0]        eidleinfersel0,
  input [2 : 0]        eidleinfersel1,
  input [2 : 0]        eidleinfersel2,
  input [2 : 0]        eidleinfersel3,
  input [2 : 0]        eidleinfersel4,
  input [2 : 0]        eidleinfersel5,
  input [2 : 0]        eidleinfersel6,
  input [2 : 0]        eidleinfersel7,
  input [1 : 0]        powerdown0,
  input [1 : 0]        powerdown1,
  input [1 : 0]        powerdown2,
  input [1 : 0]        powerdown3,
  input [1 : 0]        powerdown4,
  input [1 : 0]        powerdown5,
  input [1 : 0]        powerdown6,
  input [1 : 0]        powerdown7,
  input                rxpolarity0,
  input                rxpolarity1,
  input                rxpolarity2,
  input                rxpolarity3,
  input                rxpolarity4,
  input                rxpolarity5,
  input                rxpolarity6,
  input                rxpolarity7,
  input                txcompl0,
  input                txcompl1,
  input                txcompl2,
  input                txcompl3,
  input                txcompl4,
  input                txcompl5,
  input                txcompl6,
  input                txcompl7,
  input [7 : 0]        txdata0,
  input [7 : 0]        txdata1,
  input [7 : 0]        txdata2,
  input [7 : 0]        txdata3,
  input [7 : 0]        txdata4,
  input [7 : 0]        txdata5,
  input [7 : 0]        txdata6,
  input [7 : 0]        txdata7,
  input                txdatak0,
  input                txdatak1,
  input                txdatak2,
  input                txdatak3,
  input                txdatak4,
  input                txdatak5,
  input                txdatak6,
  input                txdatak7,
  input                txdetectrx0,
  input                txdetectrx1,
  input                txdetectrx2,
  input                txdetectrx3,
  input                txdetectrx4,
  input                txdetectrx5,
  input                txdetectrx6,
  input                txdetectrx7,
  input                txelecidle0,
  input                txelecidle1,
  input                txelecidle2,
  input                txelecidle3,
  input                txelecidle4,
  input                txelecidle5,
  input                txelecidle6,
  input                txelecidle7,
  input [2 : 0]        txmargin0,
  input [2 : 0]        txmargin1,
  input [2 : 0]        txmargin2,
  input [2 : 0]        txmargin3,
  input [2 : 0]        txmargin4,
  input [2 : 0]        txmargin5,
  input [2 : 0]        txmargin6,
  input [2 : 0]        txmargin7,
  input                txswing0,
  input                txswing1,
  input                txswing2,
  input                txswing3,
  input                txswing4,
  input                txswing5,
  input                txswing6,
  input                txswing7,
  input                txdeemph0,
  input                txdeemph1,
  input                txdeemph2,
  input                txdeemph3,
  input                txdeemph4,
  input                txdeemph5,
  input                txdeemph6,
  input                txdeemph7,

  // serial interface
  output    rx_in0,
  output    rx_in1,
  output    rx_in2,
  output    rx_in3,
  output    rx_in4,
  output    rx_in5,
  output    rx_in6,
  output    rx_in7,

  input     tx_out0,
  input     tx_out1,
  input     tx_out2,
  input     tx_out3,
  input     tx_out4,
  input     tx_out5,
  input     tx_out6,
  input     tx_out7

  );

//G3 PIPE signals 
wire                txblkst0;
wire                txblkst1;
wire                txblkst2;
wire                txblkst3;
wire                txblkst4;
wire                txblkst5;
wire                txblkst6;
wire                txblkst7;
wire [1 : 0]        txsynchd0;
wire [1 : 0]        txsynchd1;
wire [1 : 0]        txsynchd2;
wire [1 : 0]        txsynchd3;
wire [1 : 0]        txsynchd4;
wire [1 : 0]        txsynchd5;
wire [1 : 0]        txsynchd6;
wire [1 : 0]        txsynchd7;
wire [17 : 0]       currentcoeff0;
wire [17 : 0]       currentcoeff1;
wire [17 : 0]       currentcoeff2;
wire [17 : 0]       currentcoeff3;
wire [17 : 0]       currentcoeff4;
wire [17 : 0]       currentcoeff5;
wire [17 : 0]       currentcoeff6;
wire [17 : 0]       currentcoeff7;
wire [2 : 0]        currentrxpreset0;
wire [2 : 0]        currentrxpreset1;
wire [2 : 0]        currentrxpreset2;
wire [2 : 0]        currentrxpreset3;
wire [2 : 0]        currentrxpreset4;
wire [2 : 0]        currentrxpreset5;
wire [2 : 0]        currentrxpreset6;
wire [2 : 0]        currentrxpreset7;
wire                rxdataskip0;
wire                rxdataskip1;
wire                rxdataskip2;
wire                rxdataskip3;
wire                rxdataskip4;
wire                rxdataskip5;
wire                rxdataskip6;
wire                rxdataskip7;
wire                rxblkst0;
wire                rxblkst1;
wire                rxblkst2;
wire                rxblkst3;
wire                rxblkst4;
wire                rxblkst5;
wire                rxblkst6;
wire                rxblkst7;
wire  [1 : 0]       rxsynchd0;
wire  [1 : 0]       rxsynchd1;
wire  [1 : 0]       rxsynchd2;
wire  [1 : 0]       rxsynchd3;
wire  [1 : 0]       rxsynchd4;
wire  [1 : 0]       rxsynchd5;
wire  [1 : 0]       rxsynchd6;
wire  [1 : 0]       rxsynchd7;

// Common
wire sim_pipe_clk250_out;
wire sim_pipe_clk500_out;
wire open_locked;
wire open_fbclkout;
wire [7:0] serdes_rx_serial_data;
wire [7:0] serdes_tx_serial_data;

assign pin_perst = npor;
// Clock for for pipe simulation
// sim_pipe_pclk_in
generic_pll #        ( .reference_clock_frequency(pll_refclk_freq_hwtcl), .output_clock_frequency("250.0 MHz") )
   refclk_to_250mhz      ( .refclk(refclk), .outclk(sim_pipe_clk250_out), .locked(open_locked),    .fboutclk(open_fbclkout), .rst(1'b0), .fbclk(fbclkout));

generic_pll #        ( .reference_clock_frequency(pll_refclk_freq_hwtcl), .output_clock_frequency("500.0 MHz") )
   pll_100mhz_to_500mhz      ( .refclk(refclk), .outclk(sim_pipe_clk500_out), .locked(open_locked),    .fboutclk(open_fbclkout), .rst(1'b0), .fbclk(fbclkout));

assign sim_pipe_pclk_in = (sim_pipe_rate[0] == 1'b1) ?  sim_pipe_clk500_out : sim_pipe_clk250_out;




  // RP BFM
      altpcietb_bfm_top_rp  # (
         .pll_refclk_freq_hwtcl       (pll_refclk_freq_hwtcl      ),
         .gen123_lane_rate_mode_hwtcl (gen123_lane_rate_mode_hwtcl),
         .lane_mask_hwtcl             (lane_mask_hwtcl            ),
         .apps_type_hwtcl             ((apps_type_hwtcl>100)?apps_type_hwtcl-100:apps_type_hwtcl),
         .serial_sim_hwtcl            ((enable_pipe32_phyip_ser_driver_hwtcl==1)?1:serial_sim_hwtcl)
      ) altpcietb_bfm_top_rp (
         .refclk                   (refclk                    ),
         .npor                     (npor                      ),
         .simu_mode_pipe           (simu_mode_pipe            ),
         .sim_ltssmstate           (sim_ltssmstate            ),
         .test_in                  (test_in                   ),
         .sim_pipe_rate            (sim_pipe_rate             ),
         .sim_pipe_pclk_in         (sim_pipe_pclk_in          ),
         .sim_pipe_clk250_out      (sim_pipe_clk250_out       ),
         .sim_pipe_clk500_out      (sim_pipe_clk500_out       ),
         .phystatus0               (phystatus0                ),
         .phystatus1               (phystatus1                ),
         .phystatus2               (phystatus2                ),
         .phystatus3               (phystatus3                ),
         .phystatus4               (phystatus4                ),
         .phystatus5               (phystatus5                ),
         .phystatus6               (phystatus6                ),
         .phystatus7               (phystatus7                ),
         .rxdata0                  (rxdata0                   ),
         .rxdata1                  (rxdata1                   ),
         .rxdata2                  (rxdata2                   ),
         .rxdata3                  (rxdata3                   ),
         .rxdata4                  (rxdata4                   ),
         .rxdata5                  (rxdata5                   ),
         .rxdata6                  (rxdata6                   ),
         .rxdata7                  (rxdata7                   ),
         .rxdatak0                 (rxdatak0                  ),
         .rxdatak1                 (rxdatak1                  ),
         .rxdatak2                 (rxdatak2                  ),
         .rxdatak3                 (rxdatak3                  ),
         .rxdatak4                 (rxdatak4                  ),
         .rxdatak5                 (rxdatak5                  ),
         .rxdatak6                 (rxdatak6                  ),
         .rxdatak7                 (rxdatak7                  ),
         .rxelecidle0              (rxelecidle0               ),
         .rxelecidle1              (rxelecidle1               ),
         .rxelecidle2              (rxelecidle2               ),
         .rxelecidle3              (rxelecidle3               ),
         .rxelecidle4              (rxelecidle4               ),
         .rxelecidle5              (rxelecidle5               ),
         .rxelecidle6              (rxelecidle6               ),
         .rxelecidle7              (rxelecidle7               ),
         .rxfreqlocked0            (rxfreqlocked0             ),
         .rxfreqlocked1            (rxfreqlocked1             ),
         .rxfreqlocked2            (rxfreqlocked2             ),
         .rxfreqlocked3            (rxfreqlocked3             ),
         .rxfreqlocked4            (rxfreqlocked4             ),
         .rxfreqlocked5            (rxfreqlocked5             ),
         .rxfreqlocked6            (rxfreqlocked6             ),
         .rxfreqlocked7            (rxfreqlocked7             ),
         .rxstatus0                (rxstatus0                 ),
         .rxstatus1                (rxstatus1                 ),
         .rxstatus2                (rxstatus2                 ),
         .rxstatus3                (rxstatus3                 ),
         .rxstatus4                (rxstatus4                 ),
         .rxstatus5                (rxstatus5                 ),
         .rxstatus6                (rxstatus6                 ),
         .rxstatus7                (rxstatus7                 ),
         .rxdataskip0              (rxdataskip0               ),
         .rxdataskip1              (rxdataskip1               ),
         .rxdataskip2              (rxdataskip2               ),
         .rxdataskip3              (rxdataskip3               ),
         .rxdataskip4              (rxdataskip4               ),
         .rxdataskip5              (rxdataskip5               ),
         .rxdataskip6              (rxdataskip6               ),
         .rxdataskip7              (rxdataskip7               ),
         .rxblkst0                 (rxblkst0                  ),
         .rxblkst1                 (rxblkst1                  ),
         .rxblkst2                 (rxblkst2                  ),
         .rxblkst3                 (rxblkst3                  ),
         .rxblkst4                 (rxblkst4                  ),
         .rxblkst5                 (rxblkst5                  ),
         .rxblkst6                 (rxblkst6                  ),
         .rxblkst7                 (rxblkst7                  ),
         .rxsynchd0                (rxsynchd0                 ),
         .rxsynchd1                (rxsynchd1                 ),
         .rxsynchd2                (rxsynchd2                 ),
         .rxsynchd3                (rxsynchd3                 ),
         .rxsynchd4                (rxsynchd4                 ),
         .rxsynchd5                (rxsynchd5                 ),
         .rxsynchd6                (rxsynchd6                 ),
         .rxsynchd7                (rxsynchd7                 ),
         .rxvalid0                 (rxvalid0                  ),
         .rxvalid1                 (rxvalid1                  ),
         .rxvalid2                 (rxvalid2                  ),
         .rxvalid3                 (rxvalid3                  ),
         .rxvalid4                 (rxvalid4                  ),
         .rxvalid5                 (rxvalid5                  ),
         .rxvalid6                 (rxvalid6                  ),
         .rxvalid7                 (rxvalid7                  ),
         .eidleinfersel0           (eidleinfersel0            ),
         .eidleinfersel1           (eidleinfersel1            ),
         .eidleinfersel2           (eidleinfersel2            ),
         .eidleinfersel3           (eidleinfersel3            ),
         .eidleinfersel4           (eidleinfersel4            ),
         .eidleinfersel5           (eidleinfersel5            ),
         .eidleinfersel6           (eidleinfersel6            ),
         .eidleinfersel7           (eidleinfersel7            ),
         .powerdown0               (powerdown0                ),
         .powerdown1               (powerdown1                ),
         .powerdown2               (powerdown2                ),
         .powerdown3               (powerdown3                ),
         .powerdown4               (powerdown4                ),
         .powerdown5               (powerdown5                ),
         .powerdown6               (powerdown6                ),
         .powerdown7               (powerdown7                ),
         .rxpolarity0              (rxpolarity0               ),
         .rxpolarity1              (rxpolarity1               ),
         .rxpolarity2              (rxpolarity2               ),
         .rxpolarity3              (rxpolarity3               ),
         .rxpolarity4              (rxpolarity4               ),
         .rxpolarity5              (rxpolarity5               ),
         .rxpolarity6              (rxpolarity6               ),
         .rxpolarity7              (rxpolarity7               ),
         .txcompl0                 (txcompl0                  ),
         .txcompl1                 (txcompl1                  ),
         .txcompl2                 (txcompl2                  ),
         .txcompl3                 (txcompl3                  ),
         .txcompl4                 (txcompl4                  ),
         .txcompl5                 (txcompl5                  ),
         .txcompl6                 (txcompl6                  ),
         .txcompl7                 (txcompl7                  ),
         .txdata0                  (txdata0                   ),
         .txdata1                  (txdata1                   ),
         .txdata2                  (txdata2                   ),
         .txdata3                  (txdata3                   ),
         .txdata4                  (txdata4                   ),
         .txdata5                  (txdata5                   ),
         .txdata6                  (txdata6                   ),
         .txdata7                  (txdata7                   ),
         .txdatak0                 (txdatak0                  ),
         .txdatak1                 (txdatak1                  ),
         .txdatak2                 (txdatak2                  ),
         .txdatak3                 (txdatak3                  ),
         .txdatak4                 (txdatak4                  ),
         .txdatak5                 (txdatak5                  ),
         .txdatak6                 (txdatak6                  ),
         .txdatak7                 (txdatak7                  ),
         .txdetectrx0              (txdetectrx0               ),
         .txdetectrx1              (txdetectrx1               ),
         .txdetectrx2              (txdetectrx2               ),
         .txdetectrx3              (txdetectrx3               ),
         .txdetectrx4              (txdetectrx4               ),
         .txdetectrx5              (txdetectrx5               ),
         .txdetectrx6              (txdetectrx6               ),
         .txdetectrx7              (txdetectrx7               ),
         .txelecidle0              (txelecidle0               ),
         .txelecidle1              (txelecidle1               ),
         .txelecidle2              (txelecidle2               ),
         .txelecidle3              (txelecidle3               ),
         .txelecidle4              (txelecidle4               ),
         .txelecidle5              (txelecidle5               ),
         .txelecidle6              (txelecidle6               ),
         .txelecidle7              (txelecidle7               ),
         .txmargin0                (txmargin0                 ),
         .txmargin1                (txmargin1                 ),
         .txmargin2                (txmargin2                 ),
         .txmargin3                (txmargin3                 ),
         .txmargin4                (txmargin4                 ),
         .txmargin5                (txmargin5                 ),
         .txmargin6                (txmargin6                 ),
         .txmargin7                (txmargin7                 ),
         .txswing0                 (txswing0                  ),
         .txswing1                 (txswing1                  ),
         .txswing2                 (txswing2                  ),
         .txswing3                 (txswing3                  ),
         .txswing4                 (txswing4                  ),
         .txswing5                 (txswing5                  ),
         .txswing6                 (txswing6                  ),
         .txswing7                 (txswing7                  ),
         .txdeemph0                (txdeemph0                 ),
         .txdeemph1                (txdeemph1                 ),
         .txdeemph2                (txdeemph2                 ),
         .txdeemph3                (txdeemph3                 ),
         .txdeemph4                (txdeemph4                 ),
         .txdeemph5                (txdeemph5                 ),
         .txdeemph6                (txdeemph6                 ),
         .txdeemph7                (txdeemph7                 ),
         .txblkst0                 (txblkst0                  ),
         .txblkst1                 (txblkst1                  ),
         .txblkst2                 (txblkst2                  ),
         .txblkst3                 (txblkst3                  ),
         .txblkst4                 (txblkst4                  ),
         .txblkst5                 (txblkst5                  ),
         .txblkst6                 (txblkst6                  ),
         .txblkst7                 (txblkst7                  ),
         .txsynchd0                (txsynchd0                 ),
         .txsynchd1                (txsynchd1                 ),
         .txsynchd2                (txsynchd2                 ),
         .txsynchd3                (txsynchd3                 ),
         .txsynchd4                (txsynchd4                 ),
         .txsynchd5                (txsynchd5                 ),
         .txsynchd6                (txsynchd6                 ),
         .txsynchd7                (txsynchd7                 ),
         .currentcoeff0            (currentcoeff0             ),
         .currentcoeff1            (currentcoeff1             ),
         .currentcoeff2            (currentcoeff2             ),
         .currentcoeff3            (currentcoeff3             ),
         .currentcoeff4            (currentcoeff4             ),
         .currentcoeff5            (currentcoeff5             ),
         .currentcoeff6            (currentcoeff6             ),
         .currentcoeff7            (currentcoeff7             ),
         .currentrxpreset0         (currentrxpreset0          ),
         .currentrxpreset1         (currentrxpreset1          ),
         .currentrxpreset2         (currentrxpreset2          ),
         .currentrxpreset3         (currentrxpreset3          ),
         .currentrxpreset4         (currentrxpreset4          ),
         .currentrxpreset5         (currentrxpreset5          ),
         .currentrxpreset6         (currentrxpreset6          ),
         .currentrxpreset7         (currentrxpreset7          ),

         // serial interface
         .rx_in0                   (rx_in0),
         .rx_in1                   (rx_in1),
         .rx_in2                   (rx_in2),
         .rx_in3                   (rx_in3),
         .rx_in4                   (rx_in4),
         .rx_in5                   (rx_in5),
         .rx_in6                   (rx_in6),
         .rx_in7                   (rx_in7),

         .tx_out0                  ((enable_pipe32_phyip_ser_driver_hwtcl==1)?serdes_tx_serial_data[0]:tx_out0),
         .tx_out1                  ((enable_pipe32_phyip_ser_driver_hwtcl==1)?serdes_tx_serial_data[1]:tx_out1),
         .tx_out2                  ((enable_pipe32_phyip_ser_driver_hwtcl==1)?serdes_tx_serial_data[2]:tx_out2),
         .tx_out3                  ((enable_pipe32_phyip_ser_driver_hwtcl==1)?serdes_tx_serial_data[3]:tx_out3),
         .tx_out4                  ((enable_pipe32_phyip_ser_driver_hwtcl==1)?serdes_tx_serial_data[4]:tx_out4),
         .tx_out5                  ((enable_pipe32_phyip_ser_driver_hwtcl==1)?serdes_tx_serial_data[5]:tx_out5),
         .tx_out6                  ((enable_pipe32_phyip_ser_driver_hwtcl==1)?serdes_tx_serial_data[6]:tx_out6),
         .tx_out7                  ((enable_pipe32_phyip_ser_driver_hwtcl==1)?serdes_tx_serial_data[7]:tx_out7)
         );

endmodule
