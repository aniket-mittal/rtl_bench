module origen_047072 (
    input [31:0] opA, opB,
    input [2:0] sel,
    output reg [31:0] res,
    output reg z, c, v
);

    wire [32:0] sum, diff;
    wire [31:0] and_result, or_result, not_result;

    assign sum = {1'b0, opA} + {1'b0, opB};
    assign diff = {1'b0, opA} - {1'b0, opB};
    assign and_result = opA & opB;
    assign or_result = opA | opB;
    assign not_result = ~opA;

    always @(*) begin
        case (sel)
            3'b000: begin // Addition
                res = sum[31:0];
                c = sum[32];
                v = (opA[31] == opB[31]) && (opA[31] != res[31]);
            end
            3'b001: begin // Subtraction
                res = diff[31:0];
                c = ~diff[32];
                v = (opA[31] != opB[31]) && (opA[31] != res[31]);
            end
            3'b010: begin // Bitwise AND
                res = and_result;
                c = 1'b0;
                v = 1'b0;
            end
            3'b011: begin // Bitwise OR
                res = or_result;
                c = 1'b0;
                v = 1'b0;
            end
            3'b100: begin // Bitwise NOT
                res = not_result;
                c = 1'b0;
                v = 1'b0;
            end
            default: begin
                res = 32'b0;
                c = 1'b0;
                v = 1'b0;
            end
        endcase

        z = (res == 32'b0);
    end

endmodule