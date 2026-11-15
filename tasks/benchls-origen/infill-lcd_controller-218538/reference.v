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

always @(posedge LCDCLK, negedge PRESETn) begin
    if (~PRESETn) begin
        LCD_RW <= 1'b0;
        LCD_RS <= 1'b0;
        LCD_EN <= 1'b0;
        LCD_DATA <= 8'h00;
        data_tmp <= 256'h0;
        data_sel <= 8'h00;
        cnt <= 6'h00;
        init <= 8'h00;
        init_max <= 8'h07;
        line_change_1 <= 1'b0;
        line_change_2 <= 1'b0;
    end
    else begin
        if (init < init_max) begin
            case (init)
                8'h00: begin
                    LCD_DATA <= 8'h38; // Function set
                    LCD_RS <= 1'b0;
                    LCD_EN <= 1'b1;
                    init <= init + 1'b1;
                end
                8'h01: begin
                    LCD_EN <= 1'b0;
                    init <= init + 1'b1;
                end
                8'h02: begin
                    LCD_DATA <= 8'h0C; // Display on, cursor off
                    LCD_RS <= 1'b0;
                    LCD_EN <= 1'b1;
                    init <= init + 1'b1;
                end
                8'h03: begin
                    LCD_EN <= 1'b0;
                    init <= init + 1'b1;
                end
                8'h04: begin
                    LCD_DATA <= 8'h01; // Clear display
                    LCD_RS <= 1'b0;
                    LCD_EN <= 1'b1;
                    init <= init + 1'b1;
                end
                8'h05: begin
                    LCD_EN <= 1'b0;
                    init <= init + 1'b1;
                end
                8'h06: begin
                    LCD_DATA <= 8'h80; // Set DDRAM address to 0
                    LCD_RS <= 1'b0;
                    LCD_EN <= 1'b1;
                    init <= init + 1'b1;
                end
                8'h07: begin
                    LCD_EN <= 1'b0;
                    init <= init + 1'b1;
                end
            endcase
        end
        else begin
            if (cnt == 6'h3F) begin
                LCD_EN <= 1'b0;
                data_sel <= data_sel + 1'b1;
                if (data_sel == 8'hFF) begin
                    data_tmp <= data;
                    data_sel <= 8'h00;
                    line_change_1 <= ~line_change_1;
                    if (line_change_1) begin
                        line_change_2 <= ~line_change_2;
                    end
                end
                cnt <= 6'h00;
            end
            else begin
                LCD_EN <= 1'b1;
                if (data_sel[0]) begin
                    LCD_RS <= 1'b1; // Data
                end
                else begin
                    LCD_RS <= 1'b0; // Command
                end
                LCD_DATA <= data_tmp[7:0];
                data_tmp <= {data_tmp[247:0], data_tmp[255:248]};
                cnt <= cnt + 1'b1;
            end
        end
    end
end

endmodule