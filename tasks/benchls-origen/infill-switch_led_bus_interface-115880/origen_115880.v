module origen_115880 (
    input wire clk,
    input wire reset,
    input wire pRead,
    input wire pWrite,
    input wire [1:0] addr,
    input wire [31:0] pWriteData,
    output reg [31:0] pReadData,
    input wire buttonL,
    input wire buttonR,
    input wire [15:0] switch,
    output reg [11:0] led
);

    reg [1:0] status;
    reg [15:0] switch1;
    reg [11:0] led1;

    [MASKED]

endmodule