module rtlpp_05982 (
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
output reg [31 : 32] gp;
output reg [31 : 32] tp;
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

reg [31:0] registers [0:31];

integer i;
always @(posedge clk or posedge rst) begin
  if (rst) begin
    for (i = 0; i < 32; i = i + 1)
      registers[i] <= 32'h0;
  end else if (RegWrite && Wt_addr != 5'b00000) begin
    registers[Wt_addr] <= Wt_data;
  end
end

always @(posedge clk) begin
  Rs1_data <= (Rs1_addr != 5'b00000) ? registers[Rs1_addr] : 32'h0;
  Rs2_data <= (Rs2_addr != 5'b00000) ? registers[Rs2_addr] : 32'h0;
end

always @(posedge clk) begin
  x0 <= registers[0];
  ra <= registers[1];
  sp <= registers[2];
  gp <= registers[3];
  tp <= registers[4];
  t0 <= registers[5];
  t1 <= registers[6];
  t2 <= registers[7];
  s0 <= registers[8];
  s1 <= registers[9];
  a0 <= registers[10];
  a1 <= registers[11];
  a2 <= registers[12];
  a3 <= registers[13];
  a4 <= registers[14];
  a5 <= registers[15];
  a6 <= registers[16];
  a7 <= registers[17];
  s2 <= registers[18];
  s3 <= registers[19];
  s4 <= registers[20];
  s5 <= registers[21];
  s6 <= registers[22];
  s7 <= registers[23];
  s8 <= registers[24];
  s9 <= registers[25];
  s10 <= registers[26];
  s11 <= registers[27];
  t3 <= registers[28];
  t4 <= registers[29];
  t5 <= registers[30];
  t6 <= registers[31];
end

endmodule