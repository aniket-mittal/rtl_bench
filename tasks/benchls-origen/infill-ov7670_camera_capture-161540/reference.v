module origen_161540 #(
    parameter CAM_DATA_WIDTH = 12,
    parameter CAM_LINE = 480,
    parameter CAM_PIXEL = 640
)(
    input reset,
    input ov7670_pclk,
    input ov7670_vs,
    input ov7670_hs,
    input [7:0] ov7670_data,

    output reg we,
    output reg [CAM_DATA_WIDTH-1:0] o_data_wr,
    output reg [15:0] o_line,
    output reg [15:0] o_pixel
);

reg [7:0] byte1, byte2, byte3, byte4;
reg [15:0] line_count, pixel_count;

always @(posedge ov7670_pclk or posedge reset) begin
    if (reset) begin
        byte1 <= 8'b0;
        byte2 <= 8'b0;
        byte3 <= 8'b0;
        byte4 <= 8'b0;
        we <= 1'b0;
        o_data_wr <= {CAM_DATA_WIDTH{1'b0}};
        o_line <= 16'b0;
        o_pixel <= 16'b0;
        line_count <= 16'b0;
        pixel_count <= 16'b0;
    end else begin
        if (ov7670_vs) begin
            line_count <= 16'b0;
            pixel_count <= 16'b0;
        end else if (ov7670_hs) begin
            line_count <= line_count + 16'b1;
            pixel_count <= 16'b0;
        end else begin
            byte1 <= ov7670_data;
            byte2 <= byte1;
            byte3 <= byte2;
            byte4 <= byte3;
            pixel_count <= pixel_count + 16'b1;
            we <= (pixel_count[1:0] == 2'b01);
            o_data_wr <= {byte4[3:0], byte3, byte2[7:4]};
            o_line <= line_count;
            o_pixel <= pixel_count;
        end
    end
end

endmodule