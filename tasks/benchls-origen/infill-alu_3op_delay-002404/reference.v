// ALU Module
module origen_002404(
    input [7:0] DATA1,
    input [7:0] DATA2,
    input [2:0] SELECT,
    output reg [7:0] RESULT
);

    always @(*) begin
        case(SELECT)
            3'b000: #1 RESULT = DATA2;
            3'b001: #2 RESULT = DATA1 + DATA2;
            3'b010: #1 RESULT = DATA1 & DATA2;
            3'b011: #1 RESULT = DATA1 | DATA2;
            default: #1 RESULT = RESULT;
        endcase
    end
endmodule

// Testbench Module
