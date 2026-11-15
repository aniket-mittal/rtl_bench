module origen_107873(
    input [63:0] A,
    input [63:0] B,
    output [63:0] mult_low
);
    reg signed [63:0] signedA, signedB;
    reg signed [127:0] signedResult;
    
    always @(*) begin
        signedA = $signed(A);
        signedB = $signed(B);
        signedResult = signedA * signedB;
    end
    
    assign mult_low = signedResult[63:0];
endmodule

module shifter(
    input [63:0] value,
    input direction,
    input [5:0] distance,
    output reg [63:0] result
);
    always @(*) begin
        if (direction == 0)
            result = value << distance;
        else
            result = value >> distance;
    end
endmodule

