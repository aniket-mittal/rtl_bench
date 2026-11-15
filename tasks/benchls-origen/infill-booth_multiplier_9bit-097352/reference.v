module origen_097352 (
    input wire clk,
    input wire rst_n,
    input wire i_start,
    input wire signed [8:0] i_multiplicand,
    input wire signed [8:0] i_multiplier,
    output reg signed [15:0] o_mult
);

    reg signed [8:0] multiplicand;
    reg signed [8:0] multiplier;
    reg signed [15:0] product;
    reg [5:0] index;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            multiplicand <= 9'b0;
            multiplier <= 9'b0;
            product <= 16'b0;
            index <= 6'b0;
            o_mult <= 16'b0;
        end else if (i_start) begin
            if (index == 0) begin
                multiplicand <= i_multiplicand;
                multiplier <= i_multiplier;
                product <= 16'b0;
                index <= 6'b0;
            end else if (index < 9) begin
                if (multiplier[0]) begin
                    product <= product + {{7{multiplicand[8]}}, multiplicand};
                end
                multiplicand <= multiplicand << 1;
                multiplier <= multiplier >>> 1;
                index <= index + 1;
            end
        end else begin
            multiplicand <= 9'b0;
            multiplier <= 9'b0;
            product <= 16'b0;
            index <= 6'b0;
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            o_mult <= 16'b0;
        end else if (multiplier == 0 || index == 9) begin
            o_mult <= product;
        end else begin
            o_mult <= 16'b0;
        end
    end

endmodule