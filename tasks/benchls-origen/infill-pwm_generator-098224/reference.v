module origen_098224 (
    input wire clk,
    input wire rst_n,
    input wire wrt,
    input wire [10:0] SPEED,
    output reg PWM
);

    reg [10:0] SPEED_ff;
    reg wrt_ff;
    reg [13:0] q1;
    wire [13:0] num_ticks;
    wire Set, Rst;

    // Input synchronization
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            SPEED_ff <= 11'b0;
            wrt_ff <= 1'b0;
        end else begin
            SPEED_ff <= SPEED;
            wrt_ff <= wrt;
        end
    end

    // PWM period calculation
    assign num_ticks = {3'b0, SPEED_ff} * 3 + 14'h186A;

    // Down counter
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            q1 <= 14'b0;
        end else if (wrt_ff) begin
            q1 <= num_ticks;
        end else if (q1 != 14'b0) begin
            q1 <= q1 - 1'b1;
        end
    end

    // Set and Reset signals
    assign Set = wrt_ff;
    assign Rst = (q1 == 14'b0);

    // PWM output generation
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            PWM <= 1'b0;
        end else if (Set) begin
            PWM <= 1'b1;
        end else if (Rst) begin
            PWM <= 1'b0;
        end
    end

endmodule