module mg_10449(input wire clk,input wire reset_n,input wire [5 : 0] opcode,input wire [31 : 0] src0_data,input wire [31 : 0] src1_data,output wire [31 : 0] dst_data,output wire eq_data);
localparam OPCODE_AND = 6'h04; 
  localparam OPCODE_OR = 6'h05; 
  localparam OPCODE_XOR = 6'h06; 
  localparam OPCODE_NOT = 6'h07; 
  localparam OPCODE_ADD = 6'h08; 
  localparam OPCODE_ADDI = 6'h09; 
  localparam OPCODE_SUB = 6'h0a; 
  localparam OPCODE_SUBI = 6'h0b; 
  localparam OPCODE_MUL = 6'h0c; 
  localparam OPCODE_MULI = 6'h0d; 
  localparam OPCODE_ASL = 6'h10; 
  localparam OPCODE_ROL = 6'h11; 
  localparam OPCODE_ASR = 6'h12; 
  localparam OPCODE_ROR = 6'h13; 
  localparam OPCODE_CMP = 6'h30; 
  localparam OPCODE_CMPI = 6'h31; 
  reg [31 : 0] tmp_dst_data; 
  reg tmp_eq_data; 
  wire [4 : 0] shamt; 
  assign dst_data = tmp_dst_data; 
  assign eq_data = tmp_eq_data; 
  assign shamt = src1_data[4 : 0]; 
  always @* 
  begin : alu 
  tmp_dst_data = 32'h0; 
  tmp_eq_data = 0; 
  case (opcode) 
  OPCODE_AND: 
  tmp_dst_data = src0_data & src1_data; 
  OPCODE_OR: 
  tmp_dst_data = src0_data | src1_data; 
  OPCODE_XOR: 
  tmp_dst_data = src0_data ^ src1_data; 
  OPCODE_NOT: 
  tmp_dst_data = ~src0_data; 
  OPCODE_ADD, OPCODE_ADDI: 
  tmp_dst_data = src0_data + src1_data; 
  OPCODE_SUB, OPCODE_SUBI: 
  tmp_dst_data = src0_data - src1_data; 
  OPCODE_MUL: 
  tmp_dst_data = src0_data * src1_data; 
  OPCODE_ASL: 
  tmp_dst_data = src0_data <<< shamt; 
  OPCODE_ROL: 
  tmp_dst_data = {(src0_data <<< shamt), 
  (src0_data >>> (32 - shamt))}; 
  OPCODE_ASR: 
  tmp_dst_data = src0_data >>> shamt; 
  OPCODE_ROR: 
  tmp_dst_data = {(src0_data >>> shamt), 
  (src0_data <<< (32 - shamt))}; 
  OPCODE_CMP, OPCODE_CMPI: 
  tmp_eq_data = src0_data == src1_data; 
  default: 
  begin 
  end 
  endcase 
  end 
 endmodule