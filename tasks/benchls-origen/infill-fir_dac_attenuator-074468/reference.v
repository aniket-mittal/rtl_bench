module origen_074468 (
    input wire [13:0] DAC_in,
    input wire [3:0] Sel_att,
    input wire clk,
    output reg [13:0] DAC_out
);

    parameter signed [31:0] coeff_0 = -32'd62;
    parameter signed [31:0] coeff_1 = 32'd0;
    parameter signed [31:0] coeff_2 = 32'd194;
    parameter signed [31:0] coeff_3 = 32'd435;
    parameter signed [31:0] coeff_4 = 32'd619;
    parameter signed [31:0] coeff_5 = 32'd619;
    parameter signed [31:0] coeff_6 = 32'd435;
    parameter signed [31:0] coeff_7 = 32'd194;
    parameter signed [31:0] coeff_8 = 32'd0;
    parameter [31:0] coeff_w = 32'd8192;
    parameter [31:0] coeff_x = 32'd8192;
    parameter [31:0] coeff_y = 32'd8192;
    parameter [31:0] coeff_z = 32'd8192;

    reg signed [31:0] tap_delay [0:10];
    reg [13:0] DAC_mov;

    always @(posedge clk) begin
        reg signed [31:0] signed_wave;
        reg signed [31:0] acc;
        reg signed [31:0] fir_result;

        signed_wave = $signed({1'b0, DAC_in}) - 32'd4096;

        // Shift tap delay line
        for (int i = 10; i > 0; i = i - 1) begin
            tap_delay[i] <= tap_delay[i-1];
        end
        tap_delay[0] <= signed_wave;

        // Calculate average
        acc = (tap_delay[0] + tap_delay[1] + tap_delay[2] + tap_delay[3]) >>> 2;
        DAC_mov <= acc[13:0] + 14'd4096;

        // 4-tap FIR filter
        fir_result = (tap_delay[0] * coeff_w + tap_delay[1] * coeff_x + 
                      tap_delay[2] * coeff_y + tap_delay[3] * coeff_z) >>> 15;

        case (Sel_att)
            4'b0000: DAC_out <= DAC_in >> 1;  // Divide by 2
            4'b0010: DAC_out <= DAC_in >> 2;  // Divide by 4
            4'b0100: DAC_out <= DAC_in >> 3;  // Divide by 8
            4'b1000: DAC_out <= DAC_in >> 4;  // Divide by 16
            4'b1111: DAC_out <= DAC_mov;
            4'b0011: DAC_out <= fir_result[13:0] + 14'd4096;
            4'b0111: DAC_out <= signed_wave[13:0] + 14'd8192;
            default: DAC_out <= DAC_in;
        endcase
    end

endmodule