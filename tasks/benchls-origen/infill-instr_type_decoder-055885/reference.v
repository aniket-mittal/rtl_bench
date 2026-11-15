module origen_055885 (
    input [31:0] instruction,
    output reg [2:0] instr_type,
    output reg [3:0] data_instr_type,
    output reg [2:0] jmp_instr_type,
    output reg [2:0] mem_instr_type
);

always @(*) begin
    // Default values
    instr_type = 3'b000;
    data_instr_type = 4'b0000;
    jmp_instr_type = 3'b000;
    mem_instr_type = 3'b000;

    // Main Instruction Type decoding
    if (instruction[27] == 1'b1 && instruction[26] == 1'b0) begin
        // Jump instructions
        instr_type = 3'b11;
        if (instruction[25] == 1'b1 && instruction[24] == 1'b0)
            jmp_instr_type = 3'b01; // Type 1 jump
        else if (instruction[25] == 1'b1 && instruction[24] == 1'b1)
            jmp_instr_type = 3'b10; // Type 2 jump
    end
    else if (instruction[27] == 1'b0 && instruction[26] == 1'b1) begin
        // Memory instructions
        instr_type = 3'b10;
        if (instruction[25] == 1'b1)
            mem_instr_type = 3'b01; // Type 1 memory operation
        else if (instruction[25] == 1'b0)
            mem_instr_type = 3'b10; // Type 2 memory operation
    end
    else if (instruction[27] == 1'b0 && instruction[26] == 1'b0) begin
        // Data instructions
        instr_type = 3'b01;
        if (instruction[25] == 1'b1)
            data_instr_type = 4'b0001; // Type 1 data operation
        else if (instruction[25] == 1'b0 && instruction[4] == 1'b0)
            data_instr_type = 4'b0010; // Type 2 data operation
        else if (instruction[25] == 1'b1 && instruction[7] == 1'b0 && instruction[4] == 1'b1)
            data_instr_type = 4'b0011; // Type 3 data operation
        else if (instruction[25:24] == 2'b00 && instruction[7:4] == 4'b0110)
            data_instr_type = 4'b0100; // Type 4 data operation
    end
    else begin
        // Unknown/Invalid instruction
        instr_type = 3'b00;
    end
end

endmodule