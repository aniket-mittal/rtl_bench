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

    always @(*) begin
        if (CC_MUX_selector_InBUS == 1'b0) begin
            case (CC_MUX_control_InBUS)
                6'b000000: CC_MUX_data_OutBUS = 4'b0000;
                6'b000001: CC_MUX_data_OutBUS = 4'b0001;
                6'b000010: CC_MUX_data_OutBUS = 4'b0010;
                6'b000011: CC_MUX_data_OutBUS = 4'b0011;
                6'b000100: CC_MUX_data_OutBUS = 4'b0100;
                6'b000101: CC_MUX_data_OutBUS = 4'b0101;
                6'b000110: CC_MUX_data_OutBUS = 4'b0110;
                6'b000111: CC_MUX_data_OutBUS = 4'b0111;
                6'b001000: CC_MUX_data_OutBUS = 4'b1000;
                6'b001001: CC_MUX_data_OutBUS = 4'b1001;
                6'b001010: CC_MUX_data_OutBUS = 4'b1010;
                6'b001011: CC_MUX_data_OutBUS = 4'b1011;
                default: CC_MUX_data_OutBUS = 4'b0000;
            endcase
        end
        else begin
            case (CC_MUX_registro_InBUS)
                5'b00000: CC_MUX_data_OutBUS = 4'b0000;
                5'b00001: CC_MUX_data_OutBUS = 4'b0001;
                5'b00010: CC_MUX_data_OutBUS = 4'b0010;
                5'b00011: CC_MUX_data_OutBUS = 4'b0011;
                5'b00100: CC_MUX_data_OutBUS = 4'b0100;
                5'b00101: CC_MUX_data_OutBUS = 4'b0101;
                5'b00110: CC_MUX_data_OutBUS = 4'b0110;
                5'b00111: CC_MUX_data_OutBUS = 4'b0111;
                5'b01000: CC_MUX_data_OutBUS = 4'b1000;
                5'b01001: CC_MUX_data_OutBUS = 4'b1001;
                5'b01010: CC_MUX_data_OutBUS = 4'b1010;
                5'b01011: CC_MUX_data_OutBUS = 4'b1011;
                default: CC_MUX_data_OutBUS = 4'b0000;
            endcase
        end
    end

endmodule