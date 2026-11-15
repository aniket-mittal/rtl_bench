module origen_004213
    #(parameter A_width = 8,
      parameter B_width = 8)
    (
    input [A_width-1:0] A,
    input [B_width-1:0] B,
    input TC,
    output reg [A_width+B_width-1:0] PRODUCT
    );

    // Parameter validation
    initial begin
        if (A_width < 1 || B_width < 1) begin
            $display("Error: A_width and B_width must be at least 1");
            ;
        end
    end

    reg [A_width-1:0] temp_a;
    reg [B_width-1:0] temp_b;
    reg [A_width+B_width-1:0] long_temp1, long_temp2;
    reg a_sign, b_sign, product_sign;

    always @(*) begin
        if (TC) begin
            // Two's complement handling
            a_sign = A[A_width-1];
            b_sign = B[B_width-1];
            temp_a = a_sign ? (~A + 1'b1) : A;
            temp_b = b_sign ? (~B + 1'b1) : B;
        end else begin
            temp_a = A;
            temp_b = B;
        end

        // Unsigned multiplication
        long_temp1 = temp_a * temp_b;
        
        // Two's complement of long_temp1
        long_temp2 = ~long_temp1 + 1'b1;

        // Output generation
        if (A === {A_width{1'bx}} || B === {B_width{1'bx}}) begin
            PRODUCT = {(A_width+B_width){1'bx}};
        end else if (TC) begin
            product_sign = a_sign ^ b_sign;
            PRODUCT = product_sign ? long_temp2 : long_temp1;
            PRODUCT[A_width+B_width-1] = product_sign;
        end else begin
            PRODUCT = A * B;
        end
    end

endmodule