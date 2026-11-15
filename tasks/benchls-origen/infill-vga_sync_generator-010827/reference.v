module origen_010827 (
    input wire PixClk,
    output reg HSync,
    output reg VSync,
    output reg Video
);

    // Parameters
    parameter H_sync_start = 0;
    parameter H_sync_stop = 0;
    parameter H_img_start = 0;
    parameter H_img_stop = 0;
    parameter H_screen_stop = 0;
    parameter V_sync_start = 0;
    parameter V_sync_stop = 0;
    parameter V_img_start = 0;
    parameter V_img_stop = 0;
    parameter V_screen_stop = 0;
    parameter H_polarity = 1'b0;
    parameter V_polarity = 1'b0;

    // Internal counters
    reg [10:0] Row, Col;

    // Initialization
    initial begin
        Row = 0;
        Col = 0;
        HSync = 0;
        VSync = 0;
        Video = 0;
    end

    // Main logic
    always @(negedge PixClk) begin
        // Generate HSync
        HSync <= (Col >= H_sync_start && Col < H_sync_stop) ? ~H_polarity : H_polarity;

        // Generate VSync
        VSync <= (Row >= V_sync_start && Row < V_sync_stop) ? ~V_polarity : V_polarity;

        // Generate Video enable
        Video <= (Col >= H_img_start && Col < H_img_stop && Row >= V_img_start && Row < V_img_stop);

        // Increment Col counter
        Col <= Col + 1;

        // Reset Col and increment Row when reaching end of line
        if (Col == H_screen_stop) begin
            Col <= 0;
            Row <= Row + 1;

            // Reset Row when reaching end of frame
            if (Row == V_screen_stop) begin
                Row <= 0;
            end
        end
    end

endmodule