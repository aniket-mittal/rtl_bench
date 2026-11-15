module origen_201166(
    input  [31:0] a,
    input  [31:0] b,
    input  [3:0]  aluc,
    output [31:0] r,
    output        zero,
    output        carry,
    output        negative,
    output        overflow
);

    reg [31:0] result;
    reg        c, n, z, v;

    always @(*) begin
        case (aluc)
            4'b0000: begin // ALU_addu
                {c, result} = a + b;
                v = 1'b0;
            end
            4'b0001: begin // ALU_add
                {c, result} = a + b;
                v = (a[31] == b[31]) && (result[31] != a[31]);
            end
            4'b0010: begin // ALU_subu
                {c, result} = a - b;
                v = 1'b0;
            end
            4'b0011: begin // ALU_sub
                {c, result} = a - b;
                v = (a[31] != b[31]) && (result[31] != a[31]);
            end
            4'b0100: begin // ALU_and
                result = a & b;
                c = 1'b0;
                v = 1'b0;
            end
            4'b0101: begin // ALU_or
                result = a | b;
                c = 1'b0;
                v = 1'b0;
            end
            4'b0110: begin // ALU_xor
                result = a ^ b;
                c = 1'b0;
                v = 1'b0;
            end
            4'b0111: begin // ALU_nor
                result = ~(a | b);
                c = 1'b0;
                v = 1'b0;
            end
            4'b1000: begin // ALU_lui
                result = {b[15:0], 16'b0};
                c = 1'b0;
                v = 1'b0;
            end
            4'b1001: begin // ALU_slt
                result = ($signed(a) < $signed(b)) ? 32'b1 : 32'b0;
                c = 1'b0;
                v = 1'b0;
            end
            4'b1010: begin // ALU_sltu
                result = (a < b) ? 32'b1 : 32'b0;
                c = 1'b0;
                v = 1'b0;
            end
            4'b1011: begin // ALU_sra
                result = $signed(b) >>> a[4:0];
                c = 1'b0;
                v = 1'b0;
            end
            4'b1100: begin // ALU_sll
                result = b << a[4:0];
                c = 1'b0;
                v = 1'b0;
            end
            4'b1101: begin // ALU_srl
                result = b >> a[4:0];
                c = 1'b0;
                v = 1'b0;
            end
            default: begin
                result = 32'b0;
                c = 1'b0;
                v = 1'b0;
            end
        endcase

        z = (result == 32'b0);
        n = result[31];
    end

    assign r = result;
    assign carry = c;
    assign negative = n;
    assign zero = z;
    assign overflow = v;

endmodule