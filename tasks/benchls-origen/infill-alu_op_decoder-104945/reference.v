module origen_104945 (
    input [4:0] exec,
    output reg [2:0] opALU,
    output reg operALUe,
    output reg operALUve,
    output reg operSum
);

    wire func = exec[4];
    wire [2:0] opcode = exec[3:1];

    always @(*) begin
        case (func)
            1'b0: begin
                opALU = opcode;
                case (opcode)
                    3'b000: begin
                        operALUe = 1'b1;
                        operALUve = 1'b0;
                        operSum = 1'b0;
                    end
                    3'b001: begin
                        operALUe = 1'b0;
                        operALUve = 1'b1;
                        operSum = 1'b0;
                    end
                    3'b010: begin
                        operALUe = 1'b1;
                        operALUve = 1'b1;
                        operSum = 1'b0;
                    end
                    3'b011: begin
                        operALUe = 1'b0;
                        operALUve = 1'b0;
                        operSum = 1'b1;
                    end
                    default: begin
                        operALUe = 1'b0;
                        operALUve = 1'b0;
                        operSum = 1'b0;
                    end
                endcase
            end
            1'b1: begin
                opALU = 3'b111;
                operALUe = 1'b0;
                operALUve = 1'b0;
                operSum = 1'b0;
            end
        endcase
    end

endmodule