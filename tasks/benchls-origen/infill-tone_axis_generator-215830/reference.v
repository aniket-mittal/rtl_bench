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

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            tone_acc <= 0;
            packet_count <= 0;
            axis_tdata <= 0;
            axis_tvalid <= 0;
            axis_tlast <= 0;
            axis_tkeep <= 'b1111;
        end
        else begin
            if (axis_tready) begin
                tone_acc <= tone_acc + INCREMENT;
                packet_count <= packet_count + 1;

                axis_tdata <= {16'h0000, tone_acc[15:0]};
                axis_tvalid <= 1;

                if (packet_count == PACKET_SIZE - 1) begin
                    axis_tlast <= 1;
                    packet_count <= 0;
                end
                else begin
                    axis_tlast <= 0;
                end
            end
            else begin
                axis_tvalid <= 0;
                axis_tlast <= 0;
            end
        end
    end

endmodule