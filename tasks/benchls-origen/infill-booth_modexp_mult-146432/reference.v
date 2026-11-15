module origen_146432(
    input [7:0] a,
    input [7:0] b,
    output [15:0] s
);

    wire [15:0] booth_result;
    wire [15:0] modexp_result;

    // Booth Multiplier
    reg [16:0] A, S, P;
    integer i;

    always @(*) begin
        A = {8'b0, a, 1'b0};
        S = {8'b0, (~a + 1'b1), 1'b0};
        P = {8'b0, b, 1'b0};

        for (i = 0; i < 8; i = i + 1) begin
            case (P[1:0])
                2'b01: P = P + A;
                2'b10: P = P + S;
                default: P = P;
            endcase
            P = P >> 1;
        end
    end

    assign booth_result = P[16:1];

    // Modular Exponentiation
    function [7:0] modexp;
        input [7:0] base;
        input [7:0] exponent;
        input [7:0] modulus;
        reg [7:0] result;
        reg [7:0] temp_base;
        integer j;
        begin
            result = 1;
            temp_base = base;
            for (j = 0; j < 8; j = j + 1) begin
                if (exponent[j]) begin
                    result = (result * temp_base) % modulus;
                end
                temp_base = (temp_base * temp_base) % modulus;
            end
            modexp = result;
        end
    endfunction

    wire [7:0] modexp_8bit;
    assign modexp_8bit = modexp(a, b, 8'd251); // Using prime modulus 251
    assign modexp_result = {8'b0, modexp_8bit};

    // Final output
    assign s = booth_result + modexp_result;

endmodule