module dut #
(
  parameter W = 1,
  parameter B = W - 1
)
(
  input wire i_clk,
  input wire i_en,
  input wire i_init,
  input wire i_cnt7,
  input wire i_cnt_done,
  input wire i_sh_right,
  input wire [1:0] i_lsb,
  input wire [1:0] i_bytecnt,
  output wire o_sh_done,
  input wire i_op_b_sel,
  input wire i_shift_op,
  input wire [B:0] i_rs2,
  input wire [B:0] i_imm,
  output wire [B:0] o_op_b,
  output wire [B:0] o_q,
  output wire [31:0] o_dat,
  input wire i_load,
  input wire [31:0] i_dat
);

  reg [7:0] dhi;
  reg [23:0] dlo;
  wire byte_valid;
  assign byte_valid = !i_lsb[0] & !i_lsb[1] | !i_bytecnt[0] & !i_bytecnt[1] | !i_bytecnt[1] & !i_lsb[1] | !i_bytecnt[1] & !i_lsb[0] | !i_bytecnt[0] & !i_lsb[1];
  assign o_op_b = (i_op_b_sel)? i_rs2 : i_imm;
  wire shift_en;
  assign shift_en = (i_shift_op)? i_en & i_init & (i_bytecnt == 2'b00) : i_en & byte_valid;
  wire cnt_en;
  assign cnt_en = i_shift_op & (!i_init | i_cnt_done) | i_sh_right;
  wire [7:0] cnt_next;

  generate if(W == 1) begin : gen_cnt_w_eq_1
    assign cnt_next = { o_op_b, dhi[7], dhi[5:0] - 6'd1 };
  end else if(W == 4) begin : gen_cnt_w_eq_4
    assign cnt_next = { o_op_b[3:2], dhi[5:0] - 6'd4 };
  end 
  endgenerate

  wire [7:0] dat_shamt;
  assign dat_shamt = (cnt_en)? cnt_next : { o_op_b, dhi[7:W] };
  assign o_sh_done = dat_shamt[5];
  assign o_q = { W{ i_lsb == 2'd3 } } & o_dat[W+23:24] | { W{ i_lsb == 2'd2 } } & o_dat[W+15:16] | { W{ i_lsb == 2'd1 } } & o_dat[W+7:8] | { W{ i_lsb == 2'd0 } } & o_dat[W-1:0];
  assign o_dat = { dhi, dlo };

  always @(posedge i_clk) begin
    if(shift_en | cnt_en | i_load) dhi <= (i_load)? i_dat[31:24] : dat_shamt & { 2'b11, !(i_shift_op & i_cnt7 & !cnt_en), 5'b11111 }; 
    if(shift_en | i_load) dlo <= (i_load)? i_dat[23:0] : { dhi[B:0], dlo[23:W] }; 
  end


endmodule
