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

[MASKED]

endmodule