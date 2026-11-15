module origen_199211 (
    input Go,
    input clk,
    input rst,
    output reg Load,
    output reg Led_idle,
    output reg Led_wait,
    output reg Led_rdy
);

    reg [2:0] state;
    parameter S_IDLE = 3'b000, S_LOAD = 3'b001, S_WAIT = 3'b010, S_READY = 3'b011, ERROR = 3'b100, RESET = 3'b111;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= RESET;
        end
        else begin
            case (state)
                S_IDLE: begin
                    if (Go) begin
                        state <= S_LOAD;
                    end
                    else begin
                        state <= S_IDLE;
                    end
                end
                S_LOAD: begin
                    state <= S_WAIT;
                end
                S_WAIT: begin
                    if (!Go) begin
                        state <= S_READY;
                    end
                    else begin
                        state <= S_WAIT;
                    end
                end
                S_READY: begin
                    state <= S_IDLE;
                end
                ERROR: begin
                    state <= RESET;
                end
                RESET: begin
                    state <= S_IDLE;
                end
                default: begin
                    state <= ERROR;
                end
            endcase
        end
    end

    always @(*) begin
        case (state)
            S_IDLE: begin
                Load = 1'b0;
                Led_idle = 1'b1;
                Led_wait = 1'b0;
                Led_rdy = 1'b0;
            end
            S_LOAD: begin
                Load = 1'b1;
                Led_idle = 1'b0;
                Led_wait = 1'b0;
                Led_rdy = 1'b0;
            end
            S_WAIT: begin
                Load = 1'b0;
                Led_idle = 1'b0;
                Led_wait = 1'b1;
                Led_rdy = 1'b0;
            end
            S_READY: begin
                Load = 1'b0;
                Led_idle = 1'b0;
                Led_wait = 1'b0;
                Led_rdy = 1'b1;
            end
            ERROR: begin
                Load = 1'b0;
                Led_idle = 1'b0;
                Led_wait = 1'b0;
                Led_rdy = 1'b0;
            end
            RESET: begin
                Load = 1'b0;
                Led_idle = 1'b1;
                Led_wait = 1'b0;
                Led_rdy = 1'b0;
            end
            default: begin
                Load = 1'b0;
                Led_idle = 1'b0;
                Led_wait = 1'b0;
                Led_rdy = 1'b0;
            end
        endcase
    end

endmodule