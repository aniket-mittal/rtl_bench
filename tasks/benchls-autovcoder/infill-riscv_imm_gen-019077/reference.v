module autovcoder_019077 (
    ImmGen_instruction,
    ImmGen_imm
);
  input [31:0] ImmGen_instruction;
  output [31:0] ImmGen_imm;
  reg [31:0] ImmGen_imm;

  always @(*) begin
    case (ImmGen_instruction[6:0])
      7'b0010011: begin  // ADDI, SLTI, XORI, ORI, ANDI, SLLI, SRLI, SRAI, 
        case (ImmGen_instruction[14:12])
          3'b001:  ImmGen_imm = {26'd0, ImmGen_instruction[24:20]};  // SLLI
          3'b101:  ImmGen_imm = {26'd0, ImmGen_instruction[24:20]};  // SRLI, SRAI
          default: ImmGen_imm = {{{20{ImmGen_instruction[31]}}}, ImmGen_instruction[31:20]};
        endcase
      end
      7'b0100011: begin  // SW
        ImmGen_imm = {
          {20{ImmGen_instruction[31]}}, ImmGen_instruction[31:25], ImmGen_instruction[11:7]
        };
      end
      7'b0000011: begin  // LW
        ImmGen_imm = {{20{ImmGen_instruction[31]}}, ImmGen_instruction[31:20]};
      end
      7'b1100011: begin  // B-type
        ImmGen_imm = {
          {20{ImmGen_instruction[31]}},
          ImmGen_instruction[7],
          ImmGen_instruction[30:25],
          ImmGen_instruction[11:8],
          1'b0
        };
      end
      7'b1100111: begin  // JALR
        ImmGen_imm = {{20{ImmGen_instruction[31]}}, ImmGen_instruction[31:20]};
      end
      7'b1101111: begin  // JAL
        ImmGen_imm = {
          {12{ImmGen_instruction[31]}},
          ImmGen_instruction[19:12],
          ImmGen_instruction[20],
          ImmGen_instruction[30:21],
          1'b0
        };
      end
      default: ImmGen_imm = 32'd0;
    endcase
  end
endmodule

