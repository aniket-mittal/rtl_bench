module origen_126912(
    input wire [31:0] A,
    input wire [31:0] B,
    input wire reset,
    output reg [31:0] C
);

    wire [32:0] carry;
    assign carry[0] = 1'b0;

    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : full_adder
            wire sum;
            assign sum = A[i] ^ B[i] ^ carry[i];
            assign carry[i+1] = (A[i] & B[i]) | (A[i] & carry[i]) | (B[i] & carry[i]);
            
            always @(*) begin
                if (reset)
                    C[i] <= 1'b0;
                else
                    C[i] <= sum;
            end
        end
    endgenerate

endmodule

