module origen_189435(
    input clk,
    input rst,
    input RX,
    input BTU,
    input DONE,
    output reg START,
    output reg DOIT
);

reg [1:0] state;
localparam INIT = 2'b00, RECV = 2'b01, LAST = 2'b10;

always @(posedge clk or negedge rst) begin
    if (!rst) begin
        state <= INIT;
        START <= 1'b0;
        DOIT <= 1'b0;
    end
    else begin
        case (state)
            INIT: begin
                START <= 1'b0;
                DOIT <= (RX == 1'b0) ? 1'b1 : 1'b0;
                if (RX == 1'b1) begin
                    state <= RECV;
                end
            end
            RECV: begin
                START <= 1'b0;
                DOIT <= (RX == 1'b0 && BTU == 1'b1) ? 1'b1 : 1'b0;
                if (RX == 1'b0 && BTU == 1'b0) begin
                    state <= LAST;
                end
            end
            LAST: begin
                START <= 1'b0;
                DOIT <= (DONE == 1'b1) ? 1'b1 : 1'b0;
                if (DONE == 1'b1) begin
                    state <= INIT;
                end
            end
            default: begin
                state <= INIT;
                START <= 1'b0;
                DOIT <= 1'b0;
            end
        endcase
    end
end

endmodule