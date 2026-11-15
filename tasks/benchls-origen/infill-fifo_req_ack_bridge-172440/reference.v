module origen_172440 #(
    parameter width = 8,
    parameter depth = 16,
    parameter fifo = $clog2(depth)
)(
    input clk,
    input reset_n,
    input valid,
    input ack,
    input [width-1:0] data_in,
    output reg req,
    output reg ready,
    output reg [width-1:0] data_out
);

    // FIFO buffer
    reg [width-1:0] mem [depth-1:0];
    reg [fifo-1:0] tail, head;

    // FIFO status signals
    wire empty = (tail == head);
    wire full = (tail == (head + 1'b1)) | (tail == 0 && head == depth - 1);

    // State machines
    reg [1:0] state_s, state_r;
    localparam IDLE = 2'b00, SEND = 2'b01, RECEIVE = 2'b10, FINISH = 2'b11;

    // Send operation
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            state_s <= IDLE;
            req <= 1'b0;
        end else begin
            case (state_s)
                IDLE: begin
                    if (!ack && !empty) begin
                        state_s <= SEND;
                    end
                end
                SEND: begin
                    head <= head + 1'b1;
                    if (head == depth - 1) begin
                        head <= 0;
                    end
                    data_out <= mem[head];
                    req <= 1'b1;
                    state_s <= FINISH;
                end
                FINISH: begin
                    if (ack) begin
                        req <= 1'b0;
                        state_s <= IDLE;
                    end
                end
                default: state_s <= IDLE;
            endcase
        end
    end

    // Receive operation
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            state_r <= IDLE;
            ready <= 1'b0;
        end else begin
            case (state_r)
                IDLE: begin
                    if (valid && !full) begin
                        state_r <= RECEIVE;
                    end
                end
                RECEIVE: begin
                    mem[tail] <= data_in;
                    tail <= tail + 1'b1;
                    if (tail == depth - 1) begin
                        tail <= 0;
                    end
                    state_r <= FINISH;
                end
                FINISH: begin
                    ready <= 1'b1;
                    if (!valid) begin
                        ready <= 1'b0;
                        state_r <= IDLE;
                    end
                end
                default: state_r <= IDLE;
            endcase
        end
    end

endmodule