module origen_050265(
    input wire clk,
    input wire [256:0] chars,
    output reg lcd_rs, lcd_rw, lcd_e,
    output reg [3:0] lcd_4
);

reg [5:0] lcd_code;
reg [1:0] write;
reg [7:0] before_delay, on_delay, off_delay;
reg [6:0] Cs;
reg [7:0] count;
reg [1:0] delay_state;
reg [256:0] chars_hold;
wire [3:0] chars_data [63:0];

genvar i;
generate
    for (i = 0; i < 64; i = i + 1) begin : char_split
        assign chars_data[i] = chars_hold[i*4+3:i*4];
    end
endgenerate

initial begin
    Cs = 0;
    write = 2'b10;
    before_delay = 5;
    on_delay = 5;
    off_delay = 5;
    delay_state = 0;
    count = 0;
    chars_hold = 0;
end

[MASKED]

endmodule