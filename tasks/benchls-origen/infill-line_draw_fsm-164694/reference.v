module origen_164694(
    input  go,
    input  [10:0] stax, stay,
    input  [10:0] endx, endy,
    input  pclk,
    output reg busy,
    output reg wr,
    output reg [18:0] addr
);

// Internal signals
reg [10:0] x, y, next_x, next_y;
reg [10:0] deltax, deltay;
reg right, down;
reg [10:0] err;
reg complete;

// States
localparam IDLE = 2'b00;
localparam RUN  = 2'b01;
localparam DONE = 2'b10;
reg [1:0] state, next_state;

always @(posedge pclk) begin
    state <= next_state;
end

always @(*) begin
    next_state = state;
    case (state)
        IDLE: begin
            if (go) begin
                next_state = RUN;
            end
        end
        RUN: begin
            if (complete) begin
                next_state = DONE;
            end
        end
        DONE: begin
            if (go) begin
                next_state = RUN;
            end
        end
    endcase
end

always @(posedge pclk) begin
    if (state == IDLE) begin
        x <= stax;
        y <= stay;
        deltax <= endx - stax;
        deltay <= endy - stay;
        right <= (deltax >= 0);
        down <= (deltay >= 0);
        err <= 0;
        complete <= 0;
        busy <= 0;
        wr <= 0;
        addr <= 0;
    end else if (state == RUN) begin
        busy <= 1;
        wr <= 1;
        addr <= {y, x};

        if (right) begin
            if (down) begin
                if (err - deltay >= 0) begin
                    next_x <= x + 1;
                    next_y <= y + 1;
                    err <= err - deltay;
                end else begin
                    next_x <= x + 1;
                    next_y <= y;
                    err <= err + deltax;
                end
            end else begin
                if (err + deltay >= 0) begin
                    next_x <= x + 1;
                    next_y <= y - 1;
                    err <= err + deltay;
                end else begin
                    next_x <= x + 1;
                    next_y <= y;
                    err <= err + deltax;
                end
            end
        end else begin
            if (down) begin
                if (err + deltax >= 0) begin
                    next_x <= x - 1;
                    next_y <= y + 1;
                    err <= err + deltax;
                end else begin
                    next_x <= x;
                    next_y <= y + 1;
                    err <= err + deltay;
                end
            end else begin
                if (err - deltax >= 0) begin
                    next_x <= x - 1;
                    next_y <= y - 1;
                    err <= err - deltax;
                end else begin
                    next_x <= x;
                    next_y <= y - 1;
                    err <= err + deltay;
                end
            end
        end

        x <= next_x;
        y <= next_y;

        if ((x == endx && y == endy) || (x == stax && y == stay)) begin
            complete <= 1;
            busy <= 0;
            wr <= 0;
        end
    end else begin // state == DONE
        busy <= 0;
        wr <= 0;
    end
end

endmodule