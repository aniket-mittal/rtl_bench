module origen_185450(
    input Clk,
    input Enable,
    input [31:0] Address,
    input RequestAttended,
    input [31:0] Data,
    output reg [31:0] BaseAddress,
    output reg LineReadCompleted,
    output reg [255:0] Line,
    output reg [31:0] CriticalWord,
    output reg FirstDataAcquired,
    output reg AXIStartRead
);

reg [31:0] Buff [7:0];
reg [2:0] Counter;
reg [1:0] WordAddress;

[MASKED]

endmodule