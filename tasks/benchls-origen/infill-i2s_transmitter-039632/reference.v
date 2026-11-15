module origen_039632 #(
    parameter DATA_DEPTH = 64
) (
    input wire clk_in,
    input wire rst,
    input wire send_ctrl,
    input wire [15:0] data_in,
    output reg data,
    output reg WS_reg,
    output wire sck,
    output reg rd_clk,
    output reg fifo_rden,
    output reg send_finish,
    output reg [15:0] send_num
);

    // State definition
    localparam IDLE = 2'b00;
    localparam LEFT = 2'b01;
    localparam RIGHT = 2'b10;

    reg [1:0] current_state, next_state;
    reg [4:0] bit_cnt;
    reg [15:0] shift_reg;
    reg WS_reg_d1;
    wire WS_posedge, WS_negedge;

    // State machine
    always @(posedge clk_in or negedge rst) begin
        if (!rst)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end

    always @(*) begin
        case (current_state)
            IDLE: next_state = send_ctrl ? LEFT : IDLE;
            LEFT: next_state = (bit_cnt == 5'd31) ? RIGHT : LEFT;
            RIGHT: next_state = (bit_cnt == 5'd31) ? LEFT : RIGHT;
            default: next_state = IDLE;
        endcase
    end

    // Bit counter
    always @(posedge clk_in or negedge rst) begin
        if (!rst)
            bit_cnt <= 5'd0;
        else if (current_state == IDLE)
            bit_cnt <= 5'd0;
        else
            bit_cnt <= (bit_cnt == 5'd31) ? 5'd0 : bit_cnt + 1'b1;
    end

    // Word Select generation
    always @(posedge clk_in or negedge rst) begin
        if (!rst)
            WS_reg <= 1'b0;
        else if (fifo_rden)
            WS_reg <= ~WS_reg;
    end

    // Data serialization
    always @(posedge clk_in or negedge rst) begin
        if (!rst) begin
            shift_reg <= 16'd0;
            data <= 1'b0;
        end else if (WS_posedge || WS_negedge) begin
            shift_reg <= data_in;
            data <= data_in[15];
        end else if (current_state != IDLE) begin
            shift_reg <= {shift_reg[14:0], 1'b0};
            data <= shift_reg[15];
        end
    end

    // Frame synchronization
    always @(posedge clk_in or negedge rst) begin
        if (!rst)
            WS_reg_d1 <= 1'b0;
        else
            WS_reg_d1 <= WS_reg;
    end

    assign WS_posedge = WS_reg & ~WS_reg_d1;
    assign WS_negedge = ~WS_reg & WS_reg_d1;

    // FIFO read control
    always @(posedge clk_in or negedge rst) begin
        if (!rst)
            fifo_rden <= 1'b0;
        else
            fifo_rden <= (bit_cnt == 5'd30) && (current_state != IDLE);
    end

    // Sample counter
    always @(posedge clk_in or negedge rst) begin
        if (!rst) begin
            send_num <= 16'd0;
            send_finish <= 1'b0;
        end else if (current_state == IDLE) begin
            send_num <= 16'd0;
            send_finish <= 1'b0;
        end else if (fifo_rden) begin
            if (send_num == DATA_DEPTH - 1) begin
                send_num <= 16'd0;
                send_finish <= 1'b1;
            end else begin
                send_num <= send_num + 1'b1;
                send_finish <= 1'b0;
            end
        end
    end

    // Clock outputs
    assign sck = clk_in;  // Assuming no clock division
    always @(posedge clk_in or negedge rst) begin
        if (!rst)
            rd_clk <= 1'b0;
        else
            rd_clk <= fifo_rden;
    end

endmodule