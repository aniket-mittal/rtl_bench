module origen_148227 #(
    parameter N = 8,
    parameter DATA_WIDTH = 16,
    parameter COEFF_WIDTH = 16,
    parameter MU = 16'h0100  // Fixed-point representation of 0.0625
)(
    input wire clk,
    input wire signed [DATA_WIDTH-1:0] x,
    input wire signed [DATA_WIDTH-1:0] d,
    output wire signed [DATA_WIDTH-1:0] y,
    output wire signed [(N*COEFF_WIDTH)-1:0] w
);

    reg signed [COEFF_WIDTH-1:0] coeffs [0:N-1];
    reg signed [DATA_WIDTH-1:0] x_delay [0:N-1];
    reg signed [DATA_WIDTH-1:0] y_reg;
    reg signed [DATA_WIDTH-1:0] error;

    integer i;

    // Initialize coefficients to zero
    initial begin
        for (i = 0; i < N; i = i + 1) begin
            coeffs[i] = 0;
        end
    end

    always @(posedge clk) begin
        // Shift input samples
        for (i = N-1; i > 0; i = i - 1) begin
            x_delay[i] <= x_delay[i-1];
        end
        x_delay[0] <= x;

        // Compute filter output
        y_reg <= 0;
        for (i = 0; i < N; i = i + 1) begin
            y_reg <= y_reg + (coeffs[i] * x_delay[i]) >>> COEFF_WIDTH;
        end

        // Compute error
        error <= d - y_reg;

        // Update coefficients using LMS algorithm
        for (i = 0; i < N; i = i + 1) begin
            coeffs[i] <= coeffs[i] + ((MU * error * x_delay[i]) >>> (DATA_WIDTH + COEFF_WIDTH - 1));
        end
    end

    // Assign outputs
    assign y = y_reg;
    
    genvar j;
    generate
        for (j = 0; j < N; j = j + 1) begin : coeff_output
            assign w[(j+1)*COEFF_WIDTH-1:j*COEFF_WIDTH] = coeffs[j];
        end
    endgenerate

endmodule