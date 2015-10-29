iverilog -o regfile.t.vvp regfile.t.v regfile.v decoders.v register32.v mux32to1by32.v register32zero.v
vvp regfile.t.vvp