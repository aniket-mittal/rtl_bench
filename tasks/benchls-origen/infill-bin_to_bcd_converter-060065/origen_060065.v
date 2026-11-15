module origen_060065 (
    input wire clk_50M,
    input wire rst,
    input wire [27:0] bin,
    input wire [6:0] duty_bin,
    output reg [31:0] number,
    output reg [7:0] duty_number
);

reg [63:0] temp_bin;
reg [18:0] temp_duty_bin;
integer i;

[MASKED]

endmodule