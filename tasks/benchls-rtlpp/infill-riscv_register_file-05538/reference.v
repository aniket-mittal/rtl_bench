module rtlpp_05538 (
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

  reg [31:0] registers [0:31];

  assign Rs1_data = registers[Rs1_addr];
  assign Rs2_data = registers[Rs2_addr];
  assign x0 = registers[0];
  assign ra = registers[1];
  assign sp = registers[2];
  assign gp = registers[3];
  assign tp = registers[4];
  assign t0 = registers[5];
  assign t1 = registers[6];
  assign t2 = registers[7];
  assign s0 = registers[8];
  assign s1 = registers[9];
  assign a0 = registers[10];
  assign a1 = registers[11];
  assign a2 = registers[12];
  assign a3 = registers[13];
  assign a4 = registers[14];
  assign a5 = registers[15];
  assign a6 = registers[16];
  assign a7 = registers[17];
  assign s2 = registers[18];
  assign s3 = registers[19];
  assign s4 = registers[20];
  assign s5 = registers[21];
  assign s6 = registers[22];
  assign s7 = registers[23];
  assign s8 = registers[24];
  assign s9 = registers[25];
  assign s10 = registers[26];
  assign s11 = registers[27];
  assign t3 = registers[28];
  assign t4 = registers[29];
  assign t5 = registers[30];
  assign t6 = registers[31];

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      integer i;
      for (i = 0; i < 32; i = i + 1)
        registers[i] <= 0;
    end else if (RegWrite) begin
      registers[Wt_addr] <= Wt_data;
    end
  end

endmodule