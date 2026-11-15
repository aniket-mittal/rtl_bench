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
            [MASKED]
            
            always @(*) begin
                if (reset)
                    C[i] <= 1'b0;
                else
                    C[i] <= sum;
            end
        end
    endgenerate

endmodule

module testbench;
    reg [31:0] A, B;
    reg reset;
    wire [31:0] C;

    adder_32bit uut (
        .A(A),
        .B(B),
        .reset(reset),
        .C(C)
    );

    initial begin
        reset = 1;
        #10 reset = 0;

        repeat (100) begin
            A = $random;
            B = $random;
            #10;
            if (C !== A + B) begin
                $display("Error: A=%d, B=%d, C=%d", A, B, C);
            end
        end

        $display("Test completed");
        ;
    end

endmodule