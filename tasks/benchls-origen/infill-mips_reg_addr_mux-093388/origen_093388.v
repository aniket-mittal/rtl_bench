module origen_093388(
    input [31:0] Ins,
    input enable,
    output reg [4:0] add_A,
    output reg [4:0] add_B,
    output reg [4:0] add_mem
);

    wire [5:0] op = Ins[31:26];
    wire [5:0] funct = Ins[5:0];
    wire [4:0] rs = Ins[25:21];
    wire [4:0] rt = Ins[20:16];
    wire [4:0] rd = Ins[15:11];

    [MASKED]

endmodule