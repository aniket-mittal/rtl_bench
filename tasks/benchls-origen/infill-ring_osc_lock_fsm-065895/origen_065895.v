module origen_065895 #(
    parameter CSCntLen = 8,
    parameter CSCntThreshL = 8'h80,
    parameter CSCntThreshH = 8'hFF,
    parameter NBSamples = 8,
    parameter samplesMin = 6,
    parameter ROSelLen = 3,
    parameter lockCntLen = 16
) (
    input wire clk,
    input wire rst,
    input wire [CSCntLen-1:0] CSCnt,
    input wire CSReq,
    output reg [ROSelLen-1:0] RO0Sel,
    output reg [ROSelLen-1:0] RO1Sel,
    output reg CSAck,
    output reg matched,
    output reg noFound,
    output reg locked
);

    reg [CSCntLen-1:0] CSCntSample;
    reg [3:0] sampleCnt;
    reg [3:0] goodSampleCnt;
    reg [ROSelLen-1:0] ROSel;
    reg [lockCntLen-1:0] lockCnt;

    localparam IDLE = 2'b00, SAMPLING = 2'b01, MATCHING = 2'b10, LOCKED = 2'b11;
    reg [1:0] state;

    [MASKED]

endmodule