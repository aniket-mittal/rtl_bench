module autovcoder_090312 #(
    parameter REVISION = 0
) (
    output reg [17:0] freq_cnt_o = 18'd0,
    output reg done_o,
    input wire rst_i,
    input wire [15:0] test_term_cnt_i,
    input wire ref_clk_i,
    input wire test_clk_i
);
  //****************************************************************************
  //  Local Parameters
  //****************************************************************************
  localparam RESET_STATE = 0;
  localparam MEASURE_STATE = 1;
  localparam HOLD_STATE = 2;
  localparam UPDATE_STATE = 3;
  localparam DONE_STATE = 4;

  //****************************************************************************
  //  Local Signals
  //****************************************************************************
  reg [17:0] testclk_cnt = 18'h00000;
  reg [15:0] refclk_cnt = 16'h0000;
  reg [3:0] testclk_div4 = 4'h1;
  wire testclk_rst;
  wire testclk_en;
  reg [5:0] hold_clk = 6'd0;
  reg [4:0] state = 5'd1;

  (* ASYNC_REG = "TRUE" *) reg tstclk_rst_dly1, tstclk_rst_dly2;
  (* ASYNC_REG = "TRUE" *) reg testclk_en_dly1, testclk_en_dly2;

  //
  // need to get testclk_rst into TESTCLK_I domain
  //
  always @(posedge test_clk_i) begin
    tstclk_rst_dly1 <= testclk_rst;
    tstclk_rst_dly2 <= tstclk_rst_dly1;
  end

  //
  // need to get testclk_en into TESTCLK_I domain
  //
  always @(posedge test_clk_i) begin
    testclk_en_dly1 <= testclk_en;
    testclk_en_dly2 <= testclk_en_dly1;
  end

  always @(posedge test_clk_i) begin
    if (tstclk_rst_dly2 == 1'b1) begin
      testclk_div4 <= 4'h1;
    end else begin
      testclk_div4 <= {testclk_div4[2:0], testclk_div4[3]};
    end
  end

  always @(posedge test_clk_i) begin
    if (tstclk_rst_dly2 == 1'b1) begin
      testclk_cnt <= 0;
    end else if (testclk_en_dly2 == 1'b1 && testclk_div4 == 4'h8) begin
      testclk_cnt <= testclk_cnt + 1;
    end
  end

  always @(posedge ref_clk_i or posedge rst_i) begin
    if (rst_i) done_o <= 1'b0;
    else done_o <= state[DONE_STATE];
  end

  always @(posedge ref_clk_i or posedge rst_i) begin
    if (rst_i) begin
      state <= 0;
      state[RESET_STATE] <= 1'b1;
    end else begin
      state <= 0;
      case (1'b1)  // synthesis parallel_case full_case
        state[RESET_STATE]: begin
          if (hold_clk == 6'h3F) state[MEASURE_STATE] <= 1'b1;
          else state[RESET_STATE] <= 1'b1;
        end
        state[MEASURE_STATE]: begin
          if (refclk_cnt == test_term_cnt_i) state[HOLD_STATE] <= 1'b1;
          else state[MEASURE_STATE] <= 1'b1;
        end
        state[HOLD_STATE]: begin
          if (hold_clk == 6'hF) state[UPDATE_STATE] <= 1'b1;
          else state[HOLD_STATE] <= 1'b1;
        end
        state[UPDATE_STATE]: begin
          freq_cnt_o <= testclk_cnt;
          state[DONE_STATE] <= 1'b1;
        end
        state[DONE_STATE]: begin
          state[DONE_STATE] <= 1'b1;
        end
      endcase
    end
  end

  assign testclk_rst = state[RESET_STATE];
  assign testclk_en  = state[MEASURE_STATE];


  always @(posedge ref_clk_i) begin
    if (state[RESET_STATE] == 1'b1 || state[HOLD_STATE] == 1'b1) hold_clk <= hold_clk + 1;
    else hold_clk <= 0;
  end

  always @(posedge ref_clk_i) begin
    if (state[MEASURE_STATE] == 1'b1) refclk_cnt <= refclk_cnt + 1;
    else refclk_cnt <= 0;
  end


endmodule

