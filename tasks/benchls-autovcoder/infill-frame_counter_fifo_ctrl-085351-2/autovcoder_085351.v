module autovcoder_085351 (
    //Input
    input    iClk,
    input    iReset_n,
    input    iRun_MV,
    input  [4:0] iFF_full,
    input    iSum_finish,
    //Output
    output reg   oRun_sum,
    output    oRst_reg,
    output reg [4:0] oRdreq_FF,
    output reg [4:0] oWrreq_FF,
    output reg   oRd_OM,
    output reg [12:0] oAddr_OM,
    output  [12:0] oPosition,
    output reg   oOutput_ready
);

  parameter OUT_READY_VAL = 13'd4800, FULL_VAL = 7'd78;
  //=======================REGISTERS============================
  reg  [12:0] counter1;
  reg  [6:0] counter2;
  reg    en_counter2;
  reg    state;
  reg  [2:0] no_ff_full_reg;
  reg    rst_counter2;
  reg    pre_sum_finish;
  reg    en_wr_0;
  //=========================WIRES==============================
  wire   out_ready;
  wire [4:0] wr_ff;
  wire [4:0] rd_ff;
  wire [2:0] no_ff_full;
  wire   rd_cond;
  wire   pre_ff_full;
  wire   end_row;
  wire [2:0] w1;
  //============================================================
  assign out_ready = counter1 == OUT_READY_VAL;
  assign oRst_reg = oOutput_ready;
  assign pre_ff_full = counter2 == FULL_VAL;
  assign w1 = no_ff_full_reg;
  assign no_ff_full = (pre_ff_full) ? (w1 + 1'b1) : w1;
  assign rd_cond = oAddr_OM != 13'd4799;
  assign oPosition = counter1;

  assign rd_ff[0] = (no_ff_full_reg == 3'd1) ? 1'b1 : oRdreq_FF[0];
  assign rd_ff[1] = (no_ff_full_reg == 3'd2) ? 1'b1 : oRdreq_FF[1];
  assign rd_ff[2] = (no_ff_full_reg == 3'd3) ? 1'b1 : oRdreq_FF[2];
  assign rd_ff[3] = (no_ff_full_reg == 3'd4) ? 1'b1 : oRdreq_FF[3];
  assign rd_ff[4] = (no_ff_full_reg == 3'd5) ? 1'b1 : oRdreq_FF[4];

  assign wr_ff[0] = 1'b1;
  assign wr_ff[1] = (oRdreq_FF[0]) ? 1'b1 : oWrreq_FF[1];
  assign wr_ff[2] = (oRdreq_FF[1]) ? 1'b1 : oWrreq_FF[2];
  assign wr_ff[3] = (oRdreq_FF[2]) ? 1'b1 : oWrreq_FF[3];
  assign wr_ff[4] = (oRdreq_FF[3]) ? 1'b1 : oWrreq_FF[4];

  assign end_row = pre_sum_finish & ~iSum_finish;
  //============================================================
  [MASKED]

endmodule

