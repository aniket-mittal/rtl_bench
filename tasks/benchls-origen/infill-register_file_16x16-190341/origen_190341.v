module origen_190341(
    input clk,
    input reset,
    input [3:0] readaddress1,
    input [3:0] readaddress2,
    input [3:0] writeaddress1,
    input [3:0] writeaddress2,
    input [15:0] writedata1,
    input [15:0] writedata2,
    input enable1,
    input enable2,
    output [15:0] readdata1,
    output [15:0] readdata2,
    output [3:0] reg15address
);

    reg [15:0] registers [0:15];

    [MASKED]

    assign readdata1 = registers[readaddress1];
    assign readdata2 = registers[readaddress2];
    assign reg15address = 4'd15;

endmodule