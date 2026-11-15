module rtlpp_02563(
  input               clk_i,
  input               rst_i,

  output reg  [3:0]   strt_o,
  input       [3:0]   done_i,

  input       [2:0]   SLWRn_i,
  input       [2:0]   PKTENDn_i,

  output reg  [1:0]   SLADDR_o,
  output reg          SLOEn_o,
  output reg          SLCSn_o,
  output reg          SLWRn_o,
  output reg          PKTENDn_o,
  output reg  [1:0]   dpoMuxSel_o
);

localparam  DP1_MUX_SEL  = 2'd0,
            DP2_MUX_SEL  = 2'd1,
            DP3_MUX_SEL  = 2'd2;

localparam  DP0_EP_ADDR  = 2'd0,
            DP1_EP_ADDR  = 2'd1,
            DP2_EP_ADDR  = 2'd2,
            DP3_EP_ADDR  = 2'd3;

reg [3:0] state_r, state_next;
localparam  IDLE        = 4'd0,
            DP0_STRT    = 4'd1,
            DP0_WT_DONE = 4'd2,
            DP1_STRT    = 4'd3,
            DP1_WT_DONE = 4'd4,
            DP2_STRT    = 4'd5,
            DP2_WT_DONE = 4'd6,
            DP3_STRT    = 4'd7,
            DP3_WT_DONE = 4'd8;

always @(posedge clk_i or posedge rst_i) begin
  if (rst_i)
    state_r <= IDLE;
  else
    state_r <= state_next;
end

always @(*) begin
  case (state_r)
    IDLE: 
      state_next = DP0_STRT;
    DP0_STRT: 
      state_next = DP0_WT_DONE;
    DP0_WT_DONE: 
      if (done_i[0])
        state_next = DP1_STRT;
      else
        state_next = DP0_WT_DONE;
    DP1_STRT: 
      state_next = DP1_WT_DONE;
    DP1_WT_DONE: 
      if (done_i[1])
        state_next = DP2_STRT;
      else
        state_next = DP1_WT_DONE;
    DP2_STRT: 
      state_next = DP2_WT_DONE;
    DP2_WT_DONE: 
      if (done_i[2])
        state_next = DP3_STRT;
      else
        state_next = DP2_WT_DONE;
    DP3_STRT: 
      state_next = DP3_WT_DONE;
    DP3_WT_DONE: 
      if (done_i[3])
        state_next = DP0_STRT;
      else
        state_next = DP3_WT_DONE;
    default:
      state_next = IDLE;
  endcase
end

[MASKED]

endmodule