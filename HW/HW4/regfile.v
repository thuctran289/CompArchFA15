module regfile
(
output[31:0]    ReadData1,      // Contents of first register read
output[31:0]    ReadData2,      // Contents of second register read
input[31:0]     WriteData,      // Contents to write to register
input[4:0]      ReadRegister1,  // Address of first register to read
input[4:0]      ReadRegister2,  // Address of second register to read
input[4:0]      WriteRegister,  // Address of register to write
input           RegWrite,       // Enable writing of register when High
input           Clk             // Clock (Positive Edge Triggered)
);

wire [31:0] reg_choice;
decoder1to32 dc132(reg_choice, RegWrite, WriteRegister);
wire [31:0] reg2mux[31:0];

genvar i;
generate
        for (i=0; i < 32; i=i+1) begin : reg_store
            if (i == 0)
                begin
                     register32zero r0(reg2mux[i],WriteData,reg_choice[i], Clk);
            end else  
                begin
                     register32 rN0(reg2mux[i],WriteData, reg_choice[i], Clk);
            end
        end
endgenerate

mux32to1by32 mux1(ReadData1, ReadRegister1, reg2mux[0],reg2mux[1],reg2mux[2],reg2mux[3],reg2mux[4],reg2mux[5],reg2mux[6],reg2mux[7],reg2mux[8],reg2mux[9],reg2mux[10],reg2mux[11],reg2mux[12],reg2mux[13],reg2mux[14],reg2mux[15],reg2mux[16],reg2mux[17],reg2mux[18],reg2mux[19],reg2mux[20],reg2mux[21],reg2mux[22],reg2mux[23],reg2mux[24],reg2mux[25],reg2mux[26],reg2mux[27],reg2mux[28],reg2mux[29],reg2mux[30],reg2mux[31]);
mux32to1by32 mux2(ReadData2, ReadRegister2, reg2mux[0],reg2mux[1],reg2mux[2],reg2mux[3],reg2mux[4],reg2mux[5],reg2mux[6],reg2mux[7],reg2mux[8],reg2mux[9],reg2mux[10],reg2mux[11],reg2mux[12],reg2mux[13],reg2mux[14],reg2mux[15],reg2mux[16],reg2mux[17],reg2mux[18],reg2mux[19],reg2mux[20],reg2mux[21],reg2mux[22],reg2mux[23],reg2mux[24],reg2mux[25],reg2mux[26],reg2mux[27],reg2mux[28],reg2mux[29],reg2mux[30],reg2mux[31]);

endmodule
