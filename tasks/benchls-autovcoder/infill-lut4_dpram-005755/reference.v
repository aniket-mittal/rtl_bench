module autovcoder_005755 (
    lut4_o,
    lut00_n,
    mc1_ripmode,
    I0,
    I1,
    I2,
    I3,
    dpram_mode,
    dpram_di,
    dpram_we,
    dpram_wclk,
    dpram_waddr
);
  output lut4_o;
  output lut00_n;
  input mc1_ripmode;
  input I0, I1, I2, I3;
  parameter INIT = 16'h0000;

  //dpram interface
  input dpram_mode;
  input dpram_di, dpram_we, dpram_wclk;
  input [3:0] dpram_waddr;

  reg [15:0] value_lut4;
  reg lut4_o;
  reg lut00, lut01, lut10, lut11;
  initial begin
    value_lut4 = INIT;
  end

  wire dpram_weclk = dpram_mode & dpram_wclk;
  always @(posedge dpram_weclk) begin
    if (dpram_we) begin
      value_lut4[dpram_waddr] = dpram_di;
    end
  end

  always @(I1 or I0 or value_lut4[3:0]) begin
    case ({
      I1, I0
    })
      2'b00: lut00 = value_lut4[0];
      2'b01: lut00 = value_lut4[1];
      2'b10: lut00 = value_lut4[2];
      2'b11: lut00 = value_lut4[3];
    endcase
  end
  always @(I1 or I0 or value_lut4[7:4]) begin
    case ({
      I1, I0
    })
      2'b00: lut01 = value_lut4[4];
      2'b01: lut01 = value_lut4[5];
      2'b10: lut01 = value_lut4[6];
      2'b11: lut01 = value_lut4[7];
    endcase
  end
  always @(I1 or I0 or value_lut4[11:8]) begin
    case ({
      I1, I0
    })
      2'b00: lut10 = value_lut4[8];
      2'b01: lut10 = value_lut4[9];
      2'b10: lut10 = value_lut4[10];
      2'b11: lut10 = value_lut4[11];
    endcase
  end
  always @(I1 or I0 or value_lut4[15:12]) begin
    case ({
      I1, I0
    })
      2'b00: lut11 = value_lut4[12];
      2'b01: lut11 = value_lut4[13];
      2'b10: lut11 = value_lut4[14];
      2'b11: lut11 = value_lut4[15];
    endcase
  end
  always @(lut00 or lut01 or lut10 or lut11 or I3 or I2) begin
    case ({
      I3, I2
    })
      2'b00: lut4_o = lut00;
      2'b01: lut4_o = lut01;
      2'b10: lut4_o = lut10;
      2'b11: lut4_o = lut11;
    endcase
  end

  nand (lut00_n, mc1_ripmode, lut00);



endmodule

