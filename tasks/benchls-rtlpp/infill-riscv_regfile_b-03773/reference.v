module rtlpp_03773 (
  input wire clk,
  input wire rst,
  input wire RegWrite,
  input wire [4:0] Rs1_addr,
  input wire [4:0] Rs2_addr,
  input wire [4:0] Wt_addr,
  input wire [31:0] Wt_data,
  output wire [31:0] Rs1_data,
  output wire [31:0] Rs2_data,
  output wire [31:0] x0,
  output wire [31:0] ra,
  output wire [31:0] sp,
  output wire [31:0] gp,
  output wire [31:0] tp,
  output wire [31:0] t0,
  output wire [31:0] t1,
  output wire [31:0] t2,
  output wire [31:0] s0,
  output wire [31:0] s1,
  output wire [31:0] a0,
  output wire [31:0] a1,
  output wire [31:0] a2,
  output wire [31:0] a3,
  output wire [31:0] a4,
  output wire [31:0] a5,
  output wire [31:0] a6,
  output wire [31:0] a7,
  output wire [31:0] s2,
  output wire [31:0] s3,
  output wire [31:0] s4,
  output wire [31:0] s5,
  output wire [31:0] s6,
  output wire [31:0] s7,
  output wire [31:0] s8,
  output wire [31:0] s9,
  output wire [31:0] s10,
  output wire [31:0] s11,
  output wire [31:0] t3,
  output wire [31:0] t4,
  output wire [31:0] t5,
  output wire [31:0] t6
);

  reg [31:0] reg_file [0:31];

  assign x0 = 32'b0;
  assign ra = reg_file[1];
  assign sp = reg_file[2];
  assign gp = reg_file[3];
  assign tp = reg_file[4];
  assign t0 = reg_file[5];
  assign t1 = reg_file[6];
  assign t2 = reg_file[7];
  assign s0 = reg_file[8];
  assign s1 = reg_file[9];
  assign a0 = reg_file[10];
  assign a1 = reg_file[11];
  assign a2 = reg_file[12];
  assign a3 = reg_file[13];
  assign a4 = reg_file[14];
  assign a5 = reg_file[15];
  assign a6 = reg_file[16];
  assign a7 = reg_file[17];
  assign s2 = reg_file[18];
  assign s3 = reg_file[19];
  assign s4 = reg_file[20];
  assign s5 = reg_file[21];
  assign s6 = reg_file[22];
  assign s7 = reg_file[23];
  assign s8 = reg_file[24];
  assign s9 = reg_file[25];
  assign s10 = reg_file[26];
  assign s11 = reg_file[27];
  assign t3 = reg_file[28];
  assign t4 = reg_file[29];
  assign t5 = reg_file[30];
  assign t6 = reg_file[31];

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      reg_file[0] <= 32'b0;
      reg_file[1] <= 32'b0;
      reg_file[2] <= 32'b0;
      reg_file[3] <= 32'b0;
      reg_file[4] <= 32'b0;
      reg_file[5] <= 32'b0;
      reg_file[6] <= 32'b0;
      reg_file[7] <= 32'b0;
      reg_file[8] <= 32'b0;
      reg_file[9] <= 32'b0;
      reg_file[10] <= 32'b0;
      reg_file[11] <= 32'b0;
      reg_file[12] <= 32'b0;
      reg_file[13] <= 32'b0;
      reg_file[14] <= 32'b0;
      reg_file[15] <= 32'b0;
      reg_file[16] <= 32'b0;
      reg_file[17] <= 32'b0;
      reg_file[18] <= 32'b0;
      reg_file[19] <= 32'b0;
      reg_file[20] <= 32'b0;
      reg_file[21] <= 32'b0;
      reg_file[22] <= 32'b0;
      reg_file[23] <= 32'b0;
      reg_file[24] <= 32'b0;
      reg_file[25] <= 32'b0;
      reg_file[26] <= 32'b0;
      reg_file[27] <= 32'b0;
      reg_file[28] <= 32'b0;
      reg_file[29] <= 32'b0;
      reg_file[30] <= 32'b0;
      reg_file[31] <= 32'b0;
    end else if (RegWrite) begin
      reg_file[Wt_addr] <= Wt_data;
    end
  end

  assign Rs1_data = reg_file[Rs1_addr];
  assign Rs2_data = reg_file[Rs2_addr];

endmodule