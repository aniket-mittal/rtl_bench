module origen_126745 (
    input wire clk_cog,
    input wire clk_vid,
    input wire ena,
    input wire setvid,
    input wire setscl,
    input wire [31:0] data,
    input wire [7:0] pixel,
    input wire [23:0] color,
    input wire [15:0] aural,
    input wire carrier,
    output reg ack,
    output wire pin_out
);

    // Internal registers
    reg [31:0] vid_data;
    reg [7:0] vid_pixel;
    reg [23:0] vid_color;
    reg [15:0] vid_aural;
    reg [7:0] shifter;
    reg [3:0] pixel_count;
    reg [9:0] line_count;
    reg [1:0] field;
    reg hsync, vsync;
    reg active_video;
    reg baseband_out;
    reg broadcast_out;

    // Video timing parameters
    localparam H_SYNC = 10'd64;
    localparam H_BACK = 10'd94;
    localparam H_ACTIVE = 10'd640;
    localparam H_FRONT = 10'd16;
    localparam V_SYNC = 10'd2;
    localparam V_BACK = 10'd33;
    localparam V_ACTIVE = 10'd480;
    localparam V_FRONT = 10'd10;

    // Acknowledge logic
    always @(posedge clk_cog) begin
        if (setvid) begin
            vid_data <= data;
            vid_pixel <= pixel;
            vid_color <= color;
            ack <= 1'b1;
        end else if (setscl) begin
            vid_aural <= aural;
            ack <= 1'b1;
        end else begin
            ack <= 1'b0;
        end
    end

    // Video timing generator
    always @(posedge clk_vid) begin
        if (!ena) begin
            line_count <= 10'd0;
            pixel_count <= 4'd0;
            field <= 2'd0;
        end else begin
            if (pixel_count == 4'd15) begin
                pixel_count <= 4'd0;
                if (line_count == (V_SYNC + V_BACK + V_ACTIVE + V_FRONT - 1)) begin
                    line_count <= 10'd0;
                    field <= field + 1'b1;
                end else begin
                    line_count <= line_count + 1'b1;
                end
            end else begin
                pixel_count <= pixel_count + 1'b1;
            end
        end
    end

    // Sync signal generation
    always @(posedge clk_vid) begin
        hsync <= (pixel_count < H_SYNC[3:0]);
        vsync <= (line_count < V_SYNC);
        active_video <= (pixel_count >= (H_SYNC[3:0] + H_BACK[3:0])) &&
                        (pixel_count < (H_SYNC[3:0] + H_BACK[3:0] + H_ACTIVE[3:0])) &&
                        (line_count >= (V_SYNC + V_BACK)) &&
                        (line_count < (V_SYNC + V_BACK + V_ACTIVE));
    end

    // Video shifter
    always @(posedge clk_vid) begin
        if (pixel_count == 4'd0) begin
            shifter <= vid_pixel;
        end else begin
            shifter <= {shifter[6:0], 1'b0};
        end
    end

    // Baseband output generation
    always @(posedge clk_vid) begin
        if (!active_video) begin
            baseband_out <= hsync ^ vsync;
        end else begin
            baseband_out <= shifter[7] ? vid_color[23:16] > {pixel_count, 4'b0000} : 
                                         vid_color[7:0] > {pixel_count, 4'b0000};
        end
    end

    // Broadcast output generation
    always @(posedge clk_vid) begin
        broadcast_out <= carrier ^ ((vid_aural[15] & active_video) | baseband_out);
    end

    // Output multiplexer
    assign pin_out = setscl ? broadcast_out : baseband_out;

endmodule