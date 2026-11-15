module origen_145097 #(
    parameter GAIN_MIN = 1,
    parameter GAIN_MAX = 10,
    parameter GAIN_STEP = 1,
    parameter TIME_CONSTANT = 100
) (
    input wire clk,
    input wire rst,
    input wire signed [15:0] in,
    input wire [7:0] ctl,
    output reg signed [15:0] out
);

    reg [31:0] gain;
    reg [31:0] error;
    reg [31:0] integrator;

    // Variable gain amplifier
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            out <= 0;
        end else begin
            out <= (in * gain) >>> 16; // Fixed-point multiplication
        end
    end

    // Feedback loop and digital integrator
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            gain <= GAIN_MIN << 16;
            error <= 0;
            integrator <= 0;
        end else begin
            // Calculate error
            error <= ctl - (out >>> 8); // Assuming ctl is 8-bit and out is 16-bit

            // Update integrator
            integrator <= integrator + ((error * TIME_CONSTANT) >>> 16);

            // Update gain
            if (integrator > 0) begin
                gain <= gain + (GAIN_STEP << 16);
                if (gain > (GAIN_MAX << 16)) begin
                    gain <= GAIN_MAX << 16;
                end
            end else if (integrator < 0) begin
                gain <= gain - (GAIN_STEP << 16);
                if (gain < (GAIN_MIN << 16)) begin
                    gain <= GAIN_MIN << 16;
                end
            end
        end
    end

endmodule