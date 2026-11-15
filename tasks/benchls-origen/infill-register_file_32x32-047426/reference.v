module origen_047426 (
    input wire clk,
    input wire rst,
    input wire [4:0] A1,
    input wire [4:0] A2,
    input wire [4:0] RdW,
    input wire [31:0] ResultW,
    input wire RegWriteW,
    output wire [31:0] RD1,
    output wire [31:0] RD2,
    output wire [31:0] checkx1,
    output wire [31:0] checkx2,
    output wire [31:0] checkx3,
    output wire [31:0] checkx4,
    output wire [31:0] checkx5,
    output wire [31:0] checkx6
);

    reg [31:0] registers [31:0];
    integer i;

    // Asynchronous read
    assign RD1 = registers[A1];
    assign RD2 = registers[A2];

    // Register checking outputs
    assign checkx1 = registers[1];
    assign checkx2 = registers[2];
    assign checkx3 = registers[3];
    assign checkx4 = registers[19];
    assign checkx5 = registers[5];
    assign checkx6 = registers[6];

    // Synchronous write and reset
    always @(negedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < 32; i = i + 1) begin
                if (i == 28)
                    registers[i] <= 32'd6;
                else if (i == 22)
                    registers[i] <= 32'd4;
                else if (i == 18)
                    registers[i] <= 32'd6;
                else
                    registers[i] <= 32'd0;
            end
        end
        else if (RegWriteW && RdW != 5'd0) begin
            registers[RdW] <= ResultW;
        end
    end

endmodule