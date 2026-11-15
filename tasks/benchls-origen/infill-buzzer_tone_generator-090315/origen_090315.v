module origen_090315 (
    input wire clk,
    input wire rst,
    input wire [7:0] sound,
    output reg buzzer
);

    reg [18:0] buzzer_counter;
    reg [7:0] sound_d;
    reg [26:0] delay_counter;

    [MASKED]

endmodule