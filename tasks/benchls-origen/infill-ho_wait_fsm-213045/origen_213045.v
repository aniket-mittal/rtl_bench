module origen_213045(
    input wire clk,
    input wire nRST,
    input wire HO,
    input wire IM1,
    input wire IM0,
    output reg [15:0] oData,
    output reg oVal,
    output reg TEST
);

    reg [2:0] cntHO;
    reg [1:0] state;

    localparam HOHOLD = 2'b00;
    localparam WAITIM = 2'b01;
    localparam WAITHO = 2'b10;

    [MASKED]

endmodule