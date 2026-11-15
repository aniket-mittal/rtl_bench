module origen_023440 #(
    parameter DATAWIDTH_MUX_SELECTION_REG = 5,
    parameter DATAWIDTH_MUX_SELECTION_CONTROL = 6,
    parameter DATAWIDTH_BUS = 4
)(
    output reg [DATAWIDTH_BUS-1:0] CC_MUX_data_OutBUS,
    input [DATAWIDTH_MUX_SELECTION_REG-1:0] CC_MUX_registro_InBUS,
    input [DATAWIDTH_MUX_SELECTION_CONTROL-1:0] CC_MUX_control_InBUS,
    input CC_MUX_selector_InBUS
);

    [MASKED]

endmodule