module origen_042123 (
    input wire clk,
    input wire [15:0] bus_in,
    input wire ld_reg,
    input wire [2:0] dr,
    input wire [2:0] sr1,
    input wire [2:0] sr2,
    output reg [15:0] sr1_out,
    output reg [15:0] sr2_out
);

    reg [15:0] registers [0:7];

    integer i;
    initial begin
        for (i = 0; i < 8; i = i + 1) begin
            registers[i] = 16'b0;
        end
    end

    always @(posedge clk) begin
        if (ld_reg) begin
            registers[dr] <= bus_in;
        end
    end

    always @(*) begin
        case (sr1)
            3'b000: sr1_out = registers[0];
            3'b001: sr1_out = registers[1];
            3'b010: sr1_out = registers[2];
            3'b011: sr1_out = registers[3];
            3'b100: sr1_out = registers[4];
            3'b101: sr1_out = registers[5];
            3'b110: sr1_out = registers[6];
            3'b111: sr1_out = registers[7];
            default: sr1_out = registers[0];
        endcase
    end

    always @(*) begin
        case (sr2)
            3'b000: sr2_out = registers[0];
            3'b001: sr2_out = registers[1];
            3'b010: sr2_out = registers[2];
            3'b011: sr2_out = registers[3];
            3'b100: sr2_out = registers[4];
            3'b101: sr2_out = registers[5];
            3'b110: sr2_out = registers[6];
            3'b111: sr2_out = registers[7];
            default: sr2_out = registers[0];
        endcase
    end

endmodule