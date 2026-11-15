module autovcoder_071153(
    input            rst,
    input            clk,
    input            cen,   // 1024 Hz clock enable
    input      [7:0] din,
    input      [2:0] we,    // overwrite hour, min, sec
    output reg [7:0] sec, min, hour // BCD
);

reg [9:0] cnt;

[MASKED]

endmodule
