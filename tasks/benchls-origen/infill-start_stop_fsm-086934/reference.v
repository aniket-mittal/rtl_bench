module origen_086934 (
    input wire clk,
    input wire rst_n,
    input wire A,
    output reg k1,
    output reg k2,
    output reg [1:0] State
);

    // State encoding
    localparam IDLE  = 2'b00;
    localparam START = 2'b01;
    localparam STOP  = 2'b10;
    localparam CLEAR = 2'b11;

    reg [1:0] next_state;

    // State transition and output logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            State <= IDLE;
            k1 <= 1'b0;
            k2 <= 1'b0;
        end else begin
            State <= next_state;
            case (State)
                IDLE: begin
                    k1 <= 1'b0;
                    k2 <= 1'b0;
                end
                STOP: begin
                    if (A) k2 <= 1'b1;
                end
                CLEAR: begin
                    if (!A) begin
                        k1 <= 1'b1;
                        k2 <= 1'b0;
                    end
                end
            endcase
        end
    end

    // Next state logic
    always @(*) begin
        case (State)
            IDLE:  next_state = A ? START : IDLE;
            START: next_state = A ? START : STOP;
            STOP:  next_state = A ? CLEAR : STOP;
            CLEAR: next_state = CLEAR;
            default: next_state = IDLE;
        endcase
    end

endmodule