module autovcoder_032768 #(
    parameter WIDTH = 2,
    parameter [WIDTH-1:0] ZERO = 2'b00,
    ONE = 2'b11,
    EDGE = 2'b10
) (
    i_clk,
    rst_n,
    toggle,
    level,
    p_STATE
);

  input i_clk;
  input rst_n;
  input level;
  output toggle;
  /////states //////
  output reg [WIDTH-1:0] p_STATE;
  reg [WIDTH-1:0] nEXT_STATE;


  ///////data register /////

  always @(negedge i_clk) begin
    if (~rst_n) begin
      p_STATE <= ZERO;
    end else begin
      p_STATE <= nEXT_STATE;
    end
  end

  /////next_state block ****///


  [MASKED]



  /////*************output block ( registered block of output) *******//

  assign toggle = (p_STATE == EDGE);
endmodule

