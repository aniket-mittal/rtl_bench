module rtlpp_03757 (
  clk,
  rst,
  RegWrite,
  Rs1_addr,
  Rs2_addr,
  Wt_addr,
  Wt_data,
  Rs1_data,
  Rs2_data,
  x0,
  ra,
  sp,
  gp,
  tp,
  t0,
  t1,
  t2,
  s0,
  s1,
  a0,
  a1,
  a2,
  a3,
  a4,
  a5,
  a6,
  a7,
  s2,
  s3,
  s4,
  s5,
  s6,
  s7,
  s8,
  s9,
  s10,
  s11,
  t3,
  t4,
  t5,
  t6
);

input wire clk;
input wire rst;
input wire RegWrite;
input wire [4 : 0] Rs1_addr;
input wire [4 : 0] Rs2_addr;
input wire [4 : 0] Wt_addr;
input wire [31 : 0] Wt_data;
output reg [31 : 0] Rs1_data;
output reg [31 : 0] Rs2_data;
output reg [31 : 0] x0;
output reg [31 : 0] ra;
output reg [31 : 0] sp;
output reg [31 : 0] gp;
output reg [31 : 0] tp;
output reg [31 : 0] t0;
output reg [31 : 0] t1;
output reg [31 : 0] t2;
output reg [31 : 0] s0;
output reg [31 : 0] s1;
output reg [31 : 0] a0;
output reg [31 : 0] a1;
output reg [31 : 0] a2;
output reg [31 : 0] a3;
output reg [31 : 0] a4;
output reg [31 : 0] a5;
output reg [31 : 0] a6;
output reg [31 : 0] a7;
output reg [31 : 0] s2;
output reg [31 : 0] s3;
output reg [31 : 0] s4;
output reg [31 : 0] s5;
output reg [31 : 0] s6;
output reg [31 : 0] s7;
output reg [31 : 0] s8;
output reg [31 : 0] s9;
output reg [31 : 0] s10;
output reg [31 : 0] s11;
output reg [31 : 0] t3;
output reg [31 : 0] t4;
output reg [31 : 0] t5;
output reg [31 : 0] t6;

reg [31:0] register_file [31:0];

always @(posedge clk or posedge rst) begin
  if (rst) begin
    register_file[0] <= 32'b0;
    register_file[1] <= 32'b0;
    register_file[2] <= 32'b0;
    register_file[3] <= 32'b0;
    register_file[4] <= 32'b0;
    register_file[5] <= 32'b0;
    register_file[6] <= 32'b0;
    register_file[7] <= 32'b0;
    register_file[8] <= 32'b0;
    register_file[9] <= 32'b0;
    register_file[10] <= 32'b0;
    register_file[11] <= 32'b0;
    register_file[12] <= 32'b0;
    register_file[13] <= 32'b0;
    register_file[14] <= 32'b0;
    register_file[15] <= 32'b0;
    register_file[16] <= 32'b0;
    register_file[17] <= 32'b0;
    register_file[18] <= 32'b0;
    register_file[19] <= 32'b0;
    register_file[20] <= 32'b0;
    register_file[21] <= 32'b0;
    register_file[22] <= 32'b0;
    register_file[23] <= 32'b0;
    register_file[24] <= 32'b0;
    register_file[25] <= 32'b0;
    register_file[26] <= 32'b0;
    register_file[27] <= 32'b0;
    register_file[28] <= 32'b0;
    register_file[29] <= 32'b0;
    register_file[30] <= 32'b0;
    register_file[31] <= 32'b0;
  end else begin
    if (RegWrite) begin
      register_file[Wt_addr] <= Wt_data;
    end
  end
end

always @(*) begin
  Rs1_data = register_file[Rs1_addr];
  Rs2_data = register_file[Rs2_addr];
  x0 = register_file[0];
  ra = register_file[1];
  sp = register_file[2];
  gp = register_file[3];
  tp = register_file[4];
  t0 = register_file[5];
  t1 = register_file[6];
  t2 = register_file[7];
  s0 = register_file[8];
  s1 = register_file[9];
  a0 = register_file[10];
  a1 = register_file[11];
  a2 = register_file[12];
  a3 = register_file[13];
  a4 = register_file[14];
  a5 = register_file[15];
  a6 = register_file[16];
  a7 = register_file[17];
  s2 = register_file[18];
  s3 = register_file[19];
  s4 = register_file[20];
  s5 = register_file[21];
  s6 = register_file[22];
  s7 = register_file[23];
  s8 = register_file[24];
  s9 = register_file[25];
  s10 = register_file[26];
  s11 = register_file[27];
  t3 = register_file[28];
  t4 = register_file[29];
  t5 = register_file[30];
  t6 = register_file[31];
end

endmodule