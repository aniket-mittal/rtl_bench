module autovcoder_077085 #(
    parameter INSTR_WIDTH = 16,
    parameter JMPR_OPCODE = 4
) (
    input  wire [INSTR_WIDTH-1:0] out_data_pram_i,  //output data from the PRAM
    input  wire                   z_flag_i,         //zero flag 
    input  wire                   s_flag_i,         //sign flag
    input  wire                   c_flag_i,         //carry flag
    input  wire                   ovr_flag_i,       //overflow flag
    output wire                   mask_o            //mask bit
);

  //CONDITION MNEMONICS
  localparam [3:0]
TRUE	= 4'b0000,
LE		= 4'b0001,
C		= 4'b0010,
OVR		= 4'b0011,
NEG		= 4'b0100,
Z		= 4'b0101,
POS		= 4'b0110,
GE		= 4'b0111,
FALSE	= 4'b1000,
GT		= 4'b1001,
NC		= 4'b1010,
NOVR	= 4'b1011,
NNEG	= 4'b1100,
NZ 		= 4'b1101,
NPOS	= 4'b1110,
LT		= 4'b1111;

  reg [JMPR_OPCODE-1:0] jmpr_opcd;
  reg mask_reg;

  [MASKED]

  assign mask_o = mask_reg;

endmodule

