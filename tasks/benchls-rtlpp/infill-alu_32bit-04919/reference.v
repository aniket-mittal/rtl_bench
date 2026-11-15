module rtlpp_04919(
  input clk,
  input rst,
  input [31:0] A,
  input [31:0] B,
  input [7:0] operation, 
  output reg [31:0] result,
  output reg overflow, 
  output reg zero 
);

  // Introduction of local parameters as replacements for the `include` directive
  localparam ALU_nop   = 'h00;
  localparam ALU_add   = 'h01;
  localparam ALU_addu  = 'h02;
  localparam ALU_sub   = 'h03;
  localparam ALU_subu  = 'h04;
  localparam ALU_slt   = 'h05;
  localparam ALU_sltu  = 'h06;
  localparam ALU_and   = 'h07;
  localparam ALU_or    = 'h08;
  localparam ALU_xor   = 'h09;
  localparam ALU_nor   = 'h0A;
  localparam ALU_passa = 'h0B;
  localparam ALU_passb = 'h0C;
  localparam ALU_sll   = 'h0D;
  localparam ALU_srl   = 'h0E;
  localparam ALU_sra   = 'h0F;

  
  wire signed [31:0] signedA = A;
  wire signed [31:0] signedB = B;
  wire [4:0] shamt = A[4:0];
  
  always @(*) begin
    case (operation)
      ALU_nop      : result = 32'b0;
      ALU_add      : result = A + B;
      ALU_addu     : result = A + B;
      ALU_sub      : result = A - B;
      ALU_subu     : result = A - B;
      ALU_slt      : result = ((signedA < signedB) ? 32'd1 : 31'd0); 
      ALU_sltu     : result = ((A < B) ? 32'd1 : 31'd0);
      ALU_and      : result = A & B; 
      ALU_or       : result = A | B; 
      ALU_xor      : result = A ^ B; 
      ALU_nor      : result = ~(A | B);
      ALU_passa    : result = A; 
      ALU_passb    : result = B;
      ALU_sll      : result = B << shamt; 
      ALU_srl      : result = B >> shamt; 
      ALU_sra      : result = signedB >>> shamt; 
      default      : result = 32'b0; 
    endcase
  end
  
  always @(*) begin
    zero = (result == 32'b0 ? 1'b1 : 1'b0);
  end
    
  always @(*) begin
    case (operation)
      ALU_add      : overflow = ((A[31] ~^ B[31]) & (A[31] ^ result[31]));
      ALU_sub      : overflow = ((A[31]  ^ B[31]) & (A[31] ^ result[31]));
      default      : overflow = 1'b0;
    endcase
  end
endmodule