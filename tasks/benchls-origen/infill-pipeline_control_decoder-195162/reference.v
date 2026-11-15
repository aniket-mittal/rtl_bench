module origen_195162(
    input[5:0] opcode,
    output reg Jump,
    output reg[3:0] EX,
    output reg[2:0] MEM,
    output reg[1:0] WB
);

always @(*) begin
    case(opcode)
        6'b000000: begin
            EX = 4'b0101;
            MEM = 3'b000;
            WB = 2'b11;
            Jump = 1'b0;
        end
        6'b001000: begin
            EX = 4'b1000;
            MEM = 3'b000;
            WB = 2'b11;
            Jump = 1'b0;
        end
        6'b100011: begin
            EX = 4'b1000;
            MEM = 3'b010;
            WB = 2'b10;
            Jump = 1'b0;
        end
        6'b101011: begin
            EX = 4'b1000;
            MEM = 3'b001;
            WB = 2'b00;
            Jump = 1'b0;
        end
        6'b000010: begin
            EX = 4'b0000;
            MEM = 3'b100;
            WB = 2'b00;
            Jump = 1'b1;
        end
        default: begin
            EX = 4'bxxxx;
            MEM = 3'bxxx;
            WB = 2'bxx;
            Jump = 1'bx;
        end
    endcase
end

endmodule