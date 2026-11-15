module origen_142218 (
    input wire clk,
    input wire rst_n,
    input wire [15:0] in,
    output reg [17:0] out
);

    // Stage 1 registers
    reg [7:0] lower_half, upper_half;
    
    // Stage 2 registers
    reg [15:0] mult_lower, mult_upper;
    
    // Stage 3 register
    reg [16:0] sum;

    // Stage 1: Split input into two 8-bit values
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            lower_half <= 8'b0;
            upper_half <= 8'b0;
        end else begin
            lower_half <= in[7:0];
            upper_half <= in[15:8];
        end
    end

    // Stage 2: Multiply each half by 3
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            mult_lower <= 16'b0;
            mult_upper <= 16'b0;
        end else begin
            mult_lower <= lower_half * 3;
            mult_upper <= upper_half * 3;
        end
    end

    // Stage 3: Combine results
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            sum <= 17'b0;
        end else begin
            sum <= mult_lower + (mult_upper << 8);
        end
    end

    // Output stage
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            out <= 18'b0;
        end else begin
            out <= sum;
        end
    end

endmodule