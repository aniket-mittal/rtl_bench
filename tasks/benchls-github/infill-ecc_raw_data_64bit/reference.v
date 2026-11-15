module ecc_raw_data_64bit (clk,rst,c,d);
parameter REGISTER = 0;
input clk,rst;
input [71:0] c;
output [63:0] d;
reg [63:0] d;

wire [63:0] d_int;

  // pull out the pure data bits
  assign d_int = {
    c[70],c[69],c[68],c[67],c[66],c[65],c[64],c[62],
    c[61],c[60],c[59],c[58],c[57],c[56],c[55],c[54],
    c[53],c[52],c[51],c[50],c[49],c[48],c[47],c[46],
    c[45],c[44],c[43],c[42],c[41],c[40],c[39],c[38],
    c[37],c[36],c[35],c[34],c[33],c[32],c[30],c[29],
    c[28],c[27],c[26],c[25],c[24],c[23],c[22],c[21],
    c[20],c[19],c[18],c[17],c[16],c[14],c[13],c[12],
    c[11],c[10],c[9],c[8],c[6],c[5],c[4],c[2]
    };

  // conditional output register
  generate
  if (REGISTER) begin
    always @(posedge clk or posedge rst) begin
      if (rst) d <= 0;
      else d <= d_int;
    end
  end else begin
    always @(d_int) begin
      d <= d_int;
    end
  end
  endgenerate

endmodule