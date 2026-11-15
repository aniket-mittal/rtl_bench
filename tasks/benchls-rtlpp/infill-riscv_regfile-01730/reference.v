module rtlpp_01730 (
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

  reg [31:0] regfile [0:31];

  always @(posedge clk or posedge rst) begin
    if(rst) begin
      regfile[0]  <= 32'b0;
      regfile[1]  <= 32'b0;
      regfile[2]  <= 32'b0;
      regfile[3]  <= 32'b0;
      regfile[4]  <= 32'b0;
      regfile[5]  <= 32'b0;
      regfile[6]  <= 32'b0;
      regfile[7]  <= 32'b0;
      regfile[8]  <= 32'b0;
      regfile[9]  <= 32'b0;
      regfile[10] <= 32'b0;
      regfile[11] <= 32'b0;
      regfile[12] <= 32'b0;
      regfile[13] <= 32'b0;
      regfile[14] <= 32'b0;
      regfile[15] <= 32'b0;
      regfile[16] <= 32'b0;
      regfile[17] <= 32'b0;
      regfile[18] <= 32'b0;
      regfile[19] <= 32'b0;
      regfile[20] <= 32'b0;
      regfile[21] <= 32'b0;
      regfile[22] <= 32'b0;
      regfile[23] <= 32'b0;
      regfile[24] <= 32'b0;
      regfile[25] <= 32'b0;
      regfile[26] <= 32'b0;
      regfile[27] <= 32'b0;
      regfile[28] <= 32'b0;
      regfile[29] <= 32'b0;
      regfile[30] <= 32'b0;
      regfile[31] <= 32'b0;
    end else begin
      if(RegWrite && Wt_addr != 5'b00000) begin
        regfile[Wt_addr] <= Wt_data;
      end
    end
  end

  assign Rs1_data = regfile[Rs1_addr];
  assign Rs2_data = regfile[Rs2_addr];
  assign x0  = regfile[0];
  assign ra  = regfile[1];
  assign sp  = regfile[2];
  assign gp  = regfile[3];
  assign tp  = regfile[4];
  assign t0  = regfile[5];
  assign t1  = regfile[6];
  assign t2  = regfile[7];
  assign s0  = regfile[8];
  assign s1  = regfile[9];
  assign a0  = regfile[10];
  assign a1  = regfile[11];
  assign a2  = regfile[12];
  assign a3  = regfile[13];
  assign a4  = regfile[14];
  assign a5  = regfile[15];
  assign a6  = regfile[16];
  assign a7  = regfile[17];
  assign s2  = regfile[18];
  assign s3  = regfile[19];
  assign s4  = regfile[20];
  assign s5  = regfile[21];
  assign s6  = regfile[22];
  assign s7  = regfile[23];
  assign s8  = regfile[24];
  assign s9  = regfile[25];
  assign s10 = regfile[26];
  assign s11 = regfile[27];
  assign t3  = regfile[28];
  assign t4  = regfile[29];
  assign t5  = regfile[30];
  assign t6  = regfile[31];

endmodule