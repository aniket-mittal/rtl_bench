module origen_024596(
    input [31:0] in1,
    input [31:0] in2,
    input [4:0] shamt,
    input [3:0] op,
    output reg [31:0] result,
    output zero
);

    always @(*) begin
        case(op)
            4'b0000: result = in1 & in2;
            4'b0001: result = in1 | in2;
            4'b0010: result = in1 + in2;
            4'b0110: result = in1 - in2;
            4'b0111: result = (in1 < in2) ? 32'd1 : 32'd0;
            4'b1000: result = in1 << shamt;
            4'b1001: result = in1 >> shamt;
            default: result = 32'bx;
        endcase
    end

    assign zero = (result == 32'd0);

endmodule

module ALUControl(
    input [5:0] func,
    input [1:0] op,
    output reg [3:0] out
);

    always @(*) begin
        case(op)
            2'b00: out = 4'b0010;
            2'b01: out = 4'b0110;
            2'b10: begin
                case(func)
                    6'b100000: out = 4'b0010;
                    6'b100010: out = 4'b0110;
                    6'b100100: out = 4'b0000;
                    6'b100101: out = 4'b0001;
                    6'b101010: out = 4'b0111;
                    6'b000000: out = 4'b1000;
                    6'b000010: out = 4'b1001;
                    default: out = 4'bzzzz;
                endcase
            end
            default: out = 4'bzzzz;
        endcase
    end

endmodule