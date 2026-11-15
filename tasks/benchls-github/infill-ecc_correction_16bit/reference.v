module ecc_correction_16bit (s,e,fatal);

input [5:0] s;
output [15:0] e;
output fatal;
wire [15:0] e;

  // decode the syndrome
  reg [63:0] d;
  wire [63:0] dw /* synthesis keep */;
  always @(s) begin
    d = 64'b0;
    d[{!s[5],s[4:0]}] = 1'b1;
  end
  assign dw = d;

  // Identify uncorrectable errors
  wire fatal = (|s[4:0]) & !s[5] /* synthesis keep */;
  assign e = {
    dw[21],dw[20],dw[19],dw[18],
    dw[17],dw[15],dw[14],dw[13],
    dw[12],dw[11],dw[10],dw[9],
    dw[7],dw[6],dw[5],dw[3]
    };


endmodule