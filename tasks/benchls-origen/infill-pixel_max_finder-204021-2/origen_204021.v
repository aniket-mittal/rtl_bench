module origen_204021 (
  input clk,
  input enable,
  input [SIZE_address_pix-1:0] memstartp,
  input [SIZE_1-1:0] qp,
  output reg STOP,
  output reg [SIZE_address_pix-1:0] read_addressp,
  output reg re,
  output reg [SIZE_4-1:0] RESULT
);

parameter SIZE_1 = 8;
parameter SIZE_2 = 4;
parameter SIZE_3 = 4;
parameter SIZE_4 = 4;
parameter SIZE_address_pix = 10;

reg [SIZE_2-1:0] marker;
reg signed [SIZE_1-1:0] buff;

[MASKED]

endmodule