module origen_082004 (
    input [31:0] PC,
    input reset,
    input stall,
    input stall_reg,
    output reg REIC,
    output reg REBIOS,
    output reg REISR,
    output reg [1:0] IFSel
);

    wire [3:0] pctop;
    assign pctop = PC[31:28];

    [MASKED]

endmodule