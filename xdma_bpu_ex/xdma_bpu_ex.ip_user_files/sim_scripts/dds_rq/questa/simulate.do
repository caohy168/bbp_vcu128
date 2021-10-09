onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib dds_rq_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {dds_rq.udo}

run -all

quit -force
