module origen_085311 (
    input wire clk,
    input wire reset,
    input wire enable,
    input wire canLeft,
    input wire canRight,
    output reg [1:0] Motion
);

    // State encoding
    localparam [1:0] NO_MOTION = 2'b00,
                     LEFT      = 2'b01,
                     RIGHT     = 2'b10,
                     DOWN      = 2'b11;

    reg [1:0] currentState, nextState;
    reg [1:0] lastMotion;

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            currentState <= NO_MOTION;
            lastMotion <= NO_MOTION;
        end else begin
            currentState <= nextState;
            lastMotion <= Motion;
        end
    end

    // Next state logic
    always @(*) begin
        if (enable) begin
            case (currentState)
                NO_MOTION: nextState = canRight ? RIGHT : DOWN;
                RIGHT:     nextState = canRight ? RIGHT : DOWN;
                DOWN:      nextState = canLeft ? LEFT : (canRight ? RIGHT : NO_MOTION);
                LEFT:      nextState = canLeft ? LEFT : DOWN;
                default:   nextState = NO_MOTION;
            endcase
        end else begin
            nextState = currentState;
        end
    end

    // Output logic
    always @(*) begin
        if (enable) begin
            Motion = currentState;
        end else begin
            Motion = NO_MOTION;
        end
    end

endmodule