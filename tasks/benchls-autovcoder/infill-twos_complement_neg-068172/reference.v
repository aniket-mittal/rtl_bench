module autovcoder_068172 (
    output reg [32:0] comout,
    input [32:0] comin,
    input clk
);

  reg [31:0] comtmp;

  always @(posedge clk) begin
    comtmp[0] = ~comin[0];
    comtmp[1] = ~comin[1];
    comtmp[2] = ~comin[2];
    comtmp[3] = ~comin[3];
    comtmp[4] = ~comin[4];
    comtmp[5] = ~comin[5];
    comtmp[6] = ~comin[6];
    comtmp[7] = ~comin[7];
    comtmp[8] = ~comin[8];
    comtmp[9] = ~comin[9];
    comtmp[10] = ~comin[10];
    comtmp[11] = ~comin[11];
    comtmp[12] = ~comin[12];
    comtmp[13] = ~comin[13];
    comtmp[14] = ~comin[14];
    comtmp[15] = ~comin[15];
    comtmp[16] = ~comin[16];
    comtmp[17] = ~comin[17];
    comtmp[18] = ~comin[18];
    comtmp[19] = ~comin[19];
    comtmp[20] = ~comin[20];
    comtmp[21] = ~comin[21];
    comtmp[22] = ~comin[22];
    comtmp[23] = ~comin[23];
    comtmp[24] = ~comin[24];
    comtmp[25] = ~comin[25];
    comtmp[26] = ~comin[26];
    comtmp[27] = ~comin[27];
    comtmp[28] = ~comin[28];
    comtmp[29] = ~comin[29];
    comtmp[30] = ~comin[9];
    comtmp[31] = ~comin[9];
    comtmp = comtmp + 32'b0000_0000_0000_0000_0000_0000_0000_0001;
    comout = comtmp;
    comout[32] = ~comin[32];
  end
endmodule

