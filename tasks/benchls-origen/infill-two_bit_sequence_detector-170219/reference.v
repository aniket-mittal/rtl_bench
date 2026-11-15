module origen_170219(
    input sclk,
    input rst_n,
    input A,
    output reg k1,
    output reg k2
);

    reg [1:0] state;
    localparam IDLE = 2'b00, START = 2'b01, STOP = 2'b10, CLEAR = 2'b11;

    always @(posedge sclk or negedge rst_n) begin
        if (!rst_n) begin
            state <= IDLE;
            k1 <= 1'b0;
            k2 <= 1'b0;
        end
        else begin
            case (state)
                IDLE: begin
                    if (A) state <= START;
                    else state <= IDLE;
                    k1 <= (A) ? 1'b0 : k1;
                    k2 <= 1'b0;
                end
                START: begin
                    if (!A) state <= STOP;
                    else state <= START;
                    k1 <= 1'b0;
                    k2 <= 1'b0;
                end
                STOP: begin
                    if (A) state <= CLEAR;
                    else state <= STOP;
                    k1 <= 1'b0;
                    k2 <= (A) ? 1'b1 : k2;
                end
                CLEAR: begin
                    if (!A) state <= IDLE;
                    else state <= CLEAR;
                    k1 <= (A) ? 1'b1 : k1;
                    k2 <= 1'b0;
                end
                default: begin
                    state <= IDLE;
                    k1 <= 1'b0;
                    k2 <= 1'b0;
                end
            endcase
        end
    end

endmodule