module origen_218538(
    LCDCLK,
    PRESETn,
    data,
    LCD_RW,
    LCD_RS,
    LCD_EN,
    LCD_DATA
);

input LCDCLK;
input PRESETn;
input [255:0] data;

output LCD_RW;
output LCD_RS;
output LCD_EN;
output [7:0] LCD_DATA;

reg LCD_RW;
reg LCD_RS;
reg LCD_EN;
reg [7:0] LCD_DATA;

reg [255:0] data_tmp;
reg [7:0] data_sel;
reg [5:0] cnt;
reg [7:0] init;
reg [7:0] init_max;
reg line_change_1;
reg line_change_2;

[MASKED]

endmodule