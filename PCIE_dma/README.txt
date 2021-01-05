altera-pcie-cdma

Chaining Direct Memory Access Through Altera PCIe Core. 

Completed arbiter module and documentation (see arbiter/documentation.txt). To run simulation, use "do sim.tcl" in Modelsim.
Added documentation for PCIE simulation    (see PCIE_design_example/documentation.txt)


===================================================
LOG
====================================================

Custom Logic Todo:

1. (Completed read with mux/demux) Write a Verilog module that uses a {shift register or counter} to determine the selection bit that feeds into a mux/demux.
2. (Completed) The mux maps the wire for RAM read address to four potential addresses; Similar mapping done for demux data, but selection bit is fed into a D flip flop register
3. (Completed) Make FIFO for pushing to-be-written data
4. (Completed) Use FIFO to pipeline data for PWM width.
5. (Completed) Write arbiter module.
6. Modularize Custom logic {custom read, custom write, data processing}. 
5. Incorporate photonic switches program.
