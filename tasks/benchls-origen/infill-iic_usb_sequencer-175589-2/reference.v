module origen_175589(
    input i_clk,
    input i_rst,
    input i_start_en,
    output reg o_iic_en,
    input [183:0] iic_data_bus,
    input [22:0] iic_done,
    output reg usb_en,
    output reg [7:0] usb_data,
    input usb_done,
    output reg o_led
);

reg [3:0] i;
reg [4:0] j;

always @(posedge i_clk or posedge i_rst) begin
    if (i_rst) begin
        i <= 4'b0;
        j <= 5'b0;
        o_iic_en <= 1'b0;
        usb_en <= 1'b0;
        o_led <= 1'b0;
    end else begin
        case (i)
            4'b0000: begin
                if (i_start_en) begin
                    o_led <= 1'b1;
                    i <= 4'b0001;
                end
            end
            4'b0001: begin
                o_iic_en <= 1'b1;
                i <= 4'b0010;
            end
            4'b0010: begin
                o_iic_en <= 1'b0;
                i <= 4'b0101;
            end
            4'b0011: begin
                usb_en <= 1'b1;
                i <= 4'b0100;
            end
            4'b0100: begin
                if (usb_done) begin
                    usb_en <= 1'b0;
                    i <= i + 1;
                    j <= j + 1;
                end
            end
            4'b0101: begin
                if (iic_done) begin
                    i <= 4'b0110;
                end
            end
            4'b0110: begin
                usb_data <= iic_data_bus[7:0];
                usb_en <= 1'b1;
                i <= i + 1;
                j <= j + 1;
            end
            4'b0111: begin
                usb_data <= iic_data_bus[15:8];
                usb_en <= 1'b1;
                i <= i + 1;
                j <= j + 1;
            end
            4'b1000: begin
                usb_data <= iic_data_bus[23:16];
                usb_en <= 1'b1;
                i <= i + 1;
                j <= j + 1;
            end
            4'b1001: begin
                usb_data <= iic_data_bus[31:24];
                usb_en <= 1'b1;
                i <= i + 1;
                j <= j + 1;
            end
            4'b1010: begin
                usb_data <= iic_data_bus[39:32];
                usb_en <= 1'b1;
                i <= 4'b0000;
                j <= 5'b00000;
            end
        endcase
    end
end

endmodule