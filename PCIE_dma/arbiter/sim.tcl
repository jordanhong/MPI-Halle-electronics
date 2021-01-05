vlog tb_arbiter.v arbiter.v RAM.v custom_logic.v fifo_wrapper.v custom_read.v custom_write.v
vsim work.tb_arbiter -Lf altera_mf_ver
do wave.do
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {127868 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 261
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
run 1000 ns
