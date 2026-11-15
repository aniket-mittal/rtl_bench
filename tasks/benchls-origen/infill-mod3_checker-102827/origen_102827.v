module origen_102827 #(
    parameter WIDTH = 32
) (
    input [WIDTH-1:0] in,
    output [1:0] out
);

    // Error check for input width
    initial begin
        if (WIDTH > 32) begin
            $error("Input width cannot exceed 32 bits");
            ;
        end
    end

    // Internal wires
    wire [1:0] m00, m01, m02, m03, m04, m05, m06, m07;
    wire [1:0] m10, m11, m12, m13;
    wire [1:0] m20, m21;

    // First level: 4-bit chunk calculations
    assign m00 = digit_mod(in[3:0]);
    assign m01 = (WIDTH > 4)  ? digit_mod(in[7:4])   : 2'b00;
    assign m02 = (WIDTH > 8)  ? digit_mod(in[11:8])  : 2'b00;
    assign m03 = (WIDTH > 12) ? digit_mod(in[15:12]) : 2'b00;
    assign m04 = (WIDTH > 16) ? digit_mod(in[19:16]) : 2'b00;
    assign m05 = (WIDTH > 20) ? digit_mod(in[23:20]) : 2'b00;
    assign m06 = (WIDTH > 24) ? digit_mod(in[27:24]) : 2'b00;
    [MASKED]

    // Second level: Combining results
    assign m10 = digit_mod({m01, m00});
    assign m11 = digit_mod({m03, m02});
    assign m12 = digit_mod({m05, m04});
    assign m13 = digit_mod({m07, m06});

    // Third level: Further combination
    assign m20 = digit_mod({m11, m10});
    assign m21 = digit_mod({m13, m12});

    // Final modulo-3 calculation
    assign out = digit_mod({m21, m20});

    // Function to calculate modulo-3 for 4-bit input
    function [1:0] digit_mod;
        input [3:0] digit;
        begin
            case (digit)
                4'd0, 4'd3, 4'd6, 4'd9, 4'd12, 4'd15: digit_mod = 2'd0;
                4'd1, 4'd4, 4'd7, 4'd10, 4'd13: digit_mod = 2'd1;
                4'd2, 4'd5, 4'd8, 4'd11, 4'd14: digit_mod = 2'd2;
            endcase
        end
    endfunction

endmodule