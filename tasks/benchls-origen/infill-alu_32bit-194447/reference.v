module origen_194447 (
    input [31:0] opA,
    input [31:0] opB,
    input [2:0] sel,
    output reg [31:0] res,
    output reg z,
    output reg c,
    output reg v
);

always @(sel, opA, opB) begin
    case (sel)
        3'b000: begin // Addition
            {c, res} = opA + opB;
            z = (res == 32'b0);
            v = (~(opA[31] ^ opB[31]) & (opA[31] ^ res[31]));
        end
        3'b001: begin // Subtraction
            {c, res} = opA - opB;
            z = (res == 32'b0);
            v = ((opA[31] ^ opB[31]) & (opA[31] ^ res[31]));
        end
        3'b010: begin // Bitwise AND
            res = opA & opB;
            z = (res == 32'b0);
            c = 1'b0;
            v = 1'b0;
        end
        3'b011: begin // Bitwise OR
            res = opA | opB;
            z = (res == 32'b0);
            c = 1'b0;
            v = 1'b0;
        end
        3'b100: begin // Bitwise NOT
            res = ~opA;
            z = (res == 32'b0);
            c = 1'b0;
            v = 1'b0;
        end
        default: begin
            res = 32'b0;
            z = 1'b0;
            c = 1'b0;
            v = 1'b0;
        end
    endcase
end

endmodule