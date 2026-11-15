module origen_127965 (
    input wire clk,
    input wire clk_ram,
    input wire rst,
    output reg [15:0] ALU_F,
    output reg FR_ZF,
    output reg FR_OF,
    input wire [15:0] A,
    input wire [15:0] B,
    output reg [15:0] Mem_R_Data,
    input wire [3:0] MW,
    input wire [7:0] PC
);

    reg [15:0] memory [0:255];

    always @(posedge clk_ram) begin
        Mem_R_Data <= memory[PC];
    end

    always @(posedge clk) begin
        if (rst) begin
            // Reset PC to 0
            memory[0] <= 8'h00;
        end else begin
            // Increment PC
            memory[0] <= memory[0] + 1;
        end

        if (MW[3]) begin
            // Write B to memory at address PC
            memory[PC] <= B;
        end

        // Perform ALU operation based on MW
        case (MW[2:0])
            3'b000: ALU_F <= A + B;
            3'b001: ALU_F <= A - B;
            3'b010: ALU_F <= A & B;
            3'b011: ALU_F <= A | B;
            3'b100: ALU_F <= A ^ B;
            3'b101: ALU_F <= A << B[3:0];
            3'b110: ALU_F <= A >> B[3:0];
            3'b111: ALU_F <= $signed(A) >>> B[3:0];
        endcase

        // Set Zero Flag
        FR_ZF <= (ALU_F == 16'h0000);

        // Set Overflow Flag
        case (MW[2:0])
            3'b000: FR_OF <= (A[15] == B[15]) && (A[15] != ALU_F[15]);
            3'b001: FR_OF <= (A[15] != B[15]) && (B[15] == ALU_F[15]);
            default: FR_OF <= 1'b0;
        endcase
    end

endmodule