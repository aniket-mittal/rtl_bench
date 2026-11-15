module origen_162416(
    input clk,
    input reset,
    input umbralMF,
    input umbralVC,
    input umbralD,
    input Fifo_empties,
    input Fifo_errors,
    input init,
    output reg init_out,
    output reg idle_out,
    output reg active_out,
    output reg error_out,
    output reg [7:0] umbralMF_out,
    output reg [7:0] umbralVC_out,
    output reg [7:0] umbralD_out,
    output reg [2:0] state,
    output reg [2:0] next_state
);

parameter RESET = 3'b000;
parameter INIT = 3'b001;
parameter IDLE = 3'b010;
parameter ACTIVE = 3'b011;
parameter ERROR = 3'b100;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= RESET;
        umbralMF_out <= 8'd0;
        umbralVC_out <= 8'd0;
        umbralD_out <= 8'd0;
    end
    else begin
        state <= next_state;
        case (state)
            RESET: begin
                init_out <= 1'b0;
                idle_out <= 1'b0;
                active_out <= 1'b0;
                error_out <= 1'b0;
                umbralMF_out <= 8'd0;
                umbralVC_out <= 8'd0;
                umbralD_out <= 8'd0;
                if (init) begin
                    next_state <= INIT;
                end
                else begin
                    next_state <= RESET;
                end
            end
            INIT: begin
                init_out <= 1'b1;
                idle_out <= 1'b0;
                active_out <= 1'b0;
                error_out <= 1'b0;
                umbralMF_out <= umbralMF;
                umbralVC_out <= umbralVC;
                umbralD_out <= umbralD;
                next_state <= IDLE;
            end
            IDLE: begin
                init_out <= 1'b0;
                idle_out <= 1'b1;
                active_out <= 1'b0;
                error_out <= 1'b0;
                if (Fifo_empties && Fifo_errors) begin
                    next_state <= ACTIVE;
                end
                else begin
                    next_state <= IDLE;
                end
            end
            ACTIVE: begin
                init_out <= 1'b0;
                idle_out <= 1'b0;
                active_out <= 1'b1;
                error_out <= 1'b0;
                if (Fifo_empties || Fifo_errors) begin
                    next_state <= ERROR;
                end
                else begin
                    next_state <= IDLE;
                end
            end
            ERROR: begin
                init_out <= 1'b0;
                idle_out <= 1'b0;
                active_out <= 1'b0;
                error_out <= 1'b1;
                if (reset) begin
                    next_state <= RESET;
                end
                else begin
                    next_state <= ERROR;
                end
            end
            default: begin
                next_state <= RESET;
            end
        endcase
    end
end

endmodule