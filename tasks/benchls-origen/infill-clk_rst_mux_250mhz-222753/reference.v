module origen_222753(
    input reset_in,
    input clk_10mhz_int,
    input clk_10mhz_ext,
    output clk_250mhz_int,
    output rst_250mhz_int,
    output clk_250mhz,
    output rst_250mhz,
    output ext_clock_selected
);

reg [9:0] clk_counter = 0;
reg [9:0] rst_counter = 0;
reg ext_clock_selected_reg = 0;
reg clk_250mhz_reg = 0;
reg rst_250mhz_reg = 0;

assign clk_250mhz_int = clk_250mhz_reg;
assign rst_250mhz_int = rst_250mhz_reg;
assign clk_250mhz = clk_250mhz_reg;
assign rst_250mhz = rst_250mhz_reg;
assign ext_clock_selected = ext_clock_selected_reg;

always @(posedge clk_10mhz_int or posedge reset_in) begin
    if (reset_in) begin
        clk_counter <= 0;
        rst_counter <= 0;
        ext_clock_selected_reg <= 0;
        clk_250mhz_reg <= 0;
        rst_250mhz_reg <= 1;
    end
    else begin
        if (clk_counter < 10'd24) begin
            clk_counter <= clk_counter + 1;
        end
        else begin
            clk_counter <= 0;
            ext_clock_selected_reg <= 1;
            clk_250mhz_reg <= clk_10mhz_ext;
        end

        if (rst_counter < 10'd24) begin
            rst_counter <= rst_counter + 1;
        end
        else begin
            rst_counter <= 0;
            ext_clock_selected_reg <= 0;
            clk_250mhz_reg <= clk_10mhz_int;
            rst_250mhz_reg <= 0;
        end
    end
end

endmodule