module origen_138632 (
    input wire clk,
    input wire rst_n,
    input wire trig,
    input wire [31:0] t,
    input wire [31:0] f,
    input wire [7:0] dc,
    output reg mono_pulse,
    output reg astable_pulse
);

// Monostable pulse generator
reg [31:0] mono_counter;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        mono_pulse <= 1'b0;
        mono_counter <= 32'd0;
    end else if (trig) begin
        mono_pulse <= 1'b1;
        mono_counter <= t;
    end else if (mono_counter > 32'd0) begin
        mono_counter <= mono_counter - 1;
    end else begin
        mono_pulse <= 1'b0;
    end
end

// Astable pulse generator
reg [31:0] astable_counter;
wire [31:0] period;
wire [31:0] on_time;

assign period = 32'd1000000000 / f; // 1 second in nanoseconds divided by frequency
assign on_time = (period * dc) / 8'd100;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        astable_pulse <= 1'b0;
        astable_counter <= 32'd0;
    end else begin
        if (astable_counter < on_time) begin
            astable_pulse <= 1'b1;
        end else begin
            astable_pulse <= 1'b0;
        end

        if (astable_counter >= period - 1) begin
            astable_counter <= 32'd0;
        end else begin
            astable_counter <= astable_counter + 1;
        end
    end
end

endmodule