vlog *.v
vsim work.testbench
onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/clkCore
add wave -noupdate /testbench/reset
add wave -noupdate /testbench/en
add wave -noupdate /testbench/clkA
add wave -noupdate /testbench/clkB
add wave -noupdate /testbench/en_8MHz
add wave -noupdate /testbench/en_1MHz
add wave -noupdate -radix unsigned /testbench/c1
add wave -noupdate -radix unsigned /testbench/c2
add wave -noupdate /testbench/load
add wave -noupdate -radix unsigned /testbench/W
add wave -noupdate -radix unsigned /testbench/A_val
add wave -noupdate -radix unsigned /testbench/B_val
add wave -noupdate /testbench/decoderDone
add wave -noupdate /testbench/PWMreset
add wave -noupdate /testbench/PWMset
add wave -noupdate -color Yellow /testbench/signal
add wave -noupdate -radix unsigned /testbench/cA
add wave -noupdate -radix unsigned /testbench/cB
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1880000000 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {0 fs} {52500 ns}
run 50us
