module origen_050370 (
    input wire ClkEngress,
    input wire ARst,
    input wire [31:0] WriteData,
    input wire WriteDataValid,
    output reg [7:0] Data,
    output reg DataValid,
    output reg Ready
);

    reg [1:0] byteNum;
    reg [31:0] writeDataSave;

    [MASKED]

endmodule