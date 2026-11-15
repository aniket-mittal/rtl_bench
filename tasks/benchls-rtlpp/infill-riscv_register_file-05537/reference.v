module rtlpp_05537 (
  input wire clk,
  input wire rst,
  input wire RegWrite,
  input wire [4:0] Rs1_addr,
  input wire [4:0] Rs2_addr,
  input wire [4:0] Wt_addr,
  input wire [31:0] Wt_data,
  output reg [31:0] Rs1_data,
  output reg [31:0] Rs2_data,
  output reg [31:0] x0,
  output reg [31:0] ra,
  output reg [31:0] sp,
  output reg [31:0] gp,
  output reg [31:0] tp,
  output reg [31:0] t0,
  output reg [31:0] t1,
  output reg [31:0] t2,
  output reg [31:0] s0,
  output reg [31:0] s1,
  output reg [31:0] a0,
  output reg [31:0] a1,
  output reg [31:0] a2,
  output reg [31:0] a3,
  output reg [31:0] a4,
  output reg [31:0] a5,
  output reg [31:0] a6,
  output reg [31:0] a7,
  output reg [31:0] s2,
  output reg [31:0] s3,
  output reg [31:0] s4,
  output reg [31:0] s5,
  output reg [31:0] s6,
  output reg [31:0] s7,
  output reg [31:0] s8,
  output reg [31:0] s9,
  output reg [31:0] s10,
  output reg [31:0] s11,
  output reg [31:0] t3,
  output reg [31:0] t4,
  output reg [31:0] t5,
  output reg [31:0] t6
);

  reg [31:0] registers [31:0];  // defining the register file
  
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      registers[0]  <= 32'b0; // synthesize x0 as zero register
      registers[1]  <= 32'b0;
      registers[2]  <= 32'b0;
      registers[3]  <= 32'b0;
      registers[4]  <= 32'b0;
      registers[5]  <= 32'b0;
      registers[6]  <= 32'b0;
      registers[7]  <= 32'b0;
      registers[8]  <= 32'b0;
      registers[9]  <= 32'b0;
      registers[10] <= 32'b0;
      registers[11] <= 32'b0;
      registers[12] <= 32'b0;
      registers[13] <= 32'b0;
      registers[14] <= 32'b0;
      registers[15] <= 32'b0;
      registers[16] <= 32'b0;
      registers[17] <= 32'b0;
      registers[18] <= 32'b0;
      registers[19] <= 32'b0;
      registers[20] <= 32'b0;
      registers[21] <= 32'b0;
      registers[22] <= 32'b0;
      registers[23] <= 32'b0;
      registers[24] <= 32'b0;
      registers[25] <= 32'b0;
      registers[26] <= 32'b0;
      registers[27] <= 32'b0;
      registers[28] <= 32'b0;
      registers[29] <= 32'b0;
      registers[30] <= 32'b0;
      registers[31] <= 32'b0;
    end else if (RegWrite && Wt_addr != 5'b0) begin
      registers[Wt_addr] <= Wt_data;
    end
  end

  always @(*) begin
    Rs1_data = (Rs1_addr == 5'b0) ? 32'b0 : registers[Rs1_addr];
    Rs2_data = (Rs2_addr == 5'b0) ? 32'b0 : registers[Rs2_addr];
    x0 = registers[0];
    ra = registers[1];
    sp = registers[2];
    gp = registers[3];
    tp = registers[4];
    t0 = registers[5];
    t1 = registers[6];
    t2 = registers[7];
    s0 = registers[8];
    s1 = registers[9];
    a0 = registers[10];
    a1 = registers[11];
    a2 = registers[12];
    a3 = registers[13];
    a4 = registers[14];
    a5 = registers[15];
    a6 = registers[16];
    a7 = registers[17];
    s2 = registers[18];
    s3 = registers[19];
    s4 = registers[20];
    s5 = registers[21];
    s6 = registers[22];
    s7 = registers[23];
    s8 = registers[24];
    s9 = registers[25];
    s10 = registers[26];
    s11 = registers[27];
    t3 = registers[28];
    t4 = registers[29];
    t5 = registers[30];
    t6 = registers[31];
  end
endmodule