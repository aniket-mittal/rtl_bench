module origen_093801 (
    input wire iClk,
    input wire iClrn,
    input wire iValid,
    input wire iCheck,
    input wire iPSync,
    input wire [7:0] iData,
    output reg [7:0] oData,
    output reg oValid,
    output reg oCheck,
    output reg oPSync
);

    parameter [14:0] INITIALBITS = 15'h7FFF;

    reg [14:0] prbs;
    reg [2:0] packCnt;
    wire prbsbit;

    assign prbsbit = prbs[14] ^ prbs[13];

    [MASKED]

endmodule