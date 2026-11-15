module origen_062094 #(
    parameter glitch_thresh = 8'd10,
    parameter refcnt_width = 16,
    parameter freq_width = 32,
    parameter initv = 32'd1000000
) (
    input wire sysclk,
    input wire f_in,
    output reg [freq_width-1:0] frequency,
    output reg freq_strobe,
    output reg [15:0] diff_stream,
    output reg diff_stream_strobe,
    output reg glitch_catcher
);

    // Gray code counter
    reg [freq_width-1:0] gray_counter;
    always @(posedge f_in) begin
        gray_counter <= gray_counter + 1'b1;
    end

    // Gray to binary conversion
    wire [freq_width-1:0] binary_counter;
    genvar i;
    generate
        for (i = 0; i < freq_width; i = i + 1) begin : gray_to_binary
            assign binary_counter[i] = ^gray_counter[freq_width-1:i];
        end
    endgenerate

    // Synchronization
    reg [freq_width-1:0] sync_counter [2:0];
    always @(posedge sysclk) begin
        sync_counter[0] <= binary_counter;
        sync_counter[1] <= sync_counter[0];
        sync_counter[2] <= sync_counter[1];
    end

    // Difference calculation and glitch detection
    reg [freq_width-1:0] prev_counter;
    reg [freq_width-1:0] diff;
    always @(posedge sysclk) begin
        prev_counter <= sync_counter[2];
        diff <= sync_counter[2] - prev_counter;
        if (diff > glitch_thresh) begin
            glitch_catcher <= ~glitch_catcher;
        end
    end

    // Frequency measurement
    reg [freq_width-1:0] acc;
    reg [refcnt_width-1:0] refcnt;
    always @(posedge sysclk) begin
        if (refcnt == {refcnt_width{1'b1}}) begin
            frequency <= acc;
            freq_strobe <= 1'b1;
            acc <= diff;
            refcnt <= 0;
        end else begin
            acc <= acc + diff;
            refcnt <= refcnt + 1'b1;
            freq_strobe <= 1'b0;
        end
    end

    // Difference stream
    reg [15:0] diff_window [15:0];
    integer j;
    always @(posedge sysclk) begin
        for (j = 15; j > 0; j = j - 1) begin
            diff_window[j] <= diff_window[j-1];
        end
        diff_window[0] <= diff[15:0];
        diff_stream <= diff_window[15];
        diff_stream_strobe <= 1'b1;
    end

    // Initialization
    initial begin
        frequency = initv;
        freq_strobe = 0;
        diff_stream = 0;
        diff_stream_strobe = 0;
        glitch_catcher = 0;
        gray_counter = 0;
        for (j = 0; j < 3; j = j + 1) begin
            sync_counter[j] = 0;
        end
        prev_counter = 0;
        acc = 0;
        refcnt = 0;
        for (j = 0; j < 16; j = j + 1) begin
            diff_window[j] = 0;
        end
    end

endmodule