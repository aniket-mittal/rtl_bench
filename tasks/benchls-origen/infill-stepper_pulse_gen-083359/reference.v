module origen_083359 #(
    parameter WIDTH = 16
) (
    input wire clk,
    input wire rst,
    input wire drv_dir,
    input wire enable,
    input wire counter_en,
    input wire [2*WIDTH-1:0] drv_period,
    input wire [2*WIDTH-1:0] PULSE_NUMBER,
    output reg [2*WIDTH-1:0] drv_pulse
);

    reg pulse_invert;
    reg drv_step;
    reg [WIDTH-1:0] count_N;
    reg [WIDTH-1:0] drv_count;

    always @(posedge clk) begin
        if (rst || !enable) begin
            drv_count <= 0;
            count_N <= 0;
            pulse_invert <= 0;
            drv_step <= 0;
        end else begin
            // Counter logic
            if (drv_count >= drv_period[WIDTH-1:0] - 1) begin
                drv_count <= 0;
            end else begin
                drv_count <= drv_count + 1;
            end

            // Pulse generation
            if (drv_count >= 1 && drv_count <= (drv_period[WIDTH-1:0] >> 2)) begin
                drv_step <= 1;
            end else begin
                drv_step <= 0;
            end

            // Pulse counting
            if (counter_en && drv_count == 1) begin
                if (count_N >= PULSE_NUMBER[WIDTH-1:0] - 1) begin
                    count_N <= 0;
                end else begin
                    count_N <= count_N + 1;
                end
            end

            // Output generation
            drv_pulse <= {WIDTH{drv_step ^ pulse_invert}};
        end
    end

endmodule