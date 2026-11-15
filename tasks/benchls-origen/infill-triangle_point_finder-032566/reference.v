module origen_032566 (
    input wire clk,
    input wire reset,
    input wire nt,
    input wire [2:0] xi,
    input wire [2:0] yi,
    output reg busy,
    output reg po,
    output reg [2:0] xo,
    output reg [2:0] yo
);

    // State encoding
    localparam S_WAIT = 2'b00;
    localparam S_GET_P2 = 2'b01;
    localparam S_GET_P3 = 2'b10;
    localparam S_FIND = 2'b11;

    reg [1:0] state, next_state;
    reg [2:0] x1, y1, x2, y2, x3, y3;
    reg [2:0] x, y;
    
    // State transition logic
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= S_WAIT;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            S_WAIT:   next_state = nt ? S_GET_P2 : S_WAIT;
            S_GET_P2: next_state = S_GET_P3;
            S_GET_P3: next_state = S_FIND;
            S_FIND:   next_state = (x == 3'b111 && y == 3'b111) ? S_WAIT : S_FIND;
            default:  next_state = S_WAIT;
        endcase
    end

    // Output and internal logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            busy <= 0;
            po <= 0;
            xo <= 0;
            yo <= 0;
            x1 <= 0; y1 <= 0;
            x2 <= 0; y2 <= 0;
            x3 <= 0; y3 <= 0;
            x <= 0; y <= 0;
        end else begin
            case (state)
                S_WAIT: begin
                    busy <= 0;
                    po <= 0;
                    if (nt) begin
                        x1 <= xi;
                        y1 <= yi;
                        busy <= 1;
                    end
                end
                S_GET_P2: begin
                    x2 <= xi;
                    y2 <= yi;
                end
                S_GET_P3: begin
                    x3 <= xi;
                    y3 <= yi;
                    x <= 0;
                    y <= 0;
                end
                S_FIND: begin
                    // Point-in-triangle test using vector cross product
                    reg [3:0] dx1, dy1, dx2, dy2, dx3, dy3;
                    reg [6:0] c1, c2, c3;
                    
                    dx1 = x2 - x1;
                    dy1 = y2 - y1;
                    dx2 = x3 - x2;
                    dy2 = y3 - y2;
                    dx3 = x1 - x3;
                    dy3 = y1 - y3;
                    
                    c1 = (x - x1) * dy1 - (y - y1) * dx1;
                    c2 = (x - x2) * dy2 - (y - y2) * dx2;
                    c3 = (x - x3) * dy3 - (y - y3) * dx3;
                    
                    po <= (c1[6] == c2[6]) && (c2[6] == c3[6]);
                    xo <= x;
                    yo <= y;
                    
                    if (x == 3'b111) begin
                        x <= 0;
                        y <= y + 1;
                    end else begin
                        x <= x + 1;
                    end
                    
                    if (x == 3'b111 && y == 3'b111)
                        busy <= 0;
                end
            endcase
        end
    end

endmodule