module autovcoder_117494 (
    // {{ALTERA_ARGS_BEGIN}} DO NOT REMOVE THIS LINE!
    clk,
    reset,
    sel,
    newt,
    d,
    x
    // {{ALTERA_ARGS_END}} DO NOT REMOVE THIS LINE!
);
  // Port Declaration
  // {{ALTERA_IO_BEGIN}} DO NOT REMOVE THIS LINE!
  input clk;
  input reset;
  input [1:0] sel;
  input newt;
  input [7:0] d;
  output [7:0] x;
  // {{ALTERA_IO_END}} DO NOT REMOVE THIS LINE!

  // Wire Declaration
  reg [7:0] x, xn, xn_1, xn_2, xn_3;

  // Register element
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      xn   = 8'b00000000;
      xn_1 = 8'b00000000;
      xn_2 = 8'b00000000;
      xn_3 = 8'b00000000;
    end else if (newt) begin
      xn_3 = xn_2;
      xn_2 = xn_1;
      xn_1 = xn;
      xn   = d;
    end
  end

  // Mux element

  always @(sel or xn or xn_1 or xn_2 or xn_3)
    case (sel)
      2'b00:   x = xn;
      2'b01:   x = xn_1;
      2'b10:   x = xn_2;
      2'b11:   x = xn_3;
      default: x = 8'bXXXXXXXX;
    endcase

endmodule

