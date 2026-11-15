module origen_034443 (
    input wire cond3, Jump3,
    input wire [31:0] IR2, IR3,
    output reg [1:0] stall_flush_IR2,
    output reg stall_flush_IR3,
    output reg stall_flush,
    output reg PC2_stall, PC_stall
);

    wire flush_cond;
    reg stall_cond;

    assign flush_cond = cond3 | Jump3;

    wire [4:0] opcode2, opcode3, rs2, rt2, rd3;
    assign opcode2 = IR2[31:27];
    assign opcode3 = IR3[31:27];
    assign rs2 = IR2[22:18];
    assign rt2 = IR2[17:13];
    assign rd3 = IR3[12:8];

    always @(*) begin
        // Check for data hazards
        stall_cond = 1'b0;
        if (opcode3 == 5'b00000 && // Load instruction in IR3
            ((opcode2 == 5'b00000 || opcode2 == 5'b00001) && // ALU or Load instruction in IR2
             (rs2 == rd3 || rt2 == rd3))) begin
            stall_cond = 1'b1;
        end

        // Set control signals
        if (flush_cond) begin
            stall_flush_IR2 = 2'b01; // Flush IR2
            stall_flush_IR3 = 1'b1;  // Flush IR3
            stall_flush = 1'b1;
            PC2_stall = 1'b0;
            PC_stall = 1'b0;
        end
        else if (stall_cond) begin
            stall_flush_IR2 = 2'b10; // Stall IR2
            stall_flush_IR3 = 1'b1;  // Flush IR3
            stall_flush = 1'b1;
            PC2_stall = 1'b1;
            PC_stall = 1'b1;
        end
        else begin
            stall_flush_IR2 = 2'b00; // Normal operation
            stall_flush_IR3 = 1'b0;
            stall_flush = 1'b0;
            PC2_stall = 1'b0;
            PC_stall = 1'b0;
        end
    end

endmodule