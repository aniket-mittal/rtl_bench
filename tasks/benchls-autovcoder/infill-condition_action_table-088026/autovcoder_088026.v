module autovcoder_088026 (
    /* basic signals */
    reset,
    clock,

    /* control interface, synchronous */
    ctl_enable,
    ctl_data,
    ctl_then,
    ctl_else,
    ctl_conditions,
    ctl_actions,

    /* condition input, combinatorial */
    in_conditions,

    /* action output, combinatorial */
    out_act,
    out_actions
);

  /* public parameters */
  parameter condition_width = 4;
  parameter action_width = 4;

  /* basic signals */
  input reset, clock;

  /* control inputs, synchronous */
  input ctl_enable, ctl_data;
  input ctl_then, ctl_else;
  input ctl_conditions, ctl_actions;

  /* condition input, combinatorial */
  input [condition_width-1:0] in_conditions;

  /* action output, combinatorial */
  output out_act;
  output [action_width-1:0] out_actions;

  /* condition and action registers */
  reg [condition_width-1:0] r_then_conditions;
  reg [   action_width-1:0] r_then_actions;
  reg [condition_width-1:0] r_else_conditions;
  reg [   action_width-1:0] r_else_actions;

  /* debug flag: dump state when leaving control mode */
  reg                       do_dump;

  /* control interface implementation */
  [MASKED]

  /* combinatorial analyzer */
  wire then_act
		= (r_then_conditions != 0)
		&& ((in_conditions & r_then_conditions) == r_then_conditions);
  wire else_act
		= (r_else_conditions != 0)
		&& ((in_conditions & r_else_conditions) == r_else_conditions);
  wire out_act = then_act || else_act;
  wire [action_width-1:0] out_actions = then_act ? r_then_actions : r_else_actions;

endmodule

