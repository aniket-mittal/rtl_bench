module origen_061184(SW, KEY, LEDG, LEDR);
    input [17:0] SW;
    input [3:0] KEY;
    output [8:0] LEDG;
    output [17:0] LEDR;

    reg [7:0] A, B, S;
    reg overflow;
    wire [7:0] sum;
    wire [8:1] carry;

    always @(negedge KEY[1] or negedge KEY[0]) begin
        if (!KEY[0]) begin
            A <= 8'b0;
            B <= 8'b0;
            S <= 8'b0;
            overflow <= 1'b0;
        end else begin
            A <= SW[15:8];
            B <= SW[7:0];
            S <= sum;
            overflow <= carry[7] ^ carry[6];
        end
    end

    fulladder_8bit fa8(.A(A), .B(B ^ {8{SW[16]}}), .ci(SW[16]), .S(sum), .CO(carry));

    assign LEDR[15:8] = A;
    assign LEDR[7:0] = B;
    assign LEDG[7:0] = S;
    assign LEDG[8] = overflow;

endmodule

module fulladder_8bit(A, B, ci, S, CO);
    input [7:0] A, B;
    input ci;
    output [7:0] S;
    output [8:1] CO;

    fulladder fa0(.a(A[0]), .b(B[0]), .ci(ci), .s(S[0]), .co(CO[1]));
    fulladder fa1(.a(A[1]), .b(B[1]), .ci(CO[1]), .s(S[1]), .co(CO[2]));
    fulladder fa2(.a(A[2]), .b(B[2]), .ci(CO[2]), .s(S[2]), .co(CO[3]));
    fulladder fa3(.a(A[3]), .b(B[3]), .ci(CO[3]), .s(S[3]), .co(CO[4]));
    fulladder fa4(.a(A[4]), .b(B[4]), .ci(CO[4]), .s(S[4]), .co(CO[5]));
    fulladder fa5(.a(A[5]), .b(B[5]), .ci(CO[5]), .s(S[5]), .co(CO[6]));
    fulladder fa6(.a(A[6]), .b(B[6]), .ci(CO[6]), .s(S[6]), .co(CO[7]));
    fulladder fa7(.a(A[7]), .b(B[7]), .ci(CO[7]), .s(S[7]), .co(CO[8]));

endmodule

module fulladder(a, b, ci, s, co);
    input a, b, ci;
    output s, co;

    assign s = a ^ b ^ ci;
    assign co = (a & b) | (b & ci) | (a & ci);

endmodule