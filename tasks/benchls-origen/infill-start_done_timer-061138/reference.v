module origen_061138 (
    input wire CLK_50MHZ,
    input wire RST,
    input wire start,
    output reg done
);

    // State encoding
    localparam IDLE = 2'd0,
               COUNTING = 2'd1,
               STOP = 2'd2;

    // State and counter registers
    reg [1:0] state, next;
    reg [2:0] cnt, next_cnt;

    // Sequential logic
    always @(posedge CLK_50MHZ or posedge RST) begin
        if (RST) begin
            state <= IDLE;
            cnt <= 3'd0;
        end else begin
            state <= next;
            cnt <= next_cnt;
        end
    end

    // Combinational logic
    always @(*) begin
        next = state;
        next_cnt = cnt;
        done = 1'b0;

        case (state)
            IDLE: begin
                if (start) begin
                    next = COUNTING;
                    next_cnt = 3'd0;
                end
            end
            COUNTING: begin
                if (cnt > 3'd5) begin
                    next = STOP;
                end else begin
                    next_cnt = cnt + 1'b1;
                end
            end
            STOP: begin
                done = 1'b1;
                next = IDLE;
            end
            default: next = IDLE;
        endcase
    end

endmodule