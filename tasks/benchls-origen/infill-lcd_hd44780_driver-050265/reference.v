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

always @(posedge clk) begin
    case (Cs)
        0: lcd_code <= 6'b000011;
        1: lcd_code <= 6'b000011;
        2: lcd_code <= 6'b000011;
        3: lcd_code <= 6'b000010;
        4: lcd_code <= 6'b000010;
        5: lcd_code <= 6'b001000;
        6: lcd_code <= 6'b000000;
        7: lcd_code <= 6'b001110;
        8: lcd_code <= 6'b000000;
        9: lcd_code <= 6'b000110;
        10: lcd_code <= 6'b000000;
        11: lcd_code <= 6'b000001;
        default: begin
            if (Cs < 44 || (Cs > 45 && Cs < 78))
                lcd_code <= {2'b10, chars_data[Cs-12]};
            else if (Cs == 44)
                lcd_code <= 6'b000000;
            else if (Cs == 45)
                lcd_code <= 6'b001100;
        end
    endcase

    case (delay_state)
        0: begin
            lcd_4 <= lcd_code[3:0];
            lcd_rs <= lcd_code[5];
            lcd_rw <= lcd_code[4];
            lcd_e <= 0;
            if (count == before_delay) begin
                count <= 0;
                delay_state <= 1;
            end else
                count <= count + 1;
        end
        1: begin
            lcd_e <= 1;
            if (count == on_delay) begin
                count <= 0;
                delay_state <= 2;
            end else
                count <= count + 1;
        end
        2: begin
            lcd_e <= 0;
            if (count == off_delay) begin
                count <= 0;
                delay_state <= 0;
                if (Cs == 78)
                    Cs <= 10;
                else
                    Cs <= Cs + 1;
            end else
                count <= count + 1;
        end
    endcase

    if (Cs == 10)
        chars_hold <= chars;
end

endmodule