module origen_188545(
    input rst,
    input clk,
    input halt,
    input j, jal, jr,
    input bne, blez, beq,
    input correct_b,
    output reg [31:0] total,
    output reg [31:0] conditional,
    output reg [31:0] unconditional,
    output reg [31:0] conditional_success
);

    initial begin
        total = 0;
        conditional = 0;
        unconditional = 0;
        conditional_success = 0;
        flag = 0;
    end

    reg flag;

    [MASKED]

endmodule