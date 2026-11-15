module origen_161603 (
  input        clk,
  input        rstn,
  input  [7:0] io_in_data,
  input        io_in_vld,
  output reg   io_in_rdy,
  output reg [7:0] io_out_data,
  output reg       io_out_vld,
  input        io_out_rdy,
  output [4:0] io_err
);

  reg [1:0] loop_state;

  `ifdef SYNTHESIS
    `define mark_debug(x)
  `else
    `define mark_debug(x) (* mark_debug = "true" *)
  `endif

  `mark_debug(io_out_data)
  `mark_debug(loop_state)

  [MASKED]

  assign io_err = 5'b0;

endmodule