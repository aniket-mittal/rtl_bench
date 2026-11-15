module origen_193384(
    input [3:0] ctrl_in,
    output reg arithmetic_negative,
    output reg [1:0] logic_ctrl,
    output reg [1:0] shift_ctrl,
    output reg comparer_signed_compare,
    output reg [2:0] comparer_compare_select,
    output reg [1:0] ALU_S_select
);

always @(*) begin
    case (ctrl_in)
        4'b0001: begin
            arithmetic_negative = 1'b1;
            logic_ctrl = 2'b00;
            shift_ctrl = 2'b00;
            comparer_signed_compare = 1'b0;
            comparer_compare_select = 3'b001;
            ALU_S_select = 2'b00;
        end
        4'b0010: begin
            arithmetic_negative = 1'b0;
            logic_ctrl = 2'b00;
            shift_ctrl = 2'b00;
            comparer_signed_compare = 1'b0;
            comparer_compare_select = 3'b001;
            ALU_S_select = 2'b01;
        end
        4'b0011: begin
            arithmetic_negative = 1'b0;
            logic_ctrl = 2'b01;
            shift_ctrl = 2'b00;
            comparer_signed_compare = 1'b0;
            comparer_compare_select = 3'b001;
            ALU_S_select = 2'b01;
        end
        4'b0100: begin
            arithmetic_negative = 1'b0;
            logic_ctrl = 2'b10;
            shift_ctrl = 2'b00;
            comparer_signed_compare = 1'b0;
            comparer_compare_select = 3'b001;
            ALU_S_select = 2'b01;
        end
        4'b0101: begin
            arithmetic_negative = 1'b0;
            logic_ctrl = 2'b11;
            shift_ctrl = 2'b00;
            comparer_signed_compare = 1'b0;
            comparer_compare_select = 3'b001;
            ALU_S_select = 2'b01;
        end
        4'b0110: begin
            arithmetic_negative = 1'b0;
            logic_ctrl = 2'b00;
            shift_ctrl = 2'b00;
            comparer_signed_compare = 1'b0;
            comparer_compare_select = 3'b001;
            ALU_S_select = 2'b10;
        end
        4'b0111: begin
            arithmetic_negative = 1'b0;
            logic_ctrl = 2'b00;
            shift_ctrl = 2'b01;
            comparer_signed_compare = 1'b0;
            comparer_compare_select = 3'b001;
            ALU_S_select = 2'b10;
        end
        4'b1000: begin
            arithmetic_negative = 1'b0;
            logic_ctrl = 2'b00;
            shift_ctrl = 2'b10;
            comparer_signed_compare = 1'b0;
            comparer_compare_select = 3'b001;
            ALU_S_select = 2'b10;
        end
        4'b1010: begin
            arithmetic_negative = 1'b0;
            logic_ctrl = 2'b00;
            shift_ctrl = 2'b00;
            comparer_signed_compare = 1'b1;
            comparer_compare_select = 3'b001;
            ALU_S_select = 2'b11;
        end
        default: begin
            arithmetic_negative = 1'b0;
            logic_ctrl = 2'b00;
            shift_ctrl = 2'b00;
            comparer_signed_compare = 1'b0;
            comparer_compare_select = 3'b001;
            ALU_S_select = 2'b00;
        end
    endcase
end

endmodule