module origen_004212(
    input Load_signal,
    input [4:0] rs, rt, rd,
    input [1:0] how_many_ops,
    input [4:0] ID_EXE_rt,
    input [1:0] ID_EXE_MemRead,
    input [1:0] op1_selector, op2_selector,
    output reg PC_write,
    output reg IF_ID_write,
    output reg flush,
    output reg valid
);

    reg [4:0] OP1, OP2;

    always @(*) begin
        // Select operands based on selectors
        case(op1_selector)
            2'b00: OP1 = rs;
            2'b01: OP1 = rt;
            2'b10: OP1 = rd;
            default: OP1 = 5'b0;
        endcase

        case(op2_selector)
            2'b00: OP2 = rs;
            2'b01: OP2 = rt;
            2'b10: OP2 = rd;
            default: OP2 = 5'b0;
        endcase

        // Initialize outputs
        PC_write = 1'b1;
        IF_ID_write = 1'b1;
        flush = 1'b0;
        valid = 1'b1;

        // Check for load-use hazard
        if (Load_signal) begin
            if ((how_many_ops != 2'b00) && (ID_EXE_MemRead == 2'b10) && (ID_EXE_rt == OP1)) begin
                PC_write = 1'b0;
                IF_ID_write = 1'b0;
                flush = 1'b1;
                valid = 1'b0;
            end
            else if ((how_many_ops == 2'b10) && (ID_EXE_MemRead == 2'b10) && (ID_EXE_rt == OP2)) begin
                PC_write = 1'b0;
                IF_ID_write = 1'b0;
                flush = 1'b1;
                valid = 1'b0;
            end
        end
    end

endmodule