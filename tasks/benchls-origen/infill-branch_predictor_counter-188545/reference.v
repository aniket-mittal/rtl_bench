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

    always @(posedge clk) begin
        if (rst) begin
            total = 0;
            conditional = 0;
            unconditional = 0;
            conditional_success = 0;
            flag = 0;
        end
        else begin
            if (!halt) begin
                total = total + 1;
            end
            else if (halt && flag == 0) begin
                total = total + 1;
                flag = 1;
            end

            if (j || jal || jr) begin
                unconditional = unconditional + 1;
            end

            if (bne || blez || beq) begin
                conditional = conditional + 1;
                if (correct_b) begin
                    conditional_success = conditional_success + 1;
                end
            end
        end
    end

endmodule