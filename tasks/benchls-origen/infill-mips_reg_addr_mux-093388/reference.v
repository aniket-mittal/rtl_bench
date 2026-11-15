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

    always @(*) begin
        if (enable) begin
            add_A = rs;
            add_B = rt;
            add_mem = 5'b0;

            casex({enable, op, funct})
                // R-type instructions
                13'b1_000000_100000: begin // ADD
                    add_A = rt;
                    add_B = rs;
                end
                13'b1_000000_100010: begin // SUB
                    add_A = rt;
                    add_B = rs;
                end
                13'b1_000000_100100: begin // AND
                    add_A = rt;
                    add_B = rs;
                end
                13'b1_000000_100101: begin // OR
                    add_A = rt;
                    add_B = rs;
                end
                13'b1_000000_101010: begin // SLT
                    add_A = rt;
                    add_B = rs;
                end
                13'b1_000000_000000: begin // SLL
                    add_A = rt;
                    add_B = 5'b0;
                end
                13'b1_000000_000010: begin // SRL
                    add_A = rt;
                    add_B = 5'b0;
                end

                // I-type instructions
                13'b1_001000_xxxxxx: begin // ADDI
                    add_A = rs;
                    add_B = 5'b0;
                end
                13'b1_001100_xxxxxx: begin // ANDI
                    add_A = rs;
                    add_B = 5'b0;
                end
                13'b1_001101_xxxxxx: begin // ORI
                    add_A = rs;
                    add_B = 5'b0;
                end
                13'b1_001010_xxxxxx: begin // SLTI
                    add_A = rs;
                    add_B = 5'b0;
                end

                // Load/Store instructions
                13'b1_100011_xxxxxx: begin // LW
                    add_A = rs;
                    add_B = 5'b0;
                    add_mem = rt;
                end
                13'b1_101011_xxxxxx: begin // SW
                    add_A = rs;
                    add_B = rt;
                    add_mem = rt;
                end

                // Branch instructions
                13'b1_000100_xxxxxx: begin // BEQ
                    add_A = rs;
                    add_B = rt;
                end
                13'b1_000101_xxxxxx: begin // BNE
                    add_A = rs;
                    add_B = rt;
                end

                // Jump instructions
                13'b1_000010_xxxxxx, // J
                13'b1_000011_xxxxxx: begin // JAL
                    add_A = 5'b0;
                    add_B = 5'b0;
                end

                default: begin
                    add_A = 5'b0;
                    add_B = 5'b0;
                    add_mem = 5'b0;
                end
            endcase
        end
        else begin
            add_A = 5'b0;
            add_B = 5'b0;
            add_mem = 5'b0;
        end
    end

endmodule