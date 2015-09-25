//define gates w/ delay;
`define AND and #50
`define OR or #50
`define NOT not #50

module behavioralMultiplexer(out, address0,address1, in0,in1,in2,in3);
output out;
input address0, address1;
input in0, in1, in2, in3;
wire[3:0] inputs = {in3, in2, in1, in0};
wire[1:0] address = {address1, address0};
assign out = inputs[address];
endmodule

module structuralMultiplexer(out, address0,address1, in0,in1,in2,in3);
output out;
input address0, address1;
input in0, in1, in2, in3;
wire naddress0;
wire naddress1; 
not naddr0(naddress0, address0);
not naddr1(naddress1, address1);
wire o0, o1, o2, o3;
`AND a0(o0, in0, naddress0, naddress1);
`AND a1(o1, in1, address0, naddress1);
`AND a2(o2, in2, naddress0, address1);
`AND a3(o3, in3, address0, address1);

`OR orAll(out, o0,o1,o2,o3);


endmodule


module testMultiplexer;
reg addr0, addr1, in0, in1, in2, in3;
wire out;
structuralMultiplexer multiplex(out,addr0,addr1,in0,in1,in2,in3);

initial begin

$display("A0  A1  |  in0  in1  in2  in3 | out | exp");
addr0 = 0; addr1 = 0; in0 = 0; in1 = 0; in2 = 0; in3 =0; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  0", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 0; addr1 = 0; in0 = 0; in1 = 0; in2 = 0; in3 =1; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  0", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 0; addr1 = 0; in0 = 0; in1 = 0; in2 = 1; in3 =0; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  0", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 0; addr1 = 0; in0 = 0; in1 = 0; in2 = 1; in3 =1; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  0", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 0; addr1 = 0; in0 = 0; in1 = 1; in2 = 0; in3 =0; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  0", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 0; addr1 = 0; in0 = 0; in1 = 1; in2 = 0; in3 =1; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  0", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 0; addr1 = 0; in0 = 0; in1 = 1; in2 = 1; in3 =0; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  0", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 0; addr1 = 0; in0 = 0; in1 = 1; in2 = 1; in3 =1; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  0", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 0; addr1 = 0; in0 = 1; in1 = 0; in2 = 0; in3 =0; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  1", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 0; addr1 = 0; in0 = 1; in1 = 0; in2 = 0; in3 =1; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  1", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 0; addr1 = 0; in0 = 1; in1 = 0; in2 = 1; in3 =0; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  1", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 0; addr1 = 0; in0 = 1; in1 = 0; in2 = 1; in3 =1; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  1", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 0; addr1 = 0; in0 = 1; in1 = 1; in2 = 0; in3 =0; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  1", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 0; addr1 = 0; in0 = 1; in1 = 1; in2 = 0; in3 =1; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  1", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 0; addr1 = 0; in0 = 1; in1 = 1; in2 = 1; in3 =0; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  1", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 0; addr1 = 0; in0 = 1; in1 = 1; in2 = 1; in3 =1; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  1", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 0; addr1 = 1; in0 = 0; in1 = 0; in2 = 0; in3 =0; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  0", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 0; addr1 = 1; in0 = 0; in1 = 0; in2 = 0; in3 =1; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  0", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 0; addr1 = 1; in0 = 0; in1 = 0; in2 = 1; in3 =0; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  1", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 0; addr1 = 1; in0 = 0; in1 = 0; in2 = 1; in3 =1; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  1", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 0; addr1 = 1; in0 = 0; in1 = 1; in2 = 0; in3 =0; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  0", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 0; addr1 = 1; in0 = 0; in1 = 1; in2 = 0; in3 =1; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  0", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 0; addr1 = 1; in0 = 0; in1 = 1; in2 = 1; in3 =0; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  1", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 0; addr1 = 1; in0 = 0; in1 = 1; in2 = 1; in3 =1; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  1", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 0; addr1 = 1; in0 = 1; in1 = 0; in2 = 0; in3 =0; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  0", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 0; addr1 = 1; in0 = 1; in1 = 0; in2 = 0; in3 =1; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  0", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 0; addr1 = 1; in0 = 1; in1 = 0; in2 = 1; in3 =0; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  1", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 0; addr1 = 1; in0 = 1; in1 = 0; in2 = 1; in3 =1; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  1", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 0; addr1 = 1; in0 = 1; in1 = 1; in2 = 0; in3 =0; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  0", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 0; addr1 = 1; in0 = 1; in1 = 1; in2 = 0; in3 =1; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  0", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 0; addr1 = 1; in0 = 1; in1 = 1; in2 = 1; in3 =0; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  1", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 0; addr1 = 1; in0 = 1; in1 = 1; in2 = 1; in3 =1; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  1", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 1; addr1 = 0; in0 = 0; in1 = 0; in2 = 0; in3 =0; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  0", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 1; addr1 = 0; in0 = 0; in1 = 0; in2 = 0; in3 =1; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  0", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 1; addr1 = 0; in0 = 0; in1 = 0; in2 = 1; in3 =0; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  0", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 1; addr1 = 0; in0 = 0; in1 = 0; in2 = 1; in3 =1; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  0", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 1; addr1 = 0; in0 = 0; in1 = 1; in2 = 0; in3 =0; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  1", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 1; addr1 = 0; in0 = 0; in1 = 1; in2 = 0; in3 =1; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  1", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 1; addr1 = 0; in0 = 0; in1 = 1; in2 = 1; in3 =0; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  1", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 1; addr1 = 0; in0 = 0; in1 = 1; in2 = 1; in3 =1; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  1", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 1; addr1 = 0; in0 = 1; in1 = 0; in2 = 0; in3 =0; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  0", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 1; addr1 = 0; in0 = 1; in1 = 0; in2 = 0; in3 =1; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  0", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 1; addr1 = 0; in0 = 1; in1 = 0; in2 = 1; in3 =0; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  0", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 1; addr1 = 0; in0 = 1; in1 = 0; in2 = 1; in3 =1; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  0", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 1; addr1 = 0; in0 = 1; in1 = 1; in2 = 0; in3 =0; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  1", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 1; addr1 = 0; in0 = 1; in1 = 1; in2 = 0; in3 =1; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  1", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 1; addr1 = 0; in0 = 1; in1 = 1; in2 = 1; in3 =0; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  1", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 1; addr1 = 0; in0 = 1; in1 = 1; in2 = 1; in3 =1; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  1", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 1; addr1 = 1; in0 = 0; in1 = 0; in2 = 0; in3 =0; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  0", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 1; addr1 = 1; in0 = 0; in1 = 0; in2 = 0; in3 =1; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  1", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 1; addr1 = 1; in0 = 0; in1 = 0; in2 = 1; in3 =0; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  0", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 1; addr1 = 1; in0 = 0; in1 = 0; in2 = 1; in3 =1; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  1", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 1; addr1 = 1; in0 = 0; in1 = 1; in2 = 0; in3 =0; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  0", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 1; addr1 = 1; in0 = 0; in1 = 1; in2 = 0; in3 =1; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  1", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 1; addr1 = 1; in0 = 0; in1 = 1; in2 = 1; in3 =0; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  0", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 1; addr1 = 1; in0 = 0; in1 = 1; in2 = 1; in3 =1; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  1", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 1; addr1 = 1; in0 = 1; in1 = 0; in2 = 0; in3 =0; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  0", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 1; addr1 = 1; in0 = 1; in1 = 0; in2 = 0; in3 =1; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  1", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 1; addr1 = 1; in0 = 1; in1 = 0; in2 = 1; in3 =0; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  0", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 1; addr1 = 1; in0 = 1; in1 = 0; in2 = 1; in3 =1; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  1", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 1; addr1 = 1; in0 = 1; in1 = 1; in2 = 0; in3 =0; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  0", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 1; addr1 = 1; in0 = 1; in1 = 1; in2 = 0; in3 =1; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  1", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 1; addr1 = 1; in0 = 1; in1 = 1; in2 = 1; in3 =0; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  0", addr0, addr1, in0, in1, in2, in3, out);
addr0 = 1; addr1 = 1; in0 = 1; in1 = 1; in2 = 1; in3 =1; #100
$display("%b   %b   |   %b    %b    %b    %b  |  %b  |  1", addr0, addr1, in0, in1, in2, in3, out);
end
endmodule
