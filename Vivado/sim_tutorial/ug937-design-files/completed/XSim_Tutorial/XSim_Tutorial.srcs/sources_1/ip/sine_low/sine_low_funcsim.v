// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.1 (lin64) Build 869706 Tue Mar 18 19:15:21 MDT 2014
// Date        : Wed Mar 19 22:19:51 2014
// Host        : xhdl3064 running 64-bit Red Hat Enterprise Linux Workstation release 6.4 (Santiago)
// Command     : write_verilog -force -mode funcsim
//               /proj/dsv_xhd/dprasad/work/CRs/junk/tutorial/ug937/completed/XSim_Tutorial/XSim_Tutorial.srcs/sources_1/ip/sine_low/sine_low_funcsim.v
// Design      : sine_low
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dds_compiler_v6_0,Vivado 2014.1" *) (* CHECK_LICENSE_TYPE = "sine_low,dds_compiler_v6_0,{}" *) 
(* core_generation_info = "sine_low,dds_compiler_v6_0,{x_ipProduct=Vivado 2014.1,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=dds_compiler,x_ipVersion=6.0,x_ipCoreRevision=4,x_ipLanguage=VERILOG,C_XDEVICEFAMILY=kintex7,C_MODE_OF_OPERATION=0,C_MODULUS=9,C_ACCUMULATOR_WIDTH=6,C_CHANNELS=1,C_HAS_PHASE_OUT=0,C_HAS_PHASEGEN=0,C_HAS_SINCOS=1,C_LATENCY=2,C_MEM_TYPE=1,C_NEGATIVE_COSINE=0,C_NEGATIVE_SINE=0,C_NOISE_SHAPING=0,C_OUTPUTS_REQUIRED=0,C_OUTPUT_FORM=0,C_OUTPUT_WIDTH=16,C_PHASE_ANGLE_WIDTH=6,C_PHASE_INCREMENT=2,C_PHASE_INCREMENT_VALUE=0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0,C_RESYNC=0,C_PHASE_OFFSET=0,C_PHASE_OFFSET_VALUE=0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0,C_OPTIMISE_GOAL=0,C_USE_DSP48=0,C_POR_MODE=0,C_AMPLITUDE=0,C_HAS_ACLKEN=0,C_HAS_ARESETN=1,C_HAS_TLAST=0,C_HAS_TREADY=0,C_HAS_S_PHASE=1,C_S_PHASE_TDATA_WIDTH=8,C_S_PHASE_HAS_TUSER=0,C_S_PHASE_TUSER_WIDTH=1,C_HAS_S_CONFIG=0,C_S_CONFIG_SYNC_MODE=0,C_S_CONFIG_TDATA_WIDTH=1,C_HAS_M_DATA=1,C_M_DATA_TDATA_WIDTH=16,C_M_DATA_HAS_TUSER=0,C_M_DATA_TUSER_WIDTH=1,C_HAS_M_PHASE=0,C_M_PHASE_TDATA_WIDTH=1,C_M_PHASE_HAS_TUSER=0,C_M_PHASE_TUSER_WIDTH=1,C_DEBUG_INTERFACE=0,C_CHAN_WIDTH=1}" *) 
(* NotValidForBitStream *)
module sine_low
   (aclk,
    aresetn,
    s_axis_phase_tvalid,
    s_axis_phase_tdata,
    m_axis_data_tvalid,
    m_axis_data_tdata);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 aclk_intf CLK" *) input aclk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 aresetn_intf RST" *) input aresetn;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_PHASE TVALID" *) input s_axis_phase_tvalid;
  input [7:0]s_axis_phase_tdata;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_DATA TVALID" *) output m_axis_data_tvalid;
  output [15:0]m_axis_data_tdata;

  wire aclk;
  wire aresetn;
  wire [15:0]m_axis_data_tdata;
  wire m_axis_data_tvalid;
  wire [7:0]s_axis_phase_tdata;
  wire s_axis_phase_tvalid;
  wire NLW_U0_debug_axi_resync_in_UNCONNECTED;
  wire NLW_U0_debug_core_nd_UNCONNECTED;
  wire NLW_U0_debug_phase_nd_UNCONNECTED;
  wire NLW_U0_event_phase_in_invalid_UNCONNECTED;
  wire NLW_U0_event_pinc_invalid_UNCONNECTED;
  wire NLW_U0_event_poff_invalid_UNCONNECTED;
  wire NLW_U0_event_s_config_tlast_missing_UNCONNECTED;
  wire NLW_U0_event_s_config_tlast_unexpected_UNCONNECTED;
  wire NLW_U0_event_s_phase_chanid_incorrect_UNCONNECTED;
  wire NLW_U0_event_s_phase_tlast_missing_UNCONNECTED;
  wire NLW_U0_event_s_phase_tlast_unexpected_UNCONNECTED;
  wire NLW_U0_m_axis_data_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_phase_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_phase_tvalid_UNCONNECTED;
  wire NLW_U0_s_axis_config_tready_UNCONNECTED;
  wire NLW_U0_s_axis_phase_tready_UNCONNECTED;
  wire [0:0]NLW_U0_debug_axi_chan_in_UNCONNECTED;
  wire [5:0]NLW_U0_debug_axi_pinc_in_UNCONNECTED;
  wire [5:0]NLW_U0_debug_axi_poff_in_UNCONNECTED;
  wire [5:0]NLW_U0_debug_phase_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_data_tuser_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_phase_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_phase_tuser_UNCONNECTED;

(* C_ACCUMULATOR_WIDTH = "6" *) 
   (* C_AMPLITUDE = "0" *) 
   (* C_CHANNELS = "1" *) 
   (* C_CHAN_WIDTH = "1" *) 
   (* C_DEBUG_INTERFACE = "0" *) 
   (* C_HAS_ACLKEN = "0" *) 
   (* C_HAS_ARESETN = "1" *) 
   (* C_HAS_M_DATA = "1" *) 
   (* C_HAS_M_PHASE = "0" *) 
   (* C_HAS_PHASEGEN = "0" *) 
   (* C_HAS_PHASE_OUT = "0" *) 
   (* C_HAS_SINCOS = "1" *) 
   (* C_HAS_S_CONFIG = "0" *) 
   (* C_HAS_S_PHASE = "1" *) 
   (* C_HAS_TLAST = "0" *) 
   (* C_HAS_TREADY = "0" *) 
   (* C_LATENCY = "2" *) 
   (* C_MEM_TYPE = "1" *) 
   (* C_MODE_OF_OPERATION = "0" *) 
   (* C_MODULUS = "9" *) 
   (* C_M_DATA_HAS_TUSER = "0" *) 
   (* C_M_DATA_TDATA_WIDTH = "16" *) 
   (* C_M_DATA_TUSER_WIDTH = "1" *) 
   (* C_M_PHASE_HAS_TUSER = "0" *) 
   (* C_M_PHASE_TDATA_WIDTH = "1" *) 
   (* C_M_PHASE_TUSER_WIDTH = "1" *) 
   (* C_NEGATIVE_COSINE = "0" *) 
   (* C_NEGATIVE_SINE = "0" *) 
   (* C_NOISE_SHAPING = "0" *) 
   (* C_OPTIMISE_GOAL = "0" *) 
   (* C_OUTPUTS_REQUIRED = "0" *) 
   (* C_OUTPUT_FORM = "0" *) 
   (* C_OUTPUT_WIDTH = "16" *) 
   (* C_PHASE_ANGLE_WIDTH = "6" *) 
   (* C_PHASE_INCREMENT = "2" *) 
   (* C_PHASE_INCREMENT_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
   (* C_PHASE_OFFSET = "0" *) 
   (* C_PHASE_OFFSET_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
   (* C_POR_MODE = "0" *) 
   (* C_RESYNC = "0" *) 
   (* C_S_CONFIG_SYNC_MODE = "0" *) 
   (* C_S_CONFIG_TDATA_WIDTH = "1" *) 
   (* C_S_PHASE_HAS_TUSER = "0" *) 
   (* C_S_PHASE_TDATA_WIDTH = "8" *) 
   (* C_S_PHASE_TUSER_WIDTH = "1" *) 
   (* C_USE_DSP48 = "0" *) 
   (* C_XDEVICEFAMILY = "kintex7" *) 
   (* DONT_TOUCH *) 
   (* downgradeipidentifiedwarnings = "yes" *) 
   sine_lowdds_compiler_v6_0__parameterized0 U0
       (.aclk(aclk),
        .aclken(1'b1),
        .aresetn(aresetn),
        .debug_axi_chan_in(NLW_U0_debug_axi_chan_in_UNCONNECTED[0]),
        .debug_axi_pinc_in(NLW_U0_debug_axi_pinc_in_UNCONNECTED[5:0]),
        .debug_axi_poff_in(NLW_U0_debug_axi_poff_in_UNCONNECTED[5:0]),
        .debug_axi_resync_in(NLW_U0_debug_axi_resync_in_UNCONNECTED),
        .debug_core_nd(NLW_U0_debug_core_nd_UNCONNECTED),
        .debug_phase(NLW_U0_debug_phase_UNCONNECTED[5:0]),
        .debug_phase_nd(NLW_U0_debug_phase_nd_UNCONNECTED),
        .event_phase_in_invalid(NLW_U0_event_phase_in_invalid_UNCONNECTED),
        .event_pinc_invalid(NLW_U0_event_pinc_invalid_UNCONNECTED),
        .event_poff_invalid(NLW_U0_event_poff_invalid_UNCONNECTED),
        .event_s_config_tlast_missing(NLW_U0_event_s_config_tlast_missing_UNCONNECTED),
        .event_s_config_tlast_unexpected(NLW_U0_event_s_config_tlast_unexpected_UNCONNECTED),
        .event_s_phase_chanid_incorrect(NLW_U0_event_s_phase_chanid_incorrect_UNCONNECTED),
        .event_s_phase_tlast_missing(NLW_U0_event_s_phase_tlast_missing_UNCONNECTED),
        .event_s_phase_tlast_unexpected(NLW_U0_event_s_phase_tlast_unexpected_UNCONNECTED),
        .m_axis_data_tdata(m_axis_data_tdata),
        .m_axis_data_tlast(NLW_U0_m_axis_data_tlast_UNCONNECTED),
        .m_axis_data_tready(1'b0),
        .m_axis_data_tuser(NLW_U0_m_axis_data_tuser_UNCONNECTED[0]),
        .m_axis_data_tvalid(m_axis_data_tvalid),
        .m_axis_phase_tdata(NLW_U0_m_axis_phase_tdata_UNCONNECTED[0]),
        .m_axis_phase_tlast(NLW_U0_m_axis_phase_tlast_UNCONNECTED),
        .m_axis_phase_tready(1'b0),
        .m_axis_phase_tuser(NLW_U0_m_axis_phase_tuser_UNCONNECTED[0]),
        .m_axis_phase_tvalid(NLW_U0_m_axis_phase_tvalid_UNCONNECTED),
        .s_axis_config_tdata(1'b0),
        .s_axis_config_tlast(1'b0),
        .s_axis_config_tready(NLW_U0_s_axis_config_tready_UNCONNECTED),
        .s_axis_config_tvalid(1'b0),
        .s_axis_phase_tdata(s_axis_phase_tdata),
        .s_axis_phase_tlast(1'b0),
        .s_axis_phase_tready(NLW_U0_s_axis_phase_tready_UNCONNECTED),
        .s_axis_phase_tuser(1'b0),
        .s_axis_phase_tvalid(s_axis_phase_tvalid));
endmodule

(* ORIG_REF_NAME = "dds_compiler_v6_0" *) (* C_XDEVICEFAMILY = "kintex7" *) (* C_MODE_OF_OPERATION = "0" *) 
(* C_MODULUS = "9" *) (* C_ACCUMULATOR_WIDTH = "6" *) (* C_CHANNELS = "1" *) 
(* C_HAS_PHASE_OUT = "0" *) (* C_HAS_PHASEGEN = "0" *) (* C_HAS_SINCOS = "1" *) 
(* C_LATENCY = "2" *) (* C_MEM_TYPE = "1" *) (* C_NEGATIVE_COSINE = "0" *) 
(* C_NEGATIVE_SINE = "0" *) (* C_NOISE_SHAPING = "0" *) (* C_OUTPUTS_REQUIRED = "0" *) 
(* C_OUTPUT_FORM = "0" *) (* C_OUTPUT_WIDTH = "16" *) (* C_PHASE_ANGLE_WIDTH = "6" *) 
(* C_PHASE_INCREMENT = "2" *) (* C_PHASE_INCREMENT_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) (* C_RESYNC = "0" *) 
(* C_PHASE_OFFSET = "0" *) (* C_PHASE_OFFSET_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) (* C_OPTIMISE_GOAL = "0" *) 
(* C_USE_DSP48 = "0" *) (* C_POR_MODE = "0" *) (* C_AMPLITUDE = "0" *) 
(* C_HAS_ACLKEN = "0" *) (* C_HAS_ARESETN = "1" *) (* C_HAS_TLAST = "0" *) 
(* C_HAS_TREADY = "0" *) (* C_HAS_S_PHASE = "1" *) (* C_S_PHASE_TDATA_WIDTH = "8" *) 
(* C_S_PHASE_HAS_TUSER = "0" *) (* C_S_PHASE_TUSER_WIDTH = "1" *) (* C_HAS_S_CONFIG = "0" *) 
(* C_S_CONFIG_SYNC_MODE = "0" *) (* C_S_CONFIG_TDATA_WIDTH = "1" *) (* C_HAS_M_DATA = "1" *) 
(* C_M_DATA_TDATA_WIDTH = "16" *) (* C_M_DATA_HAS_TUSER = "0" *) (* C_M_DATA_TUSER_WIDTH = "1" *) 
(* C_HAS_M_PHASE = "0" *) (* C_M_PHASE_TDATA_WIDTH = "1" *) (* C_M_PHASE_HAS_TUSER = "0" *) 
(* C_M_PHASE_TUSER_WIDTH = "1" *) (* C_DEBUG_INTERFACE = "0" *) (* C_CHAN_WIDTH = "1" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module sine_lowdds_compiler_v6_0__parameterized0
   (aclk,
    aclken,
    aresetn,
    s_axis_phase_tvalid,
    s_axis_phase_tready,
    s_axis_phase_tdata,
    s_axis_phase_tlast,
    s_axis_phase_tuser,
    s_axis_config_tvalid,
    s_axis_config_tready,
    s_axis_config_tdata,
    s_axis_config_tlast,
    m_axis_data_tvalid,
    m_axis_data_tready,
    m_axis_data_tdata,
    m_axis_data_tlast,
    m_axis_data_tuser,
    m_axis_phase_tvalid,
    m_axis_phase_tready,
    m_axis_phase_tdata,
    m_axis_phase_tlast,
    m_axis_phase_tuser,
    event_pinc_invalid,
    event_poff_invalid,
    event_phase_in_invalid,
    event_s_phase_tlast_missing,
    event_s_phase_tlast_unexpected,
    event_s_phase_chanid_incorrect,
    event_s_config_tlast_missing,
    event_s_config_tlast_unexpected,
    debug_axi_pinc_in,
    debug_axi_poff_in,
    debug_axi_resync_in,
    debug_axi_chan_in,
    debug_core_nd,
    debug_phase,
    debug_phase_nd);
  input aclk;
  input aclken;
  input aresetn;
  input s_axis_phase_tvalid;
  output s_axis_phase_tready;
  input [7:0]s_axis_phase_tdata;
  input s_axis_phase_tlast;
  input [0:0]s_axis_phase_tuser;
  input s_axis_config_tvalid;
  output s_axis_config_tready;
  input [0:0]s_axis_config_tdata;
  input s_axis_config_tlast;
  output m_axis_data_tvalid;
  input m_axis_data_tready;
  output [15:0]m_axis_data_tdata;
  output m_axis_data_tlast;
  output [0:0]m_axis_data_tuser;
  output m_axis_phase_tvalid;
  input m_axis_phase_tready;
  output [0:0]m_axis_phase_tdata;
  output m_axis_phase_tlast;
  output [0:0]m_axis_phase_tuser;
  output event_pinc_invalid;
  output event_poff_invalid;
  output event_phase_in_invalid;
  output event_s_phase_tlast_missing;
  output event_s_phase_tlast_unexpected;
  output event_s_phase_chanid_incorrect;
  output event_s_config_tlast_missing;
  output event_s_config_tlast_unexpected;
  output [5:0]debug_axi_pinc_in;
  output [5:0]debug_axi_poff_in;
  output debug_axi_resync_in;
  output [0:0]debug_axi_chan_in;
  output debug_core_nd;
  output [5:0]debug_phase;
  output debug_phase_nd;

  wire \<const0> ;
  wire aclk;
  wire aclken;
  wire aresetn;
  wire [0:0]debug_axi_chan_in;
  wire [5:0]debug_axi_pinc_in;
  wire [5:0]debug_axi_poff_in;
  wire debug_core_nd;
  wire [5:0]debug_phase;
  wire debug_phase_nd;
  wire event_phase_in_invalid;
  wire event_pinc_invalid;
  wire event_poff_invalid;
  wire event_s_config_tlast_missing;
  wire event_s_config_tlast_unexpected;
  wire event_s_phase_chanid_incorrect;
  wire event_s_phase_tlast_missing;
  wire event_s_phase_tlast_unexpected;
  wire [15:0]m_axis_data_tdata;
  wire m_axis_data_tlast;
  wire m_axis_data_tready;
  wire [0:0]m_axis_data_tuser;
  wire m_axis_data_tvalid;
  wire [0:0]m_axis_phase_tdata;
  wire m_axis_phase_tlast;
  wire m_axis_phase_tready;
  wire [0:0]m_axis_phase_tuser;
  wire m_axis_phase_tvalid;
  wire [0:0]s_axis_config_tdata;
  wire s_axis_config_tlast;
  wire s_axis_config_tready;
  wire s_axis_config_tvalid;
  wire [7:0]s_axis_phase_tdata;
  wire s_axis_phase_tlast;
  wire s_axis_phase_tready;
  wire [0:0]s_axis_phase_tuser;
  wire s_axis_phase_tvalid;
  wire NLW_i_synth_debug_axi_resync_in_UNCONNECTED;

  assign debug_axi_resync_in = \<const0> ;
GND GND
       (.G(\<const0> ));
(* C_ACCUMULATOR_WIDTH = "6" *) 
   (* C_AMPLITUDE = "0" *) 
   (* C_CHANNELS = "1" *) 
   (* C_CHAN_WIDTH = "1" *) 
   (* C_DEBUG_INTERFACE = "0" *) 
   (* C_HAS_ACLKEN = "0" *) 
   (* C_HAS_ARESETN = "1" *) 
   (* C_HAS_M_DATA = "1" *) 
   (* C_HAS_M_PHASE = "0" *) 
   (* C_HAS_PHASEGEN = "0" *) 
   (* C_HAS_PHASE_OUT = "0" *) 
   (* C_HAS_SINCOS = "1" *) 
   (* C_HAS_S_CONFIG = "0" *) 
   (* C_HAS_S_PHASE = "1" *) 
   (* C_HAS_TLAST = "0" *) 
   (* C_HAS_TREADY = "0" *) 
   (* C_LATENCY = "2" *) 
   (* C_MEM_TYPE = "1" *) 
   (* C_MODE_OF_OPERATION = "0" *) 
   (* C_MODULUS = "9" *) 
   (* C_M_DATA_HAS_TUSER = "0" *) 
   (* C_M_DATA_TDATA_WIDTH = "16" *) 
   (* C_M_DATA_TUSER_WIDTH = "1" *) 
   (* C_M_PHASE_HAS_TUSER = "0" *) 
   (* C_M_PHASE_TDATA_WIDTH = "1" *) 
   (* C_M_PHASE_TUSER_WIDTH = "1" *) 
   (* C_NEGATIVE_COSINE = "0" *) 
   (* C_NEGATIVE_SINE = "0" *) 
   (* C_NOISE_SHAPING = "0" *) 
   (* C_OPTIMISE_GOAL = "0" *) 
   (* C_OUTPUTS_REQUIRED = "0" *) 
   (* C_OUTPUT_FORM = "0" *) 
   (* C_OUTPUT_WIDTH = "16" *) 
   (* C_PHASE_ANGLE_WIDTH = "6" *) 
   (* C_PHASE_INCREMENT = "2" *) 
   (* C_PHASE_INCREMENT_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
   (* C_PHASE_OFFSET = "0" *) 
   (* C_PHASE_OFFSET_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
   (* C_POR_MODE = "0" *) 
   (* C_RESYNC = "0" *) 
   (* C_S_CONFIG_SYNC_MODE = "0" *) 
   (* C_S_CONFIG_TDATA_WIDTH = "1" *) 
   (* C_S_PHASE_HAS_TUSER = "0" *) 
   (* C_S_PHASE_TDATA_WIDTH = "8" *) 
   (* C_S_PHASE_TUSER_WIDTH = "1" *) 
   (* C_USE_DSP48 = "0" *) 
   (* C_XDEVICEFAMILY = "kintex7" *) 
   (* downgradeipidentifiedwarnings = "yes" *) 
   (* secure_extras = "A" *) 
   sine_lowdds_compiler_v6_0_viv__parameterized0 i_synth
       (.aclk(aclk),
        .aclken(aclken),
        .aresetn(aresetn),
        .debug_axi_chan_in(debug_axi_chan_in),
        .debug_axi_pinc_in(debug_axi_pinc_in),
        .debug_axi_poff_in(debug_axi_poff_in),
        .debug_axi_resync_in(NLW_i_synth_debug_axi_resync_in_UNCONNECTED),
        .debug_core_nd(debug_core_nd),
        .debug_phase(debug_phase),
        .debug_phase_nd(debug_phase_nd),
        .event_phase_in_invalid(event_phase_in_invalid),
        .event_pinc_invalid(event_pinc_invalid),
        .event_poff_invalid(event_poff_invalid),
        .event_s_config_tlast_missing(event_s_config_tlast_missing),
        .event_s_config_tlast_unexpected(event_s_config_tlast_unexpected),
        .event_s_phase_chanid_incorrect(event_s_phase_chanid_incorrect),
        .event_s_phase_tlast_missing(event_s_phase_tlast_missing),
        .event_s_phase_tlast_unexpected(event_s_phase_tlast_unexpected),
        .m_axis_data_tdata(m_axis_data_tdata),
        .m_axis_data_tlast(m_axis_data_tlast),
        .m_axis_data_tready(m_axis_data_tready),
        .m_axis_data_tuser(m_axis_data_tuser),
        .m_axis_data_tvalid(m_axis_data_tvalid),
        .m_axis_phase_tdata(m_axis_phase_tdata),
        .m_axis_phase_tlast(m_axis_phase_tlast),
        .m_axis_phase_tready(m_axis_phase_tready),
        .m_axis_phase_tuser(m_axis_phase_tuser),
        .m_axis_phase_tvalid(m_axis_phase_tvalid),
        .s_axis_config_tdata(s_axis_config_tdata),
        .s_axis_config_tlast(s_axis_config_tlast),
        .s_axis_config_tready(s_axis_config_tready),
        .s_axis_config_tvalid(s_axis_config_tvalid),
        .s_axis_phase_tdata(s_axis_phase_tdata),
        .s_axis_phase_tlast(s_axis_phase_tlast),
        .s_axis_phase_tready(s_axis_phase_tready),
        .s_axis_phase_tuser(s_axis_phase_tuser),
        .s_axis_phase_tvalid(s_axis_phase_tvalid));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`pragma protect key_keyowner = "Cadence Design Systems.", key_keyname= "cds_rsa_key", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 64)
`pragma protect key_block
h0tEAlFsA9HDCZqOUJy+G8Ezu5i4s1AL4I8QpTzEYjY1PUfhNz870NRJUJ8eUTGjCIYtH+yGeuWP
6thoPVFYng==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-VERIF-SIM-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
IvQLJ74uQwHh4hYQ5XYjnAwKUBExabWFhgJW/H7aOcZQ1cFobtNrpBJoCTOBDW726nT/nupPjaUp
DvR5oS7EJPImIvCIjds6nOYnCG0Iwt9RdmaMIbCui1yzhaYp+hoKk3o46Hzul94Y+o/ayZCcpZR2
/Qci1SNYUhJ1RrrmqNs=


`pragma protect key_keyowner = "Xilinx", key_keyname= "xilinx_2014_03", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
Hz81nTFxiTQPemndYkbw9egd+xffeo6nzKZe2X5spH/wsX7cqOm7T01PYH4ex9p+1llDlMEVkVmW
V6IMnkaNlit14rQ1FFcJ6hlDiPK03fD1cQKYFP8R7BtlEah4pskfbz4qAcozqhGvs9PRNG6cx7ed
+dul/DMmv2ogSA8LWwwDt5YbWxXaY492QGkSx8YFqtamo7aEqL1LRc+pIJSw/x+teTzTX6JEuuAQ
4DaPCR4iepOvtm1i/DdK7tZZGCwUnK8tWXuN3phW+v9/AKkoncFT682UMR1zK8tlelDJ9wGo62Qg
zcqmWylHSCpSzYNP93BOO5/rvcV6efzfRTq/Dg==


`pragma protect key_keyowner = "Synopsys", key_keyname= "SNPS-VCS-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
SrAlvDA57cXA6oZZZhVok3rx/TSXFSZX/HgL/2OpZqG2BamRxYsl1VrJ5zivzPntB983hpgHX464
QZrbCqXj4P9IQTdtqxy4Z6PlNoK294T+lwHjSyUxkOOhNMEfbmLMhPix15wBF7h0Ze2V2Cpa5DUy
gmqrSKzpBS23CwbNhno=


`pragma protect key_keyowner = "Aldec", key_keyname= "ALDEC08_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
LoYIb/uS1qr7Is0tYYVAP20KjCbCAEr9Za21xpXBUqkt4z+gLf9vhun81iUqQvlgAj+zP9YswcmE
T2wE+FLhokZYFrtQzib11+WsTsBDePo/GRPzeeR3UMHj0eLtb8QpnLD1Kb3GJ6CvNt1okvozE4l1
jmVxYjrc5EB+p2/xqSe8uFPhP1ajcupkDSCo05oBkw5iU6dS/ftjrWdTU6CXAz3W99MkmIaUIRtB
uHlX2cXa1vQ6h3sxXDtRdiry6kT/c53tB9DfPAiXBX6U2UCVo3pSRzfBcOd4aKcQLnRCNiEksb5M
mpW4FctE46mawwN6FBBWOJS+KLr1q4o+BwygIQ==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-PREC-RSA", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
bN2zMAeIbpi32q0c+WKiLH14WwVfOMdDiT+DkJwRgFvwreQ++GvZT2i3OVd6jkYSjL/BlTCcEtb11uC59ShiMDJsI7gfDbjS55NLZIcHeJOYG6SWqE2PPJ4Iu4WSejCybCIav5KgMvfPHS9IogOKFVvj9ECHRWCgEfvVOxa64XZFVgXjJ99hAEfEth/3EgfghYVL2dI1Bp4LIWCADedbLaX+ncaFj3MS/5L8YsPBuEqGZstW6NhF3K8LY3lbgbW4CyU3p/ew6teqPP1/t6lp7rXK60D5jVWkgy/QAsM/CrdLn0/NBY72HlzBPyLitIQ97PoQde48H6tYN+Qcxfkkfg==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 64, bytes = 128)
`pragma protect key_block
Nac8bfekihnp18efty80auxQCAdpDQJxP8/3DwwX1Q98FmyxIuy0sO5cWAntvhNu9Kto9qh+c/sKtJiXkKGYqMLDQ7LjCX4JSR6hGdsJdkPiJty9V3d4zWSqSYbkv7kLhWEYPV+OqjHYntmKmbTdcK4neRh6f+lQeRMTvWxW1Oaksph828FGICVWLelyQqPtgDx0QMbaErk7ZTzPkZaFh4XSHlM6viCh6c5DKdFsPmGaqWDbxCH720jfBORxy5iRQr5bKpgzwigUmxGm66qJzkdHpZCUlf+ioGbPUjkxcfE6F6xd6CVM1AXB+aDCeoqL0WWbIE0aPRXwp+kUY9I10Q==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 64, bytes = 27472)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
