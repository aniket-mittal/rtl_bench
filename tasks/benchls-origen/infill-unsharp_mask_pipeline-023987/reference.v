module origen_023987 (
    input wire pixel_clk,
    input wire vsync_in,
    input wire href_in,
    input wire shrap_en,
    input wire [9:0] sharp_threlode_in,
    input wire [7:0] sharp_factor_in,
    input wire [9:0] data_raw_in,
    input wire [9:0] data_gaus_in,
    output reg vsync_out,
    output reg href_out,
    output reg [9:0] data_out
);

reg [9:0] data_raw_r1, data_raw_r2, data_raw_r3, data_raw_r4;
reg [9:0] data_gaus_r1, data_gaus_r2, data_gaus_r3, data_gaus_r4;
reg [9:0] data_abs;
reg [17:0] data_tmp1;
reg [9:0] data_tmp2;
reg [9:0] data_out_reg;
reg vsync_r1, vsync_r2, vsync_r3, vsync_r4;
reg href_r1, href_r2, href_r3, href_r4;

always @(posedge pixel_clk) begin
    // Delay raw and Gaussian data
    {data_raw_r4, data_raw_r3, data_raw_r2, data_raw_r1} <= {data_raw_r3, data_raw_r2, data_raw_r1, data_raw_in};
    {data_gaus_r4, data_gaus_r3, data_gaus_r2, data_gaus_r1} <= {data_gaus_r3, data_gaus_r2, data_gaus_r1, data_gaus_in};

    // Delay sync signals
    {vsync_r4, vsync_r3, vsync_r2, vsync_r1} <= {vsync_r3, vsync_r2, vsync_r1, vsync_in};
    {href_r4, href_r3, href_r2, href_r1} <= {href_r3, href_r2, href_r1, href_in};

    // Calculate absolute difference
    data_abs <= (data_raw_r4 > data_gaus_r4) ? (data_raw_r4 - data_gaus_r4) : (data_gaus_r4 - data_raw_r4);

    // Apply sharpening factor
    data_tmp1 <= data_abs * sharp_factor_in;
    data_tmp2 <= data_tmp1[17:8] + data_raw_r4;

    // Apply threshold and clamp output
    if (shrap_en) begin
        if (data_abs > sharp_threlode_in) begin
            data_out_reg <= (data_tmp2 > 1023) ? 1023 : data_tmp2;
        end else begin
            data_out_reg <= data_raw_r4;
        end
    end else begin
        data_out_reg <= data_gaus_r4;
    end

    // Assign outputs
    vsync_out <= vsync_r4;
    href_out <= href_r4;
    data_out <= data_out_reg;
end

endmodule