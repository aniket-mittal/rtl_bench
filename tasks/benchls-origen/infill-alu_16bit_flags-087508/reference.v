module origen_087508 #(
    parameter data_wl = 16,
    parameter op_wl = 8
)(
    input [data_wl-1:0] a_in,
    input [data_wl-1:0] b_in,
    input [op_wl-1:0] op_in,
    input z_flag_in,
    input s_flag_in,
    input c_flag_in,
    input ovr_flag_in,
    output reg [data_wl-1:0] c_out,
    output reg z_flag_out,
    output reg s_flag_out,
    output reg c_flag_out,
    output reg ovr_flag_out,
    output reg op_active
);

reg [data_wl:0] c_reg;

always @(*) begin
    c_reg = 0;
    op_active = 1'b1;

    case(op_in)
        8'h40: c_reg = a_in & b_in;                    // AND
        8'h41: c_reg = a_in | b_in;                    // OR
        8'h42: c_reg = a_in ^ b_in;                    // XOR
        8'h43: c_reg = ~(a_in | b_in);                 // NOR
        8'h44: c_reg = ~(a_in & b_in);                 // NAND
        8'h45: c_reg = ~(a_in ^ b_in);                 // XNOR
        8'h46: c_reg = a_in;                           // A
        8'h47: c_reg = b_in;                           // B
        8'h48: c_reg = ~a_in;                          // NOT A
        8'h49: c_reg = ~b_in;                          // NOT B
        8'h4A: c_reg = a_in & (~b_in);                 // A AND NOT B
        8'h4B: c_reg = (~a_in) & b_in;                 // NOT A AND B
        8'h4C: c_reg = a_in | (~b_in);                 // A OR NOT B
        8'h4D: c_reg = (~a_in) | b_in;                 // NOT A OR B
        8'h4E: c_reg = (a_in & b_in) | (~a_in & ~b_in); // A EQUALS B
        8'h4F: c_reg = (a_in & ~b_in) | (~a_in & b_in); // A NOT EQUALS B
        default: op_active = 1'b0;
    endcase

    c_out = c_reg[data_wl-1:0];
    z_flag_out = (c_out == 0);
    s_flag_out = c_out[data_wl-1];
    c_flag_out = c_flag_in;
    ovr_flag_out = ovr_flag_in;
end

endmodule