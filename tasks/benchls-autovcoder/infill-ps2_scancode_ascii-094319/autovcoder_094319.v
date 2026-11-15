module autovcoder_094319 (
    clk,
    new_in,
    in,
    out,
    new_char,
    jmpff00
);
  input clk;
  input new_in;
  input [7:0] in;

  output [8:0] out;
  output new_char;

  //Used to jump to bootloader if pause is pressed
  output reg jmpff00;

  assign out = {released, cur};

  reg real_new;
  reg [7:0] cur;
  reg released;
  reg released_sent;

  reg prev_new_in;

  assign new_char = real_new;

  [MASKED]

endmodule

