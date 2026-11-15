module origen_133771 #(
    parameter N = 8,
    parameter WIDTH = 16,
    parameter FRAC_BITS = 14,
    parameter MU = 16'h0004,  // 0.0001 in fixed-point
    parameter DELTA = 16'h4000  // 1.0 in fixed-point
)(
    input wire clk,
    input wire rst,
    input wire signed [WIDTH-1:0] x,
    input wire signed [WIDTH-1:0] d,
    output wire signed [WIDTH-1:0] y,
    output wire signed [WIDTH-1:0] e
);

    reg signed [WIDTH-1:0] w [0:N-1];
    reg signed [WIDTH-1:0] x_delay [0:N-1];
    reg signed [WIDTH-1:0] y_reg, e_reg;

    integer i;

    // LMS algorithm implementation
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < N; i = i + 1) begin
                w[i] <= 0;
                x_delay[i] <= 0;
            end
            y_reg <= 0;
            e_reg <= 0;
        end else begin
            // Shift input samples
            for (i = N-1; i > 0; i = i - 1) begin
                x_delay[i] <= x_delay[i-1];
            end
            x_delay[0] <= x;

            // Compute output
            y_reg <= 0;
            for (i = 0; i < N; i = i + 1) begin
                y_reg <= y_reg + ((w[i] * x_delay[i]) >>> FRAC_BITS);
            end

            // Compute error
            e_reg <= d - y_reg;

            // Update coefficients
            for (i = 0; i < N; i = i + 1) begin
                w[i] <= w[i] + ((MU * e_reg * x_delay[i]) >>> FRAC_BITS);
            end
        end
    end

    assign y = y_reg;
    assign e = e_reg;

endmodule