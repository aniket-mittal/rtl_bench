module origen_017019 (
    input wire pclk,
    input wire reset,
    input wire go,
    input wire [7:0] stax, stay, endx, endy,
    output reg busy,
    output reg wr,
    output reg [15:0] addr
);

    // State definitions
    localparam IDLE_STATE = 2'b00;
    localparam RUNNING_STATE = 2'b01;
    localparam DONE_STATE = 2'b10;

    reg [1:0] state, next_state;
    reg [10:0] x0, y0, x1, y1, dx, dy, sx, sy;
    reg [10:0] err, e2, err_next;
    reg [10:0] x, y, x_next, y_next;
    reg right, down;
    reg in_loop, done, plot, start, stop;

    // State machine
    always @(posedge pclk or posedge reset) begin
        if (reset)
            state <= IDLE_STATE;
        else
            state <= next_state;
    end

    always @(*) begin
        case (state)
            IDLE_STATE: next_state = start ? RUNNING_STATE : IDLE_STATE;
            RUNNING_STATE: next_state = stop ? DONE_STATE : RUNNING_STATE;
            DONE_STATE: next_state = IDLE_STATE;
            default: next_state = IDLE_STATE;
        endcase
    end

    // Control signals
    always @(*) begin
        start = (state == IDLE_STATE) && go;
        in_loop = (state == RUNNING_STATE);
        done = (state == DONE_STATE);
        busy = in_loop || done;
        plot = in_loop;
        stop = in_loop && (x == x1) && (y == y1);
    end

    // Coordinate and error calculations
    [MASKED]

    // Next state logic
    always @(*) begin
        e2 = {err[10], err[10:1]};  // e2 = err * 2
        x_next = x;
        y_next = y;
        err_next = err;

        if (e2 > -dy) begin
            err_next = err - dy;
            x_next = x + sx;
        end
        if (e2 < dx) begin
            err_next = err + dx;
            y_next = y + sy;
        end
    end

    // Output generation
    always @(*) begin
        addr = {y[7:0], x[7:0]};
        wr = plot;
    end

endmodule