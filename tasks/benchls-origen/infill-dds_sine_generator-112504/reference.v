module origen_112504 #(
    parameter PW = 32,  // Phase accumulator width
    parameter DW = 12,  // Output data width
    parameter AW = 12   // Address width for sine LUT
)(
    input wire clk,
    input wire rst,
    input wire en,
    input wire signed [PW-1:0] freq,
    input wire signed [PW-1:0] phase,
    output reg signed [DW-1:0] sin,
    output reg signed [DW-1:0] cos
);

    // Sine lookup table
    reg signed [DW-1:0] sine_lut [0:(2**AW)-1];

    // Phase accumulator and sum registers
    reg [PW-1:0] phaseAcc;
    reg [PW-1:0] phSum0, phSum1;

    // Initialize sine LUT
    integer i;
    initial begin
        for (i = 0; i < 2**AW; i = i + 1) begin
            sine_lut[i] = $signed($rtoi($sin(2.0 * 3.14159 * i / (2**AW)) * (2**(DW-1) - 1)));
        end
    end

    // Phase accumulator logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            phaseAcc <= {PW{1'b0}};
            phSum0 <= {PW{1'b0}};
            phSum1 <= {PW{1'b0}};
        end else if (en) begin
            phaseAcc <= phaseAcc + freq;
            phSum0 <= phaseAcc + phase;
            phSum1 <= phaseAcc + phase + (1 << (PW-2)); // Add π/2
        end
    end

    // Output generation
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sin <= {DW{1'b0}};
            cos <= {DW{1'b0}};
        end else if (en) begin
            sin <= sine_lut[phSum0[PW-1:PW-AW]];
            cos <= sine_lut[phSum1[PW-1:PW-AW]];
        end
    end

endmodule