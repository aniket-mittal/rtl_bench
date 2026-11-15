module origen_192095(
    input clk,
    input reset,
    input [15:0] ins,
    input [2:0] rd_alu,
    input [15:0] data_alu,
    output reg [15:0] r1_data,
    output reg [15:0] r2_data,
    output reg [2:0] imm_data,
    output reg [2:0] rd,
    output reg [2:0] aluop
);

    reg [15:0] registers [7:0];

    initial begin
        registers[0] = 16'h0000;
        registers[1] = 16'h0001;
        registers[2] = 16'h0002;
        registers[3] = 16'h0003;
        registers[4] = 16'h0004;
        registers[5] = 16'h0005;
        registers[6] = 16'h0006;
        registers[7] = 16'h0007;
    end

    always @(negedge clk) begin
        r1_data <= registers[ins[12:10]];
        r2_data <= registers[ins[9:7]];
        imm_data <= ins[12:10];
    end

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reset register contents
            for (int i = 0; i < 8; i++) begin
                registers[i] <= 16'h0000;
            end
        end else begin
            registers[rd_alu] <= data_alu;
        end
    end

    always @(*) begin
        rd = ins[6:4];
        case (ins[15:13])
            3'b000: aluop = {1'b0, 2'b00}; // Add
            3'b001: aluop = {1'b0, 2'b01}; // Subtract
            3'b010: aluop = {1'b1, 2'b00}; // AND
            3'b011: aluop = {1'b1, 2'b01}; // OR
            default: aluop = 3'b000;
        endcase
    end

endmodule