module origen_057103 (
    input wire clk,
    input wire resetn,
    input wire data_valid,
    input wire start_frame,
    input wire end_frame,
    input wire [11:0] x,
    input wire [8:0] y,
    input wire [4:0] r,
    input wire [4:0] g,
    input wire [4:0] b,
    input wire [1:0] color,
    input wire [4:0] r_min, r_max,
    input wire [4:0] g_min, g_max,
    input wire [4:0] b_min, b_max,
    input wire [15:0] min_total,
    output reg [31:0] x_led_acc,
    output reg [31:0] y_led_acc,
    output reg [31:0] total_acc,
    output reg divby0
);

    localparam IDLE = 2'b00;
    localparam FRAME_START = 2'b01;
    localparam PROCESS_PIXEL = 2'b10;

    reg [1:0] state, next_state;
    reg [31:0] x_acc, y_acc, total;
    reg [4:0] selected_color;
    wire color_in_range;

    always @(*) begin
        case (color)
            2'b00: selected_color = r;
            2'b01: selected_color = g;
            2'b10: selected_color = b;
            default: selected_color = 5'b0;
        endcase
    end

    assign color_in_range = (color == 2'b00 && r >= r_min && r <= r_max) ||
                            (color == 2'b01 && g >= g_min && g <= g_max) ||
                            (color == 2'b10 && b >= b_min && b <= b_max);

    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            state <= IDLE;
            x_acc <= 32'b0;
            y_acc <= 32'b0;
            total <= 32'b0;
        end else begin
            state <= next_state;
            if (state == PROCESS_PIXEL && data_valid && color_in_range) begin
                x_acc <= x_acc + (x * selected_color);
                y_acc <= y_acc + (y * selected_color);
                total <= total + selected_color;
            end else if (state == FRAME_START) begin
                x_acc <= 32'b0;
                y_acc <= 32'b0;
                total <= 32'b0;
            end
        end
    end

    always @(*) begin
        case (state)
            IDLE: next_state = start_frame ? FRAME_START : IDLE;
            FRAME_START: next_state = PROCESS_PIXEL;
            PROCESS_PIXEL: next_state = end_frame ? IDLE : PROCESS_PIXEL;
            default: next_state = IDLE;
        endcase
    end

    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            x_led_acc <= 32'b0;
            y_led_acc <= 32'b0;
            total_acc <= 32'b0;
            divby0 <= 1'b0;
        end else if (end_frame) begin
            if (total <= min_total) begin
                x_led_acc <= 32'b0;
                y_led_acc <= y_acc;
                total_acc <= 32'd1;
                divby0 <= 1'b0;
            end else begin
                x_led_acc <= x_acc;
                y_led_acc <= y_acc;
                total_acc <= total;
                divby0 <= (total == 32'b0);
            end
        end
    end

endmodule