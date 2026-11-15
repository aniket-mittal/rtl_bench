module origen_054363 (
    input wire clk,
    input wire [4:0] readReg1, readReg2, readReg3,
    input wire [4:0] writeReg,
    input wire [31:0] writeData,
    input wire regWrite,
    input wire [4:0] readReg1f, readReg2f,
    input wire [4:0] writeRegf,
    input wire [31:0] writeData1f, writeData2f,
    input wire regWritef, regDWritef,
    output reg [31:0] dataOut1, dataOut2, dataOut3,
    output reg [31:0] dataOut1f, dataOut2f, dataOut1p1f, dataOut2p1f
);

    reg [31:0] registers_i [0:31];
    reg [31:0] registers_f [0:31];
    integer i;

    // Initialize registers
    initial begin
        for (i = 0; i < 32; i = i + 1) begin
            registers_i[i] = 32'b0;
            registers_f[i] = 32'b0;
        end
    end

    // Write operations
    always @(posedge clk) begin
        // Integer write
        if (regWrite && writeReg != 5'b0)
            registers_i[writeReg] <= writeData;

        // Floating-point single-precision write
        if (regWritef && writeRegf != 5'b0)
            registers_f[writeRegf] <= writeData1f;

        // Floating-point double-precision write
        if (regDWritef && writeRegf != 5'b0 && writeRegf != 5'b11111) begin
            registers_f[writeRegf] <= writeData1f;
            registers_f[writeRegf + 1] <= writeData2f;
        end
    end

    // Read operations
    always @(negedge clk) begin
        // Integer reads
        dataOut1 <= registers_i[readReg1];
        dataOut2 <= registers_i[readReg2];
        dataOut3 <= registers_i[readReg3];

        // Floating-point reads
        dataOut1f <= registers_f[readReg1f];
        dataOut1p1f <= registers_f[readReg1f + 1];
        dataOut2f <= registers_f[readReg2f];
        dataOut2p1f <= registers_f[readReg2f + 1];
    end

endmodule