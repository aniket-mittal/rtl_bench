module origen_155368(
    input [2:0] state,
    input data_in_valid,
    input pop_fifo,
    output reg [2:0] next_state,
    output reg fifo_empty,
    output reg fifo_full,
    output reg err
);

always @(*) begin
    case (state)
        3'b000: begin // Empty state
            if (~data_in_valid & ~pop_fifo) begin
                next_state = 3'b000;
                fifo_empty = 1'b1;
                fifo_full = 1'b0;
                err = 1'b0;
            end else if (data_in_valid & ~pop_fifo) begin
                next_state = 3'b001;
                fifo_empty = 1'b0;
                fifo_full = 1'b0;
                err = 1'b0;
            end else if (~data_in_valid & pop_fifo) begin
                next_state = 3'b000;
                fifo_empty = 1'b1;
                fifo_full = 1'b0;
                err = 1'b0;
            end else begin
                next_state = 3'b111;
                fifo_empty = 1'b0;
                fifo_full = 1'b0;
                err = 1'b1;
            end
        end
        3'b001: begin // Not empty, not full state
            if (~data_in_valid & ~pop_fifo) begin
                next_state = 3'b001;
                fifo_empty = 1'b0;
                fifo_full = 1'b0;
                err = 1'b0;
            end else if (data_in_valid & ~pop_fifo) begin
                next_state = 3'b010;
                fifo_empty = 1'b0;
                fifo_full = 1'b0;
                err = 1'b0;
            end else if (~data_in_valid & pop_fifo) begin
                next_state = 3'b000;
                fifo_empty = 1'b1;
                fifo_full = 1'b0;
                err = 1'b0;
            end else begin
                next_state = 3'b111;
                fifo_empty = 1'b0;
                fifo_full = 1'b0;
                err = 1'b1;
            end
        end
        3'b010: begin // Full state
            if (~data_in_valid & ~pop_fifo) begin
                next_state = 3'b010;
                fifo_empty = 1'b0;
                fifo_full = 1'b1;
                err = 1'b0;
            end else if (data_in_valid & pop_fifo) begin
                next_state = 3'b001;
                fifo_empty = 1'b0;
                fifo_full = 1'b0;
                err = 1'b0;
            end else if (~data_in_valid & pop_fifo) begin
                next_state = 3'b000;
                fifo_empty = 1'b1;
                fifo_full = 1'b0;
                err = 1'b0;
            end else begin
                next_state = 3'b111;
                fifo_empty = 1'b0;
                fifo_full = 1'b0;
                err = 1'b1;
            end
        end
        default: begin // Error state
            next_state = 3'b111;
            fifo_empty = 1'b0;
            fifo_full = 1'b0;
            err = 1'b1;
        end
    endcase
end

endmodule