module autovcoder_035521 (
    output     o_sgl,  //output for slow clk region
    output reg o_read, //output for fast clk region

    input i_sgl,  //enable signal input

    input f_clk,
    input frst_n,

    input s_clk,
    input srst_n
);

  reg  i_sgl_reg1;
  reg  i_sgl_reg2;
  reg  i_sgl_reg3;

  reg  o_read_reg1;
  reg  o_read_reg2;
  reg  o_read_reg3;

  wire o_read_4;
  reg  o_read_5;

  always @(posedge s_clk, negedge srst_n) begin  //f_clk signal synced to s_clk
    if (~srst_n) begin
      i_sgl_reg1 <= 0;
      i_sgl_reg2 <= 0;
      i_sgl_reg3 <= 0;
    end else begin
      i_sgl_reg1 <= i_sgl;
      i_sgl_reg2 <= i_sgl_reg1;
      i_sgl_reg3 <= i_sgl_reg2;
    end
  end

  always @(posedge f_clk, negedge frst_n) begin  //s_clk signal synced to f_clk
    if (~frst_n) begin
      o_read_reg1 <= 0;
      o_read_reg2 <= 0;
      o_read_reg3 <= 0;
    end else begin
      o_read_reg1 <= o_sgl;
      o_read_reg2 <= o_read_reg1;
      o_read_reg3 <= o_read_reg2;
    end
  end

  assign o_sgl = i_sgl_reg2 & (~i_sgl_reg3);
  assign o_read_4 = o_read_reg2 & (~o_read_reg3);

  always @(posedge f_clk, negedge frst_n)
    if (~frst_n) begin
      o_read_5 <= 0;
      o_read   <= 0;
    end else begin
      o_read_5 <= o_read_4;
      o_read   <= o_read_5;
    end



endmodule

