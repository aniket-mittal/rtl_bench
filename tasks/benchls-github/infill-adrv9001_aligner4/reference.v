module adrv9001_aligner4 (
  input             clk,
  input             rst,
  input       [3:0] idata,
  input             ivalid,
  input       [3:0] strobe,
  output reg  [3:0] odata,
  output            ovalid
);

  reg [3:0] idata_d = 'b0;
  reg       ivalid_d = 'b0;

  always @(posedge clk) begin
    if (rst) begin
      idata_d <= 'h0;
    end else if (ivalid) begin
      idata_d <= idata;
    end
    ivalid_d <= ivalid;
  end

  reg [1:0] phase = 'h0;
  always @(posedge clk) begin
    if (rst) begin
      phase <= 0;
    end else if (ivalid) begin
      if ((strobe != 'b1111) && (strobe != 'b0000)) begin
        casex (strobe)
          'b1xxx  : phase <= 0;
          'b01xx  : phase <= 1;
          'b001x  : phase <= 2;
          'b0001  : phase <= 3;
          default : phase <= phase;
        endcase
      end
    end
  end

  always @(posedge clk) begin
    case (phase)
      0 : odata <= idata_d;
      1 : odata <= {idata_d[2:0],idata[3:3]};
      2 : odata <= {idata_d[1:0],idata[3:2]};
      3 : odata <= {idata_d[0:0],idata[3:1]};
    endcase
  end
  assign ovalid = ivalid_d;

endmodule