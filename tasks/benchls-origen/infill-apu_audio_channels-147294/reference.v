module origen_147294 (
    input wire clk,
    input wire rst_n,
    input wire mute,
    input wire [7:0] addr,
    input wire [7:0] data_in,
    input wire rw,
    output reg [7:0] audio_out,
    output reg [15:0] pcm_left,
    output reg [15:0] pcm_right,
    output reg [7:0] data_out
);

// Counter
reg [7:0] cpu_counter;
wire cpu_pulse;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        cpu_counter <= 8'd0;
    else
        cpu_counter <= cpu_counter + 1;
end

assign cpu_pulse = (cpu_counter == 8'd0);

// Frame counter
reg [15:0] frame_counter;
wire frame_pulse;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        frame_counter <= 16'd0;
    else if (cpu_pulse)
        frame_counter <= frame_counter + 1;
end

assign frame_pulse = (frame_counter == 16'd0);

// Audio channels
reg [7:0] pulse1_out, pulse2_out, triangle_out, noise_out;
reg [3:0] channel_active;

// Pulse channels
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        pulse1_out <= 8'd0;
        pulse2_out <= 8'd0;
    end else if (frame_pulse) begin
        pulse1_out <= pulse1_out + 1;
        pulse2_out <= pulse2_out + 2;
    end
end

// Triangle channel
always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        triangle_out <= 8'd0;
    else if (frame_pulse)
        triangle_out <= triangle_out + 3;
end

// Noise channel
always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        noise_out <= 8'd0;
    else if (frame_pulse)
        noise_out <= noise_out + 4;
end

// Mixer
always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        audio_out <= 8'd0;
    else if (!mute)
        audio_out <= (pulse1_out + pulse2_out + triangle_out + noise_out) >> 2;
    else
        audio_out <= 8'd0;
end

// PCM output
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        pcm_left <= 16'd0;
        pcm_right <= 16'd0;
    end else begin
        pcm_left <= {audio_out, 8'd0};
        pcm_right <= {audio_out, 8'd0};
    end
end

// Register read/write
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        channel_active <= 4'b0000;
        data_out <= 8'd0;
    end else if (!rw) begin
        case (addr)
            8'h00: channel_active[0] <= data_in[0];
            8'h01: channel_active[1] <= data_in[0];
            8'h02: channel_active[2] <= data_in[0];
            8'h03: channel_active[3] <= data_in[0];
            default: ;
        endcase
    end else begin
        case (addr)
            8'h00: data_out <= {7'b0, channel_active[0]};
            8'h01: data_out <= {7'b0, channel_active[1]};
            8'h02: data_out <= {7'b0, channel_active[2]};
            8'h03: data_out <= {7'b0, channel_active[3]};
            8'h04: data_out <= channel_active;
            default: data_out <= 8'd0;
        endcase
    end
end

endmodule