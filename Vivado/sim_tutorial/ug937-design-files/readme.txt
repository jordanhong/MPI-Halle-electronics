*****************************************************************
   ____  ____ 
  /   /\/   / 
 /___/  \  /   
 \   \   \/    © Copyright 2012-2019 Xilinx, Inc. All rights reserved.
  \   \        This file contains confidential and proprietary 
  /   /        information of Xilinx, Inc. and is protected under U.S. 
 /___/   /\    and international copyright and other intellectual 
 \   \  /  \   property laws. 
  \___\/\___\ 
 
*****************************************************************
Vendor: Xilinx 
Current readme.txt Version: 1.4
Date of latest version: 06April2016
Date Last Modified:  27October2017
Date Created: 21September2012

Associated Filename: ug937-design-files.zip
Associated Document: ug937, Vivado Design Suite Tutorial: Logic Simulation

Supported Device(s): 7series FPGAs
   
*****************************************************************

Disclaimer: This disclaimer is not a license and does not grant any rights to the materials distributed herewith. Except as otherwise provided in a valid license issued to you by Xilinx, and to the maximum extent permitted by applicable law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and (2) Xilinx shall not be liable (whether in contract or tort, including negligence, or under any other theory of liability) for any loss or damage of any kind or nature related to, arising under or in connection with these materials, including for any direct, or any indirect, special, incidental, or consequential loss or damage (including loss of data, profits, goodwill, or any type of loss or damage suffered as a result of any action brought by a third party) even if such damage or loss was reasonably foreseeable or Xilinx had been advised of the possibility of the same. Critical Applications: Xilinx products are not designed or intended to be fail-safe, or for use in any application requiring fail-safe performance, such as life-support or safety devices or systems, Class III medical devices, nuclear facilities, applications related to the deployment of airbags, or any other applications that could lead to death, personal injury, or severe property or environmental damage (individually and collectively, "Critical Applications"). Customer assumes the sole risk and liability of any use of Xilinx products in Critical Applications, subject only to applicable laws and regulations governing limitations on product liability. THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE AT ALL TIMES. ************************************************************************
This readme file contains these sections:

1. REVISION HISTORY
2. NOTES


1. REVISION HISTORY 

                 Readme  
Date             Version      Revision Description
========================================================================
06April2016     1.4          Updated for the 2016.1 release	
========================================================================


2. NOTES
These are the Vivado Design Suite Tutorial: Logic Simulation design files.

a. Sine Wave Generator : Generates high, medium and low frequency and amplitude sine waves. 
   File: sinegen.vhd

b. FSM : A Finite State Machine to select one of the four sine waves 
    File: fsm.vhd

c. Debouncer : Enables switch select between raw and debounced version of Sine wave selector. 
   File: debounce.vhd

d. Design Top: Resets FSM and SineGen, MUXes the sine select results to the LED output 
   File: sinegen_demo.vhd

e. Testbench : A simple testbench to simulate the Sine Wave Generator design 
   File: testbench.v
   Main functionality:
   	Generates a 200 MHz input clock for the design system clock 	(sys_clk_p)
   	Generates GPIO button selections
   	Controls raw & debounced sine wave select 
