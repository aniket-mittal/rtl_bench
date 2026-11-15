module origen_075490 #(
    parameter precision_loss_width = 8,
    parameter input_freezed = 0
) (
    input wire clk,
    input wire RSTM,
    input wire CEM,
    input wire MREG,
    input wire [89:0] M_temp,
    input wire [precision_loss_width-1:0] result_SIMD_carry,
    output reg [89:0] M,
    output reg [precision_loss_width-1:0] M_SIMD,
    input wire [7:0] configuration_input,
    input wire configuration_enable,
    output reg [7:0] configuration_output
);

    reg IS_RSTM_INVERTED;
    reg [89:0] M_temp_reg;
    reg [precision_loss_width-1:0] result_SIMD_carry_reg;
    wire RSTM_xored;

    // Configuration register
    always @(posedge clk) begin
        if (configuration_enable) begin
            configuration_output <= configuration_input;
            IS_RSTM_INVERTED <= configuration_input[0];
        end
    end

    // Reset inversion logic
    assign RSTM_xored = RSTM ^ IS_RSTM_INVERTED;

    // Registered operation
    always @(posedge clk) begin
        if (RSTM_xored) begin
            M_temp_reg <= 90'b0;
            result_SIMD_carry_reg <= {precision_loss_width{1'b0}};
        end else if (CEM) begin
            M_temp_reg <= M_temp;
            result_SIMD_carry_reg <= result_SIMD_carry;
        end
    end

    // Output selection
    always @(*) begin
        if (MREG || input_freezed) begin
            M = M_temp_reg;
            M_SIMD = result_SIMD_carry_reg;
        end else begin
            M = M_temp;
            M_SIMD = result_SIMD_carry;
        end
    end

endmodule