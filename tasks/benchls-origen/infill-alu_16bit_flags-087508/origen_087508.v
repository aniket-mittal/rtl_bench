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

[MASKED]

endmodule