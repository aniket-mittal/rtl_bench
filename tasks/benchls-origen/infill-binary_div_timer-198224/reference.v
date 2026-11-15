module origen_198224(
  input clk,
  output [24:0] cnt,
  output reg sec1, sec2, sec4, sec8,
  output reg wss1, wss2, wss4, wss8,
  output reg ws1, ws2, ws4, ws8,
  output reg ps1, ps2, ps4, ps8,
  output reg pr1, pr2, pr4, pr8,
  output [3:0] sub_cnt,
  output [3:0] sub_cnt_m,
  output clk_d10
);

  reg [24:0] cnt_reg;
  reg [3:0] sub_cnt_reg;
  reg [3:0] sub_cnt_m_reg;
  reg clk_d10_reg;

  always @(posedge clk) begin
    cnt_reg <= cnt_reg + 1;
  end

  always @(posedge clk) begin
    sec1 <= cnt_reg[0];
    sec2 <= cnt_reg[1];
    sec4 <= cnt_reg[2];
    sec8 <= cnt_reg[3];
  end

  always @(posedge clk) begin
    wss1 <= ws1;
    wss2 <= ws2;
    wss4 <= ws4;
    wss8 <= ws8;
  end

  always @(posedge clk) begin
    if (sub_cnt_reg == 4'b1111) begin
      wss1 <= 1'b0;
      wss2 <= 1'b0;
      wss4 <= 1'b0;
      wss8 <= 1'b0;
    end
  end

  always @(posedge clk) begin
    ps1 <= cnt_reg[0];
    ps2 <= cnt_reg[1];
    ps4 <= cnt_reg[2];
    ps8 <= cnt_reg[3];
  end

  always @(posedge clk) begin
    if (sub_cnt_reg == 4'b1101) begin
      pr1 <= 1'b1;
    end else begin
      pr1 <= 1'b0;
    end

    if (sub_cnt_reg == 4'b1010) begin
      pr2 <= 1'b1;
    end else begin
      pr2 <= 1'b0;
    end

    if (sub_cnt_reg == 4'b0101) begin
      pr4 <= 1'b1;
    end else begin
      pr4 <= 1'b0;
    end

    if (sub_cnt_reg == 4'b0010) begin
      pr8 <= 1'b1;
    end else begin
      pr8 <= 1'b0;
    end
  end

  always @(posedge clk) begin
    if (sec1 != ps1 || sec2 != ps2 || sec4 != ps4 || sec8 != ps8) begin
      ws1 <= 1'b1;
      ws2 <= 1'b1;
      ws4 <= 1'b1;
      ws8 <= 1'b1;
    end else begin
      ws1 <= 1'b0;
      ws2 <= 1'b0;
      ws4 <= 1'b0;
      ws8 <= 1'b0;
    end
  end

  always @(posedge clk) begin
    sub_cnt_reg <= cnt_reg[3:0];
    sub_cnt_m_reg <= (sub_cnt_reg & {4{clk_d10_reg}}) | ({4{wss1 | wss2 | wss4 | wss8 | pr1 | pr2 | pr4 | pr8}} & ~sub_cnt_reg);
    clk_d10_reg <= ~clk_d10_reg;
  end

  assign cnt = cnt_reg;
  assign sub_cnt = sub_cnt_reg;
  assign sub_cnt_m = sub_cnt_m_reg;
  assign clk_d10 = clk_d10_reg;

endmodule