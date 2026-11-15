module origen_104351 #(
    parameter TEST_IMAGE = 0
) (
    input wire clk,
    input wire rst,
    output reg [13:0] data_o
);

    // Constants
    localparam VALID_PIX = 640;
    localparam VALID_LINES = 480;
    localparam ALL_PIX = 1500;
    localparam ALL_LINES = 500;
    localparam OFFSET = 10;

    // Counters
    reg [10:0] cnt_pix;
    reg [9:0] cnt_line;

    // Data registers
    reg [7:0] data_frame;
    reg [7:0] data_line;
    reg [7:0] data;

    // Sync signals
    wire Hsync, Vsync;
    reg Pixsync;

    // Counter logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            cnt_pix <= 0;
            cnt_line <= 0;
        end else begin
            if (cnt_pix == ALL_PIX - 1) begin
                cnt_pix <= 0;
                if (cnt_line == ALL_LINES - 1)
                    cnt_line <= 0;
                else
                    cnt_line <= cnt_line + 1;
            end else begin
                cnt_pix <= cnt_pix + 1;
            end
        end
    end

    // Sync signal generation
    assign Hsync = (cnt_pix < (ALL_PIX - VALID_PIX*2));
    assign Vsync = (cnt_line < (ALL_LINES - VALID_LINES));

    // Pixsync generation
    always @(posedge clk or posedge rst) begin
        if (rst)
            Pixsync <= 0;
        else
            Pixsync <= ~Pixsync;
    end

    // Data generation
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            data_frame <= 0;
            data_line <= 0;
            data <= 0;
        end else begin
            if (cnt_pix == 0 && cnt_line == 0) begin
                case (TEST_IMAGE)
                    0, 2: data_frame <= data_frame + 1;
                    1, 3: data_frame <= data_frame - 1;
                endcase
            end

            if (cnt_pix == 0) begin
                case (TEST_IMAGE)
                    0, 1: data_line <= data_line + 1;
                    2, 3: data_line <= data_frame;
                endcase
            end

            if (!Hsync && !Vsync) begin
                if (cnt_pix[0])
                    data <= data + 1;
            end else begin
                data <= {data_frame[3:0], data_line[3:0]};
            end
        end
    end

    // Output formatting
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            data_o <= 0;
        end else begin
            data_o[13:12] <= 2'b00;
            data_o[11] <= Vsync;
            data_o[10] <= Hsync;
            data_o[9] <= Pixsync;
            data_o[8] <= cnt_pix[0] ? ^{1'b1, data[7:4]} : ^{1'b0, data[3:0]};
            data_o[7:0] <= cnt_pix[0] ? {data[7:4], 4'b0000} : {4'b0000, data[3:0]};
        end
    end

endmodule