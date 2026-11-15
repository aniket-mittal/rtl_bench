module origen_006937 (
    input wire clk,
    input wire rst,
    input wire [47:0] din,
    input wire empty,
    input wire almost_empty,
    input wire full,
    input wire [31:0] total,
    input wire ready,
    input wire finish_ack,
    output reg rd_en,
    output reg wr_en,
    output wire [47:0] dout,
    output reg ack,
    output reg finish
);

    // State encoding
    localparam [1:0] 
        IDLE   = 2'b00,
        READY  = 2'b01,
        COUNT  = 2'b10,
        FINISH = 2'b11;

    reg [1:0] state, next_state;
    reg [31:0] cnt, total_reg;
    reg ready_r, finish_ack_r;
    wire ready_posedge, finish_ack_posedge;

    // Edge detection
    assign ready_posedge = ready & ~ready_r;
    assign finish_ack_posedge = finish_ack & ~finish_ack_r;

    // Direct connection of input to output
    assign dout = din;

    // State register and edge detection registers
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            ready_r <= 1'b0;
            finish_ack_r <= 1'b0;
        end else begin
            state <= next_state;
            ready_r <= ready;
            finish_ack_r <= finish_ack;
        end
    end

    // Next state logic and output control
    always @(*) begin
        next_state = state;
        rd_en = 1'b0;
        wr_en = 1'b0;
        ack = 1'b0;
        finish = 1'b0;

        case (state)
            IDLE: begin
                if (ready_posedge) begin
                    next_state = READY;
                    ack = 1'b1;
                end
            end

            READY: begin
                if (~ready) begin
                    next_state = COUNT;
                    total_reg = total;
                    cnt = total;
                end
            end

            COUNT: begin
                if (cnt > 0) begin
                    if (~empty && ~full) begin
                        rd_en = 1'b1;
                        wr_en = 1'b1;
                        cnt = cnt - 1;
                    end
                end else begin
                    next_state = FINISH;
                end
            end

            FINISH: begin
                finish = 1'b1;
                if (finish_ack_posedge) begin
                    next_state = IDLE;
                end
            end

            default: next_state = IDLE;
        endcase
    end

endmodule