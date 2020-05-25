// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.1 (lin64) Build 869706 Tue Mar 18 19:15:21 MDT 2014
// Date        : Wed Mar 19 22:19:15 2014
// Host        : xhdl3064 running 64-bit Red Hat Enterprise Linux Workstation release 6.4 (Santiago)
// Command     : write_verilog -force -mode funcsim
//               /proj/dsv_xhd/dprasad/work/CRs/junk/tutorial/ug937/completed/XSim_Tutorial/XSim_Tutorial.srcs/sources_1/ip/sine_mid/sine_mid_funcsim.v
// Design      : sine_mid
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dds_compiler_v6_0,Vivado 2014.1" *) (* CHECK_LICENSE_TYPE = "sine_mid,dds_compiler_v6_0,{}" *) 
(* core_generation_info = "sine_mid,dds_compiler_v6_0,{x_ipProduct=Vivado 2014.1,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=dds_compiler,x_ipVersion=6.0,x_ipCoreRevision=4,x_ipLanguage=VERILOG,C_XDEVICEFAMILY=kintex7,C_MODE_OF_OPERATION=0,C_MODULUS=9,C_ACCUMULATOR_WIDTH=8,C_CHANNELS=1,C_HAS_PHASE_OUT=0,C_HAS_PHASEGEN=0,C_HAS_SINCOS=1,C_LATENCY=2,C_MEM_TYPE=1,C_NEGATIVE_COSINE=0,C_NEGATIVE_SINE=0,C_NOISE_SHAPING=0,C_OUTPUTS_REQUIRED=0,C_OUTPUT_FORM=0,C_OUTPUT_WIDTH=18,C_PHASE_ANGLE_WIDTH=8,C_PHASE_INCREMENT=2,C_PHASE_INCREMENT_VALUE=0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0,C_RESYNC=0,C_PHASE_OFFSET=0,C_PHASE_OFFSET_VALUE=0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0,C_OPTIMISE_GOAL=0,C_USE_DSP48=0,C_POR_MODE=0,C_AMPLITUDE=0,C_HAS_ACLKEN=0,C_HAS_ARESETN=1,C_HAS_TLAST=0,C_HAS_TREADY=0,C_HAS_S_PHASE=1,C_S_PHASE_TDATA_WIDTH=8,C_S_PHASE_HAS_TUSER=0,C_S_PHASE_TUSER_WIDTH=1,C_HAS_S_CONFIG=0,C_S_CONFIG_SYNC_MODE=0,C_S_CONFIG_TDATA_WIDTH=1,C_HAS_M_DATA=1,C_M_DATA_TDATA_WIDTH=24,C_M_DATA_HAS_TUSER=0,C_M_DATA_TUSER_WIDTH=1,C_HAS_M_PHASE=0,C_M_PHASE_TDATA_WIDTH=1,C_M_PHASE_HAS_TUSER=0,C_M_PHASE_TUSER_WIDTH=1,C_DEBUG_INTERFACE=0,C_CHAN_WIDTH=1}" *) 
(* NotValidForBitStream *)
module sine_mid
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
  output [23:0]m_axis_data_tdata;

  wire aclk;
  wire aresetn;
  wire [23:0]m_axis_data_tdata;
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
  wire [7:0]NLW_U0_debug_axi_pinc_in_UNCONNECTED;
  wire [7:0]NLW_U0_debug_axi_poff_in_UNCONNECTED;
  wire [7:0]NLW_U0_debug_phase_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_data_tuser_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_phase_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_phase_tuser_UNCONNECTED;

(* C_ACCUMULATOR_WIDTH = "8" *) 
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
   (* C_M_DATA_TDATA_WIDTH = "24" *) 
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
   (* C_OUTPUT_WIDTH = "18" *) 
   (* C_PHASE_ANGLE_WIDTH = "8" *) 
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
   sine_middds_compiler_v6_0__parameterized0 U0
       (.aclk(aclk),
        .aclken(1'b1),
        .aresetn(aresetn),
        .debug_axi_chan_in(NLW_U0_debug_axi_chan_in_UNCONNECTED[0]),
        .debug_axi_pinc_in(NLW_U0_debug_axi_pinc_in_UNCONNECTED[7:0]),
        .debug_axi_poff_in(NLW_U0_debug_axi_poff_in_UNCONNECTED[7:0]),
        .debug_axi_resync_in(NLW_U0_debug_axi_resync_in_UNCONNECTED),
        .debug_core_nd(NLW_U0_debug_core_nd_UNCONNECTED),
        .debug_phase(NLW_U0_debug_phase_UNCONNECTED[7:0]),
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
(* C_MODULUS = "9" *) (* C_ACCUMULATOR_WIDTH = "8" *) (* C_CHANNELS = "1" *) 
(* C_HAS_PHASE_OUT = "0" *) (* C_HAS_PHASEGEN = "0" *) (* C_HAS_SINCOS = "1" *) 
(* C_LATENCY = "2" *) (* C_MEM_TYPE = "1" *) (* C_NEGATIVE_COSINE = "0" *) 
(* C_NEGATIVE_SINE = "0" *) (* C_NOISE_SHAPING = "0" *) (* C_OUTPUTS_REQUIRED = "0" *) 
(* C_OUTPUT_FORM = "0" *) (* C_OUTPUT_WIDTH = "18" *) (* C_PHASE_ANGLE_WIDTH = "8" *) 
(* C_PHASE_INCREMENT = "2" *) (* C_PHASE_INCREMENT_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) (* C_RESYNC = "0" *) 
(* C_PHASE_OFFSET = "0" *) (* C_PHASE_OFFSET_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) (* C_OPTIMISE_GOAL = "0" *) 
(* C_USE_DSP48 = "0" *) (* C_POR_MODE = "0" *) (* C_AMPLITUDE = "0" *) 
(* C_HAS_ACLKEN = "0" *) (* C_HAS_ARESETN = "1" *) (* C_HAS_TLAST = "0" *) 
(* C_HAS_TREADY = "0" *) (* C_HAS_S_PHASE = "1" *) (* C_S_PHASE_TDATA_WIDTH = "8" *) 
(* C_S_PHASE_HAS_TUSER = "0" *) (* C_S_PHASE_TUSER_WIDTH = "1" *) (* C_HAS_S_CONFIG = "0" *) 
(* C_S_CONFIG_SYNC_MODE = "0" *) (* C_S_CONFIG_TDATA_WIDTH = "1" *) (* C_HAS_M_DATA = "1" *) 
(* C_M_DATA_TDATA_WIDTH = "24" *) (* C_M_DATA_HAS_TUSER = "0" *) (* C_M_DATA_TUSER_WIDTH = "1" *) 
(* C_HAS_M_PHASE = "0" *) (* C_M_PHASE_TDATA_WIDTH = "1" *) (* C_M_PHASE_HAS_TUSER = "0" *) 
(* C_M_PHASE_TUSER_WIDTH = "1" *) (* C_DEBUG_INTERFACE = "0" *) (* C_CHAN_WIDTH = "1" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module sine_middds_compiler_v6_0__parameterized0
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
  output [23:0]m_axis_data_tdata;
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
  output [7:0]debug_axi_pinc_in;
  output [7:0]debug_axi_poff_in;
  output debug_axi_resync_in;
  output [0:0]debug_axi_chan_in;
  output debug_core_nd;
  output [7:0]debug_phase;
  output debug_phase_nd;

  wire \<const0> ;
  wire aclk;
  wire aclken;
  wire aresetn;
  wire [0:0]debug_axi_chan_in;
  wire [7:0]debug_axi_pinc_in;
  wire [7:0]debug_axi_poff_in;
  wire debug_core_nd;
  wire [7:0]debug_phase;
  wire debug_phase_nd;
  wire event_phase_in_invalid;
  wire event_pinc_invalid;
  wire event_poff_invalid;
  wire event_s_config_tlast_missing;
  wire event_s_config_tlast_unexpected;
  wire event_s_phase_chanid_incorrect;
  wire event_s_phase_tlast_missing;
  wire event_s_phase_tlast_unexpected;
  wire [23:0]m_axis_data_tdata;
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
(* C_ACCUMULATOR_WIDTH = "8" *) 
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
   (* C_M_DATA_TDATA_WIDTH = "24" *) 
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
   (* C_OUTPUT_WIDTH = "18" *) 
   (* C_PHASE_ANGLE_WIDTH = "8" *) 
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
   sine_middds_compiler_v6_0_viv__parameterized0 i_synth
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
KIRiIgJYI/C/PjPdDNjg2tWDZa0xDsVMHDzbVBwUtSdGRskIIJlVN7LdIY3iMdfN83PmVZDCPuNUURVnd9b/bWtDjEfELOkRp/RWj7qSRYxL2vuP4iROW48Jcn8vC+zOn1mDbqd7Kkr479/NulRQjcIDzZbSR9K3usK1iezF1v8zH5vjdnhsqOrf5xH85HFqi06eP+hPl8pZjMl3QkdzKQLfjCuT34cR1lrsZT9yJI2VDNm7Za/Zam5YoVN2YJq5Ti2VcAimI+xoOLs39UCT4iMaa7g2hehatGkRgNgLd1nMQkWgW/dVU4MiW9o8gvKWkH+mN+UbcMHTRdGdoSNJtw==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 64, bytes = 128)
`pragma protect key_block
oQi/LeBDhgESq+690uqfEPoTTBXlsilJUkIe2kFlmzip7JSOQlNmLAGUyJYLRn3gTcBUnpOQ9ZDktS6rA6BRu3WiMlcb6MA67FmfbVgp9oHlhAFZKSToeJBPFfxUd1K2ZYFaL45uBgNlMA5cXnWhX+2nVahpl1rJ4DBF3jiG5/WjAt/YU+NdqttREMttp7YQ+JHh2SlBFKWgWXjMpQdyPL3FGhwbDVFe/FcRQHSDqWAkuuqh1/IAp/fgd2smop2dXqxKVbL1X2SAiOxX1DamwM2ns3pOFu+3qEOT+KJU16uIdHV4JgC46ngx22L+FNugJEtIzJqkQXu7fziRGeOILQ==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 64, bytes = 26416)
`pragma protect data_block
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
vRsVm+i2rzWwY2dFp/VpACucocEVjAapDw==
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
