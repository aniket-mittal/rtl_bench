module origen_170093(
    input clk125m,
    input reset,
    input fifo_wr_en,
    input [28:0] din,
    input [2:0] sw,
    output [7:0] led
);

reg [28:0] din_q;
reg [1:0] din_q_x;
reg [10:0] din_q_y;
reg [15:0] din_q_data;

reg [1:0] next_x;
reg [10:0] next_y;

reg [7:0] count;
reg skip1;

reg [28:0] led_din;
reg [28:0] led_din_q;
reg [7:0] led_count;

localparam INIT = 2'd0;
localparam WAIT = 2'd1;
localparam CHECK = 2'd2;
localparam STOP = 2'd3;

reg [1:0] state;

always @(posedge clk125m or posedge reset) begin
    if (reset) begin
        state <= INIT;
        din_q <= 29'b0;
        next_x <= 2'b0;
        next_y <= 11'b0;
        count <= 8'b0;
        skip1 <= 1'b1;
        led_din <= 29'b0;
        led_din_q <= 29'b0;
        led_count <= 8'b0;
    end else begin
        case (state)
            INIT: begin
                state <= WAIT;
            end
            WAIT: begin
                if (fifo_wr_en) begin
                    din_q <= din;
                    din_q_x <= din[28:27];
                    din_q_y <= din[26:16];
                    din_q_data <= din[15:0];
                    next_x <= din[28:27];
                    next_y <= din[26:16];
                    count <= 8'b1;
                    state <= CHECK;
                end
            end
            CHECK: begin
                if (fifo_wr_en) begin
                    if (skip1) begin
                        skip1 <= 1'b0;
                    end else begin
                        if (din_q_x != next_x || din_q_y != next_y) begin
                            state <= STOP;
                            led_din <= din;
                            led_din_q <= din_q;
                            led_count <= count;
                        end else begin
                            din_q <= din;
                            din_q_x <= din[28:27];
                            din_q_y <= din[26:16];
                            din_q_data <= din[15:0];
                            next_x <= din[28:27];
                            next_y <= din[26:16];
                            count <= count + 8'b1;
                        end
                    end
                end
            end
            STOP: begin
                // Wait for the next reset
            end
        endcase
    end
end

assign led = (sw == 3'b000) ? din_q[15:8] :
             (sw == 3'b001) ? din_q[7:0] :
             (sw == 3'b010) ? led_din[15:8] :
             (sw == 3'b011) ? led_din[7:0] :
             (sw == 3'b100) ? led_din_q[15:8] :
             (sw == 3'b101) ? led_din_q[7:0] :
             (sw == 3'b110) ? led_count[7:0] : 8'b0;

endmodule