module autovcoder_007751 #(
    parameter C_DEPTH_BITS = 4
) (
    input RD_CLK,
    input RD_RST,
    input RD_EN,
    output RD_EMPTY,
    output [C_DEPTH_BITS-1:0] RD_PTR,
    output [C_DEPTH_BITS-1:0] RD_PTR_P1,
    input CMP_EMPTY
);

  reg                     rEmpty = 1;
  reg                     rEmpty2 = 1;
  reg  [C_DEPTH_BITS-1:0] rRdPtr = 0;
  reg  [C_DEPTH_BITS-1:0] rRdPtrP1 = 0;
  reg  [C_DEPTH_BITS-1:0] rBin = 0;
  reg  [C_DEPTH_BITS-1:0] rBinP1 = 1;
  wire [C_DEPTH_BITS-1:0] wGrayNext;
  wire [C_DEPTH_BITS-1:0] wGrayNextP1;
  wire [C_DEPTH_BITS-1:0] wBinNext;
  wire [C_DEPTH_BITS-1:0] wBinNextP1;

  assign RD_EMPTY = rEmpty;
  assign RD_PTR = rRdPtr;
  assign RD_PTR_P1 = rRdPtrP1;

  // Gray coded pointer
  always @(posedge RD_CLK or posedge RD_RST) begin
    if (RD_RST) begin
      rBin <= #1 0;
      rBinP1 <= #1 1;
      rRdPtr <= #1 0;
      rRdPtrP1 <= #1 0;
    end else begin
      rBin <= #1 wBinNext;
      rBinP1 <= #1 wBinNextP1;
      rRdPtr <= #1 wGrayNext;
      rRdPtrP1 <= #1 wGrayNextP1;
    end
  end

  // Increment the binary count if not empty
  assign wBinNext = (!rEmpty ? rBin + RD_EN : rBin);
  assign wBinNextP1 = (!rEmpty ? rBinP1 + RD_EN : rBinP1);
  assign wGrayNext = ((wBinNext >> 1) ^ wBinNext);  // binary-to-gray conversion
  assign wGrayNextP1 = ((wBinNextP1 >> 1) ^ wBinNextP1);  // binary-to-gray conversion

  always @(posedge RD_CLK) begin
    if (CMP_EMPTY) {rEmpty, rEmpty2} <= #1 2'b11;
    else {rEmpty, rEmpty2} <= #1{rEmpty2, CMP_EMPTY};
  end

endmodule

