`define AND 4'b0000
`define OR  4'b0001
`define ADD 4'b0010
`define ANDI 4'b0011
`define ORI 4'b0100
`define SUB 4'b0101
`define SLT 4'b0110
`define XOR 4'b0111
`define XNOR 4'b1000
`define LSL 4'b1001
`define LSR 4'b1010
`define SAT 4'b1011
`define ASR 4'b1100
`define RL 4'b1101
`define RR 4'b1110

module origen_167349(
    input [31:0] A,
    input [31:0] B,
    input [3:0] Fin,
    output [31:0] Y,
    output Cout
);

    reg [31:0] result;
    reg carry;

    always @(*) begin
        case (Fin)
            `AND: begin
                result = A & B;
                carry = 1'b0;
            end
            `OR: begin
                result = A | B;
                carry = 1'b0;
            end
            `ADD: begin
                {carry, result} = A + B;
            end
            `ANDI: begin
                result = A & ~B;
                carry = 1'b0;
            end
            `ORI: begin
                result = A | ~B;
                carry = 1'b0;
            end
            `SUB: begin
                {carry, result} = A - B;
            end
            `SLT: begin
                result = {31'b0, (A < B)};
                carry = 1'b0;
            end
            `XOR: begin
                result = A ^ B;
                carry = 1'b0;
            end
            `XNOR: begin
                result = ~(A ^ B);
                carry = 1'b0;
            end
            `LSL: begin
                result = {A[30:0], 1'b0};
                carry = 1'b0;
            end
            `LSR: begin
                result = {1'b0, A[31:1]};
                carry = 1'b0;
            end
            `SAT: begin
                {carry, result} = A + B;
                if (carry) begin
                    result = 32'hFFFFFFFF;
                end
            end
            `ASR: begin
                result = {{1{A[31]}}, A[31:1]};
                carry = 1'b0;
            end
            `RL: begin
                result = {A[30:0], A[31]};
                carry = 1'b0;
            end
            `RR: begin
                result = {A[0], A[31:1]};
                carry = 1'b0;
            end
            default: begin
                result = 32'b0;
                carry = 1'b0;
            end
        endcase
    end

    assign Y = result;
    assign Cout = carry;

endmodule