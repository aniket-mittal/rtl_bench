module autovcoder_075202 #(
    parameter W = 8,
    CBIT = 4  // CBIT=log2(W)+1
) (
    input wire clk,
    reset,
    input wire start,
    input wire [W-1:0] dvsr,
    dvnd,
    output wire ready,
    done_tick,
    output wire [W-1:0] quo,
    rmd
);

  // symbolic state declaration
  localparam [1:0] idle = 2'b00, op = 2'b01, last = 2'b10, done = 2'b11;

  // signal declaration
  reg [1:0] state_reg;
  reg [W-1:0] rh_reg, rl_reg, rh_tmp, d_reg;
  reg [CBIT-1:0] n_reg, n_next;
  reg q_bit;

  // fsmd registers and next-state logic
  [MASKED]

  // output
  assign quo = rl_reg;
  assign rmd = rh_reg;
  // unregistered output
  assign ready = (state_reg == idle);
  assign done_tick = (state_reg == done);

endmodule

