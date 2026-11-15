module origen_215830 #(
    parameter DATA_WIDTH = 32,
    parameter AXIS_CLOCK_DOMAIN = "COMMON",
    parameter TONE_FREQUENCY = 1000,
    parameter AUDIO_SAMPLE_FREQ = 48000,
    parameter PACKET_SIZE = 128,
    parameter PACKET_SIZE_BW = $clog2(PACKET_SIZE)
)(
    input clk,
    input rst_n,
    output reg [DATA_WIDTH-1:0] axis_tdata,
    output reg axis_tvalid,
    output reg axis_tlast,
    output reg [DATA_WIDTH/8-1:0] axis_tkeep,
    input axis_tready
);

    localparam INCREMENT = (TONE_FREQUENCY * (2 ** 16)) / AUDIO_SAMPLE_FREQ;

    reg [15:0] tone_acc;
    reg [PACKET_SIZE_BW-1:0] packet_count;

    [MASKED]

endmodule