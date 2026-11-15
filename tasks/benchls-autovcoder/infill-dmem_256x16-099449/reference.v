module autovcoder_099449 #(
    parameter W = 16
) (
    clk,
    addr,
    rd,
    wr,
    W_data,
    R_data
);

  input clk;
  input [W-9:0] addr;  // 8-bit address to allow 256 selections for DREG
  input rd;
  input wr;
  input [W-1:0] W_data;

  output reg [W-1:0] R_data;

  reg [15:0] DMEM[0:255];  //256 addresses 16-bits long.   

  integer i;

  initial begin
    R_data   = 16'hZZZZ;
    DMEM[0]  = 16'b0000_0000_0001_0010;
    DMEM[1]  = 16'b0001_0011_0100_0101;

    DMEM[2]  = 16'b0010_0110_0111_1000;
    DMEM[3]  = 16'b0011_1001_1010_1011;
    DMEM[4]  = 16'b0100_1100_1101_1110;
    DMEM[5]  = 16'b0101_0000_0001_0010;
    DMEM[6]  = 16'b0110_0011_0100_0101;
    DMEM[7]  = 16'b0111_0110_0111_1000;

    DMEM[8]  = 16'b1000_1001_1010_1011;
    DMEM[9]  = 16'b1001_1100_1101_1110;
    DMEM[10] = 16'b1010_0000_0001_0010;

    DMEM[11] = 16'b1011_0011_0100_0101;
    DMEM[12] = 16'b1100_0110_0111_1000;

    DMEM[13] = 16'b1101_1001_1010_1011;
    DMEM[14] = 16'b1110_1100_1101_1110;
    DMEM[15] = 16'b1111_0000_0001_0010;

    for (i = 16; i < 256; i = i + 1) begin
      DMEM[i] = 0;
    end

  end

  always @(posedge clk) begin
    if (wr == 1'b1)
      DMEM[addr] <= W_data[W-1:0];  // In the specified address of DREG[], store Write data.
  end

  always @(posedge clk) begin
    if (rd == 1'b1) R_data <= DMEM[addr];
    else R_data <= R_data;
  end

endmodule

