module autovcoder_140034 (
    input clk,
    input rst,
    input signed [15:0] x_in,
    output reg signed [15:0] y_out
);
    reg signed [15:0] coeffs [0:3]; // Coefficients for 4th order Butterworth filter
    reg signed [15:0] delay_line [0:3]; // Delay line for filter stages
    reg [1:0] stage; // Stage counter

    initial begin
        coeffs[0] = 16'h1; // Coefficients (example values)
        coeffs[1] = 16'h2;
        coeffs[2] = 16'h2;
        coeffs[3] = 16'h1;
        delay_line[0] = 16'h0;
        delay_line[1] = 16'h0;
        delay_line[2] = 16'h0;
        delay_line[3] = 16'h0;
        stage = 0;
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            y_out <= 16'h0;
            stage <= 0;
            delay_line[0] <= 16'h0;
            delay_line[1] <= 16'h0;
            delay_line[2] <= 16'h0;
            delay_line[3] <= 16'h0;
        end else begin
            if (stage == 0) begin
                delay_line[0] <= x_in;
                y_out <= delay_line[0] * coeffs[0];
                stage <= stage + 1;
            end else if (stage == 1) begin
                delay_line[1] <= y_out;
                y_out <= delay_line[0] * coeffs[0] + delay_line[1] * coeffs[1];
                stage <= stage + 1;
            end else if (stage == 2) begin
                delay_line[2] <= y_out;
                y_out <= delay_line[1] * coeffs[1] + delay_line[2] * coeffs[2];
                stage <= stage + 1;
            end else if (stage == 3) begin
                delay_line[3] <= y_out;
                y_out <= delay_line[2] * coeffs[2] + delay_line[3] * coeffs[3];
                stage <= 0; // Reset stage
            end
        end
    end
endmodule