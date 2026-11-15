module autovcoder_135548 (
    input clk,
    input rst,
    input signed [15:0] x, // input signal
    input signed [15:0] d, // desired signal
    output signed [15:0] y, // output signal
    output signed [15:0] error // error signal
);
    parameter N = 3; // Order of the filter
    parameter signed [15:0] mu = 16'h0001; // Step size

    reg signed [15:0] w [0:N-1]; // Coefficients
    reg signed [15:0] x_delay [0:N-1]; // Delayed input signal
    reg signed [15:0] y_reg; // Output signal
    reg signed [15:0] error_reg; // Error signal

    integer i;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < N; i = i + 1) begin
                w[i] <= 16'h0000; // Initialize coefficients to zero
                x_delay[i] <= 16'h0000; // Initialize delay line to zero
            end
            y_reg <= 16'h0000;
            error_reg <= 16'h0000;
        end else begin
            // Shift input signal
            x_delay[0] <= x;
            for (i = 1; i < N; i = i + 1) begin
                x_delay[i] <= x_delay[i-1];
            end
            
            // Calculate output
            y_reg = 16'h0000;
            for (i = 0; i < N; i = i + 1) begin
                y_reg = y_reg + (w[i] * x_delay[i]);
            end

            // Calculate error
            error_reg = d - y_reg;

            // Update coefficients
            for (i = 0; i < N; i = i + 1) begin
                w[i] <= w[i] + (mu * error_reg * x_delay[i]);
            end
        end
    end

    assign y = y_reg;
    assign error = error_reg;
endmodule