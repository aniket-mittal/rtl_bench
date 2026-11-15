module origen_032430(
    input [3:0] A,
    input [3:0] B,
    output reg [1:0] C
);

always @(A or B) begin
    if (A[3] > B[3])
        C = 2'b10;
    else if (A[3] < B[3])
        C = 2'b11;
    else begin
        if (A > B)
            C = 2'b10;
        else if (A < B)
            C = 2'b11;
        else
            C = 2'b01;
    end
end

endmodule

