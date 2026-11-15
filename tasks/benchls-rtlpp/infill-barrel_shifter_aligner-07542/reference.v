module rtlpp_07542 (
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
    end else if (ivalid) begin
      idata_d <= idata;
    end
    ivalid_d <= ivalid;
  end

  reg [2:0] phase = 3'h0;
  always @(posedge clk) begin
    if (rst) begin
      phase <= 3'b000;
    end else if (ivalid) begin
      if ((strobe != 8'b1111_1111) && (strobe != 8'b0000_0000)) begin
        casez (strobe)
          8'b1???_???? : phase <= 0;
          8'b01??_???? : phase <= 1;
          8'b001?_???? : phase <= 2;
          8'b0001_???? : phase <= 3;
          8'b0000_1??? : phase <= 4;
          8'b0000_01?? : phase <= 5;
          8'b0000_001? : phase <= 6;
          8'b0000_0001 : phase <= 7;
          default      : phase <= phase;
        endcase
      end
    end
  end

  always @(posedge clk) begin
    case (phase)
      0 : odata <= idata_d;
      1 : odata <= {idata_d[6:0], idata[7]};
      2 : odata <= {idata_d[5:0], idata[7:6]};
      3 : odata <= {idata_d[4:0], idata[7:5]};
      4 : odata <= {idata_d[3:0], idata[7:4]};
      5 : odata <= {idata_d[2:0], idata[7:3]};
      6 : odata <= {idata_d[1:0], idata[7:2]};
      7 : odata <= {idata_d[0], idata[7:1]};
    endcase
  end

  assign ovalid = ivalid_d;

endmodule