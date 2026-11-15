module serv_compdec
  (
   input wire i_clk,
   input  wire [31:0] i_instr,
   input  wire i_ack,
   output wire [31:0] o_instr,
   output reg o_iscomp);

  localparam OPCODE_LOAD     = 7'h03;
  localparam OPCODE_OP_IMM   = 7'h13;
  localparam OPCODE_STORE    = 7'h23;
  localparam OPCODE_OP       = 7'h33;
  localparam OPCODE_LUI      = 7'h37;
  localparam OPCODE_BRANCH   = 7'h63;
  localparam OPCODE_JALR     = 7'h67;
  localparam OPCODE_JAL      = 7'h6f;

  reg  [31:0] comp_instr;
  reg  illegal_instr;

  assign o_instr = illegal_instr ? i_instr : comp_instr;

  always @(posedge i_clk) begin
    if(i_ack)
      o_iscomp <= !illegal_instr;
  end

  [MASKED]

  endmodule