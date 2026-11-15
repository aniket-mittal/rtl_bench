module origen_149612(
    input clock,
    input reset,
    input rx,
    input done,
    input btu,
    output reg start,
    output reg doit
);

reg [1:0] state, next_state;

localparam IDLE = 2'b00;
localparam START = 2'b01;
localparam DC = 2'b10;

always @(posedge clock) begin
    if (reset) begin
        state <= IDLE;
    end
    else begin
        state <= next_state;
    end
end

always @(*) begin
    next_state = state;
    start = 0;
    doit = 0;

    case (state)
        IDLE: begin
            if (~rx) begin
                next_state = START;
                start = 1;
                doit = 1;
            end
        end
        START: begin
            if (~rx && btu) begin
                next_state = DC;
            end
            else if (rx) begin
                next_state = IDLE;
            end
        end
        DC: begin
            doit = 1;
            if (done) begin
                next_state = IDLE;
            end
        end
    endcase
end

endmodule