module origen_054778 (
    input wire clk,
    input wire regWrite,
    input wire reset,
    input wire [4:0] regA,
    input wire [4:0] regB,
    input wire [4:0] writeRegister,
    input wire [31:0] writeData,
    output wire [31:0] outA,
    output wire [31:0] outB
);

    reg [31:0] registers [0:31];
    integer i;

    // Read operation (combinational)
    assign outA = registers[regA];
    assign outB = registers[regB];

    // Write operation (sequential)
    always @(negedge clk or posedge reset) begin
        if (reset) begin
            // Initialize registers 0-7 and 24-31 to zero
            for (i = 0; i < 8; i = i + 1) begin
                registers[i] <= 32'h0;
                registers[i+24] <= 32'h0;
            end
            // Initialize registers 8-23 with specific non-zero values
            registers[8] <= 32'h00000001;
            registers[9] <= 32'h00000002;
            registers[10] <= 32'h00000004;
            registers[11] <= 32'h00000008;
            registers[12] <= 32'h00000010;
            registers[13] <= 32'h00000020;
            registers[14] <= 32'h00000040;
            registers[15] <= 32'h00000080;
            registers[16] <= 32'h00000100;
            registers[17] <= 32'h00000200;
            registers[18] <= 32'h00000400;
            registers[19] <= 32'h00000800;
            registers[20] <= 32'h00001000;
            registers[21] <= 32'h00002000;
            registers[22] <= 32'h00004000;
            registers[23] <= 32'h00008000;
        end
        else if (regWrite) begin
            registers[writeRegister] <= writeData;
        end
    end

endmodule