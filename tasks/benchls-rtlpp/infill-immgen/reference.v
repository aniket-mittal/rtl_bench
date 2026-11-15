module ImmGen (
  input [2:0] ImmSel,
  input [31:0] inst_field,
  output reg [31:0] Imm_out
);
  always @(*) begin
    case(ImmSel)
      // Logic to generate immediate value based on ImmSel and inst_field
      // This is just a placeholder logic. Replace it with actual logic.
      default: Imm_out = 32'h00000000;  
    endcase
  end
endmodule