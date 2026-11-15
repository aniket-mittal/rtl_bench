module origen_150640(
    input rxd,
    input StringReady,
    input CharReady,
    input parity,
    input clk_2,
    input check,
    input reset,
    output reg ready,
    output reg error,
    output reg WriteChar,
    output reg WriteString,
    output reg PossibleStart
);

    // Define the states of the finite state machine
    localparam IDLE = 3'b000;
    localparam POSSIBLESTART = 3'b001;
    localparam READ = 3'b010;
    localparam ERROR = 3'b011;
    localparam WRITE = 3'b100;
    localparam STOP = 3'b101;

    reg [2:0] state, next_state;

    always @(posedge clk_2 or posedge reset) begin
        if (reset) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end

    always @(*) begin
        next_state = state;
        ready = 1'b0;
        error = 1'b0;
        WriteChar = 1'b0;
        WriteString = 1'b0;
        PossibleStart = 1'b0;

        case (state)
            IDLE: begin
                if (rxd == 1'b0) begin
                    next_state = POSSIBLESTART;
                    PossibleStart = 1'b1;
                end else begin
                    next_state = IDLE;
                end
            end
            POSSIBLESTART: begin
                if (check) begin
                    next_state = READ;
                end else begin
                    next_state = IDLE;
                end
            end
            READ: begin
                if (CharReady) begin
                    if (parity) begin
                        next_state = WRITE;
                        WriteChar = 1'b1;
                    end else begin
                        next_state = ERROR;
                        error = 1'b1;
                    end
                end else begin
                    next_state = READ;
                end
            end
            ERROR: begin
                next_state = STOP;
            end
            WRITE: begin
                if (StringReady) begin
                    next_state = STOP;
                    WriteString = 1'b1;
                end else begin
                    next_state = WRITE;
                end
            end
            STOP: begin
                next_state = IDLE;
                ready = 1'b1;
            end
            default: begin
                next_state = IDLE;
            end
        endcase
    end

endmodule