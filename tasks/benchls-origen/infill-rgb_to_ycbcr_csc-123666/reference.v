module origen_123666 #(
    parameter DELAY_DATA_WIDTH = 16
) (
    input wire clk,
    input wire RGB_sync,
    input wire [23:0] RGB_data,
    output wire CrYCb_sync,
    output wire [23:0] CrYCb_data
);

    wire csc_sync_Cr, csc_sync_Y, csc_sync_Cb;
    wire [7:0] csc_data_Cr, csc_data_Y, csc_data_Cb;

    ad_csc_Cr #(.DELAY_DATA_WIDTH(DELAY_DATA_WIDTH)) u_csc_Cr (
        .clk(clk),
        .sync(RGB_sync),
        .data(RGB_data),
        .C1(17'h0_8000),  // 0.5
        .C2(17'h1_D556),  // -0.41869
        .C3(17'h1_0A66),  // -0.08131
        .C4(25'h0_00_0000),
        .csc_sync_1(csc_sync_Cr),
        .csc_data_1(csc_data_Cr)
    );

    ad_csc_Y #(.DELAY_DATA_WIDTH(DELAY_DATA_WIDTH)) u_csc_Y (
        .clk(clk),
        .sync(RGB_sync),
        .data(RGB_data),
        .C1(17'h0_4C8B),  // 0.299
        .C2(17'h0_9645),  // 0.587
        .C3(17'h0_1D2F),  // 0.114
        .C4(25'h0_00_0000),
        .csc_sync_1(csc_sync_Y),
        .csc_data_1(csc_data_Y)
    );

    ad_csc_Cb #(.DELAY_DATA_WIDTH(DELAY_DATA_WIDTH)) u_csc_Cb (
        .clk(clk),
        .sync(RGB_sync),
        .data(RGB_data),
        .C1(17'h1_2B21),  // -0.16874
        .C2(17'h1_54BE),  // -0.33126
        .C3(17'h0_8000),  // 0.5
        .C4(25'h0_80_0000),  // 128
        .csc_sync_1(csc_sync_Cb),
        .csc_data_1(csc_data_Cb)
    );

    assign CrYCb_sync = csc_sync_Cr & csc_sync_Y & csc_sync_Cb;
    assign CrYCb_data = {csc_data_Cr, csc_data_Y, csc_data_Cb};

endmodule

module ad_csc_Cr #(
    parameter DELAY_DATA_WIDTH = 16
) (
    input wire clk,
    input wire sync,
    input wire [23:0] data,
    input wire [16:0] C1, C2, C3,
    input wire [24:0] C4,
    output reg csc_sync_1,
    output reg [7:0] csc_data_1
);

    reg [DELAY_DATA_WIDTH-1:0] sync_pipe;
    reg [24:0] mul_1, mul_2, mul_3;
    reg [24:0] sum_1, sum_2;

    always @(posedge clk) begin
        sync_pipe <= {sync_pipe[DELAY_DATA_WIDTH-2:0], sync};

        mul_1 <= C1 * data[23:16];  // R
        mul_2 <= C2 * data[15:8];   // G
        mul_3 <= C3 * data[7:0];    // B

        sum_1 <= mul_1 - mul_2;
        sum_2 <= sum_1 - mul_3 + C4;

        csc_sync_1 <= sync_pipe[DELAY_DATA_WIDTH-1];
        csc_data_1 <= sum_2[24:17];
    end

endmodule

module ad_csc_Y #(
    parameter DELAY_DATA_WIDTH = 16
) (
    input wire clk,
    input wire sync,
    input wire [23:0] data,
    input wire [16:0] C1, C2, C3,
    input wire [24:0] C4,
    output reg csc_sync_1,
    output reg [7:0] csc_data_1
);

    reg [DELAY_DATA_WIDTH-1:0] sync_pipe;
    reg [24:0] mul_1, mul_2, mul_3;
    reg [24:0] sum_1, sum_2;

    always @(posedge clk) begin
        sync_pipe <= {sync_pipe[DELAY_DATA_WIDTH-2:0], sync};

        mul_1 <= C1 * data[23:16];  // R
        mul_2 <= C2 * data[15:8];   // G
        mul_3 <= C3 * data[7:0];    // B

        sum_1 <= mul_1 + mul_2;
        sum_2 <= sum_1 + mul_3 + C4;

        csc_sync_1 <= sync_pipe[DELAY_DATA_WIDTH-1];
        csc_data_1 <= sum_2[24:17];
    end

endmodule

module ad_csc_Cb #(
    parameter DELAY_DATA_WIDTH = 16
) (
    input wire clk,
    input wire sync,
    input wire [23:0] data,
    input wire [16:0] C1, C2, C3,
    input wire [24:0] C4,
    output reg csc_sync_1,
    output reg [7:0] csc_data_1
);

    reg [DELAY_DATA_WIDTH-1:0] sync_pipe;
    reg [24:0] mul_1, mul_2, mul_3;
    reg [24:0] sum_1, sum_2;

    always @(posedge clk) begin
        sync_pipe <= {sync_pipe[DELAY_DATA_WIDTH-2:0], sync};

        mul_1 <= C1 * data[23:16];  // R
        mul_2 <= C2 * data[15:8];   // G
        mul_3 <= C3 * data[7:0];    // B

        sum_1 <= mul_1 + mul_2;
        sum_2 <= sum_1 + mul_3 + C4;

        csc_sync_1 <= sync_pipe[DELAY_DATA_WIDTH-1];
        csc_data_1 <= sum_2[24:17];
    end

endmodule