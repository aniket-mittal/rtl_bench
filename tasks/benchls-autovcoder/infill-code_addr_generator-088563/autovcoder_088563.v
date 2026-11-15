module autovcoder_088563 #(
    parameter DATA_BITWIDTH = 8,
    parameter CODE_BITWIDTH = 16,
    parameter ADDR_BITWIDTH = 16,

    parameter CADDR_NOP = 2'h0,
    parameter CADDR_INC = 2'h1,
    parameter CADDR_MOD = 2'h2,
    parameter CADDR_SET = 2'h3
) (
    input clk,
    input rst_n,

    input [1:0] flag_op_caddr,
    input [CODE_BITWIDTH-1:0] code,
    input [DATA_BITWIDTH-1:0] data,
    output [ADDR_BITWIDTH-1:0] code_addr,

    input  dbg_clk,
    output dbg_local_f_pn,
    output dbg_local_f_mem,
    output dbg_local_f_lh
);

  wire [11:0] _inst12;
  wire [10:0] _inst11;
  wire [ 7:0] _inst8;
  assign _inst12 = code[15:4];
  assign _inst11 = code[14:4];
  assign _inst8 = code[11:4];
  assign _f_pn = code[15];
  assign _f_mem = code[13];
  assign _f_lh = code[12];

  assign dbg_local_f_pn = _f_pn;
  assign dbg_local_f_mem = _f_mem;
  assign dbg_local_f_lh = _f_lh;


  reg [ADDR_BITWIDTH-1:0] r_code_addr = 64'h0000_0000_0000_0000;
  assign code_addr = r_code_addr;

  [MASKED]

endmodule

