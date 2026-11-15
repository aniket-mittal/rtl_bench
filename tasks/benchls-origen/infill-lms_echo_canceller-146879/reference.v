module origen_146879 #(
    parameter N = 32,  // Number of filter taps
    parameter W = 16   // Bit width of input/output signals
)(
    input wire clk,
    input wire rst,
    input wire signed [W-1:0] in1,  // Original signal
    input wire signed [W-1:0] in2,  // Echo signal
    output wire signed [W-1:0] out  // Original signal without echo
);

    // Filter coefficients
    reg signed [W-1:0] coeff [N-1:0];
    
    // Delay line for input signal
    reg signed [W-1:0] delay_line [N-1:0];
    
    // LMS algorithm parameters
    localparam signed [W-1:0] MU = 16'h0010;  // Step size (0.001 in fixed-point)
    
    integer i;
    reg signed [W-1:0] estimated_echo;
    reg signed [W-1:0] error;
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Initialize coefficients and delay line
            for (i = 0; i < N; i = i + 1) begin
                coeff[i] <= 0;
                delay_line[i] <= 0;
            end
        end else begin
            // Shift delay line
            for (i = N-1; i > 0; i = i - 1) begin
                delay_line[i] <= delay_line[i-1];
            end
            delay_line[0] <= in1;
            
            // Calculate estimated echo
            estimated_echo = 0;
            for (i = 0; i < N; i = i + 1) begin
                estimated_echo = estimated_echo + (delay_line[i] * coeff[i]) >>> (W-1);
            end
            
            // Calculate error
            error = in2 - estimated_echo;
            
            // Update coefficients using LMS algorithm
            for (i = 0; i < N; i = i + 1) begin
                coeff[i] <= coeff[i] + ((MU * error * delay_line[i]) >>> W);
            end
        end
    end
    
    // Output: original signal minus estimated echo
    assign out = in1 - estimated_echo;

endmodule