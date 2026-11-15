module origen_144922 (
    input wire clk,
    input wire rst,
    input wire [31:0] angle,
    output reg [31:0] sin_out,
    output reg [31:0] cos_out,
    output reg [31:0] tan_out
);

    // Fixed-point representation: 1 sign bit, 15 integer bits, 16 fractional bits
    parameter FIXED_POINT = 32'h00010000;
    
    reg [31:0] x, x2, x3, x5, x7;
    reg [31:0] sin_term1, sin_term2, sin_term3, sin_term4;
    reg [31:0] cos_term1, cos_term2, cos_term3, cos_term4;
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sin_out <= 32'h00000000;
            cos_out <= 32'h00010000; // 1.0 in fixed-point
            tan_out <= 32'h00000000;
            x <= 32'h00000000;
            x2 <= 32'h00000000;
            x3 <= 32'h00000000;
            x5 <= 32'h00000000;
            x7 <= 32'h00000000;
        end else begin
            // Compute powers of x
            x <= angle;
            x2 <= (angle * angle) >>> 16;
            x3 <= (x2 * angle) >>> 16;
            x5 <= (x3 * x2) >>> 16;
            x7 <= (x5 * x2) >>> 16;
            
            // Compute sine terms
            sin_term1 <= x;
            sin_term2 <= (x3 * 32'h0002AAAB) >>> 16; // x^3 / 3!
            sin_term3 <= (x5 * 32'h00000B60) >>> 16; // x^5 / 5!
            sin_term4 <= (x7 * 32'h000001A7) >>> 16; // x^7 / 7!
            
            // Compute cosine terms
            cos_term1 <= FIXED_POINT;
            cos_term2 <= (x2 * 32'h00008000) >>> 16; // x^2 / 2!
            cos_term3 <= (x2 * x2 * 32'h000002AB) >>> 32; // x^4 / 4!
            cos_term4 <= (x2 * x2 * x2 * 32'h0000000B) >>> 48; // x^6 / 6!
            
            // Compute sine
            sin_out <= sin_term1 - sin_term2 + sin_term3 - sin_term4;
            
            // Compute cosine
            cos_out <= cos_term1 - cos_term2 + cos_term3 - cos_term4;
            
            // Compute tangent
            tan_out <= (sin_out * FIXED_POINT) / cos_out;
        end
    end

endmodule