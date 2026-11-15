module autovcoder_136919(
    input clk,
    input reset,
    input start,
    input signed [15:0] angle, // angle in radians (fixed-point)
    output reg signed [15:0] sine,
    output reg signed [15:0] cosine,
    output reg done
);

parameter NUM_ITERATIONS = 16;
reg [3:0] count; // iteration counter
reg signed [15:0] x, y, z; // x, y, z for CORDIC
reg signed [15:0] atan_table [0:NUM_ITERATIONS-1]; // arctangent lookup table

initial begin
    // Initialize the atan_table with fixed-point values for arctangents
    atan_table[0] = 16'h3243; // atan(1) = π/4
    atan_table[1] = 16'h1DAC; // atan(0.5)
    atan_table[2] = 16'h0FAD; // atan(0.25)
    // ... Populate the rest of the atan_table
    atan_table[3] = 16'h0BAE; // atan(0.125)
    atan_table[4] = 16'h05D8; // atan(0.0625)
    // ... and so on up to NUM_ITERATIONS
end

always @(posedge clk or posedge reset) begin
    if (reset) begin
        count <= 0;
        sine <= 0;
        cosine <= 0;
        done <= 0;
        x <= 16'h26DD; // Initial x = K (constant scaling factor)
        y <= 0;
        z <= angle; // Load input angle
    end else if (start && count < NUM_ITERATIONS) begin
        if (z < 0) begin
            x <= x + (y >>> count);
            y <= y - (x >>> count);
            z <= z + atan_table[count];
        end else begin
            x <= x - (y >>> count);
            y <= y + (x >>> count);
            z <= z - atan_table[count];
        end
        count <= count + 1;
    end else if (count == NUM_ITERATIONS) begin
        sine <= y;
        cosine <= x;
        done <= 1;
    end
end

endmodule