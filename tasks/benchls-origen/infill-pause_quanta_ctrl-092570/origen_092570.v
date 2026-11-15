module origen_092570 (
    input wire RST_N,
    input wire CLK,
    input wire TX_PAUSE_ENABLE,
    input wire [15:0] PAUSE_QUANTA,
    input wire PAUSE_QUANTA_VALID,
    input wire PAUSE_QUANTA_SUB,
    output reg PAUSE_QUANTA_COMPLETE,
    output reg PAUSE_APPLY
);

reg PauseQuantaValidDl1, PauseQuantaValidDl2;
reg [15:0] PauseQuanta;
reg [15:0] PauseQuantaCount;
reg PauseApply;

[MASKED]

endmodule