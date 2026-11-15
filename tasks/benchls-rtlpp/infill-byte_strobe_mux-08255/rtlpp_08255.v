module rtlpp_08255 (
  input             clk,
  input             rst,
  input       [7:0] idata,
  input             ivalid,
  input       [7:0] strobe,
  output reg  [7:0] odata,
  output            ovalid
);

  reg [7:0] idata_d;
  reg       ivalid_d;

  always @(posedge clk) begin
    if (rst) begin
      idata_d <= 8'b0;
      ivalid_d <= 1'b0;
    end else if (ivalid) begin
      idata_d <= idata;
      ivalid_d <= 1'b1;
    end else begin
      ivalid_d <= 1'b0;
    end
  end

  reg [2:0] phase;
  always @(posedge clk) begin
    if (rst) begin
      phase <= 3'b000;
    end else if (ivalid) begin
      if ((strobe != 8'b1111_1111) && (strobe != 8'b0000_0000)) begin
        case (strobe)
          8'b1xxx_xxxx : phase <= 3'b000;
          8'b01xx_xxxx : phase <= 3'b001;
          8'b001x_xxxx : phase <= 3'b010;
          8'b0001_xxxx : phase <= 3'b011;
          8'b0000_1xxx : phase <= 3'b100;
          8'b0000_01xx : phase <= 3'b101;
          8'b0000_001x : phase <= 3'b110;
          8'b0000_0001 : phase <= 3'b111;
          default      : phase <= phase;
        endcase
      end
    end
  end

  [MASKED]

  assign ovalid = ivalid_d;

endmodule