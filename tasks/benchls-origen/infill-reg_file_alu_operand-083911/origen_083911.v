module origen_083911(
    input [31:0] rs, rt,
    input [4:0] shamt,
    input [21:0] immt,
    input [2:0] opcode,
    input [3:0] fcode,
    output reg [31:0] inp1, inp2
);

    reg [31:0] r [0:31];
    integer i;

    initial begin
        for (i = 0; i < 32; i = i + 1) begin
            r[i] = 32'b0;
        end
    end

    [MASKED]

endmodule