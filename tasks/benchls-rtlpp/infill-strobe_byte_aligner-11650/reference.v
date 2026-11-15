module rtlpp_11650 (
  input             clk,
  input             rst,
  input       [7:0] idata,
  input             ivalid,
  input       [7:0] strobe,
  output reg  [7:0] odata,
  output            ovalid
);

  reg [7:0] idata_d = 8'b0;
  reg       ivalid_d = 1'b0;

  always @(posedge clk) begin
    if (rst) begin
      idata_d <= 8'h00;
      ivalid_d <= 1'b0;
    end else if (ivalid) begin
      idata_d <= idata;
      ivalid_d <= ivalid;
    end
  end

  reg [2:0] phase = 3'b000;
  always @(posedge clk) begin
    if (rst) begin
      phase <= 3'b000;
    end else if (ivalid) begin
      if ((strobe != 8'b1111_1111) && (strobe != 8'b0000_0000)) begin
        casex (strobe)
          8'b1xxx_xxxx : phase <= 3'b000;
          8'b01xx_xxxx : phase <= 3'b001;
          8'b001x_xxxx : phase <= 3'b010;
          8'b0001_xxxx : phase <= 3'b011;
          8'b0000_1xxx : phase <= 3'b100;
          8'b0000_01xx : phase <= 3'b101;
          8'b0000_001x : phase <= 3'b110;
          8'b0000_0001 : phase <= 3'b111;
          default     : phase <= phase;
        endcase
      end
    end
  end

  always @(posedge clk) begin
    case (phase)
      3'b000 : odata <= idata_d;
      3'b001 : odata <= {idata_d[6:0], idata[7]};
      3'b010 : odata <= {idata_d[5:0], idata[7:6]};
      3'b011 : odata <= {idata_d[4:0], idata[7:5]};
      3'b100 : odata <= {idata_d[3:0], idata[7:4]};
      3'b101 : odata <= {idata_d[2:0], idata[7:3]};
      3'b110 : odata <= {idata_d[1:0], idata[7:2]};
      3'b111 : odata <= {idata_d[0], idata[7:1]};
    endcase
  end

  assign ovalid = ivalid_d;

endmodule