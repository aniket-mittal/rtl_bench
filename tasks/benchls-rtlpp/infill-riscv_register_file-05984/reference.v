module rtlpp_05984 (
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

reg [31 : 0] regs [0 : 31];

always @(posedge clk or posedge rst) begin
  if (rst) begin
    regs[0]  <= 32'b0;
    regs[1]  <= 32'b0;
    regs[2]  <= 32'b0;
    regs[3]  <= 32'b0;
    regs[4]  <= 32'b0;
    regs[5]  <= 32'b0;
    regs[6]  <= 32'b0;
    regs[7]  <= 32'b0;
    regs[8]  <= 32'b0;
    regs[9]  <= 32'b0;
    regs[10] <= 32'b0;
    regs[11] <= 32'b0;
    regs[12] <= 32'b0;
    regs[13] <= 32'b0;
    regs[14] <= 32'b0;
    regs[15] <= 32'b0;
    regs[16] <= 32'b0;
    regs[17] <= 32'b0;
    regs[18] <= 32'b0;
    regs[19] <= 32'b0;
    regs[20] <= 32'b0;
    regs[21] <= 32'b0;
    regs[22] <= 32'b0;
    regs[23] <= 32'b0;
    regs[24] <= 32'b0;
    regs[25] <= 32'b0;
    regs[26] <= 32'b0;
    regs[27] <= 32'b0;
    regs[28] <= 32'b0;
    regs[29] <= 32'b0;
    regs[30] <= 32'b0;
    regs[31] <= 32'b0;
  end
  else begin
    if (RegWrite) begin
      regs[Wt_addr] <= Wt_data;
    end
  end
end

always @(*) begin
  Rs1_data = regs[Rs1_addr];
  Rs2_data = regs[Rs2_addr];
end

always @(*) begin
  x0  = regs[0];
  ra  = regs[1];
  sp  = regs[2];
  gp  = regs[3];
  tp  = regs[4];
  t0  = regs[5];
  t1  = regs[6];
  t2  = regs[7];
  s0  = regs[8];
  s1  = regs[9];
  a0  = regs[10];
  a1  = regs[11];
  a2  = regs[12];
  a3  = regs[13];
  a4  = regs[14];
  a5  = regs[15];
  a6  = regs[16];
  a7  = regs[17];
  s2  = regs[18];
  s3  = regs[19];
  s4  = regs[20];
  s5  = regs[21];
  s6  = regs[22];
  s7  = regs[23];
  s8  = regs[24];
  s9  = regs[25];
  s10 = regs[26];
  s11 = regs[27];
  t3  = regs[28];
  t4  = regs[29];
  t5  = regs[30];
  t6  = regs[31];
end

endmodule