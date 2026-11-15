module origen_194211(
    input           ClkEngress,
    input           ARst,
    input   [31:0]  WriteData,
    input           WriteDataValid,
    output reg [7:0] Data,
    output reg       DataValid,
    output reg       Ready
);

    reg [1:0]  byteNum;
    reg [31:0] writeDataSave;

    [MASKED]

endmodule