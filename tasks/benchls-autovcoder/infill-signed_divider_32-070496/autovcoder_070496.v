module autovcoder_070496 #(
    parameter DATA_WIDTH = 32
) (
    input wire reset,
    input wire clk,

    input wire op_div,
    input wire op_signed,
    input wire op_set_remainder,
    input wire op_set_quotient,

    input wire [DATA_WIDTH-1:0] in_data0,
    input wire [DATA_WIDTH-1:0] in_data1,

    output reg                   out_en,
    output wire [DATA_WIDTH-1:0] out_quotient,
    output wire [DATA_WIDTH-1:0] out_remainder,

    output reg busy
);

  // NEG
  function [DATA_WIDTH-1:0] neg;
    input [DATA_WIDTH-1:0] in_data;
    begin
      neg = ~in_data + 1;
    end
  endfunction

  // ABS
  function [DATA_WIDTH-1:0] abs;
    input [DATA_WIDTH-1:0] in_data;
    begin
      abs = in_data[DATA_WIDTH-1] ? ~in_data + 1 : in_data;
    end
  endfunction



  reg  [DATA_WIDTH-1:0] remainder;
  reg  [DATA_WIDTH-1:0] quotient;
  reg  [DATA_WIDTH-1:0] divisor;

  reg                   remainder_sign;
  reg                   quotient_sign;

  wire [DATA_WIDTH-1:0] remainder1;
  wire [DATA_WIDTH-1:0] quotient1;

  wire [  DATA_WIDTH:0] quotient2;


  reg  [           4:0] counter;
  wire [           4:0] counter_next;

  assign counter_next = counter + 1;

  [MASKED]

  assign {remainder1, quotient1} = {remainder, quotient, ~quotient2[DATA_WIDTH]};
  assign quotient2               = remainder1 - divisor;


  assign out_quotient            = quotient_sign ? neg(quotient) : quotient;
  assign out_remainder           = remainder_sign ? neg(remainder) : remainder;

endmodule

