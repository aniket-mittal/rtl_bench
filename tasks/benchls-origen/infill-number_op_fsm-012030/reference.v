module origen_012030 (
    input wire clk,
    input wire rst,
    input wire validIn,
    input wire [7:0] dataIn,
    output reg [7:0] dataOut
);

    // State definitions
    localparam STATE_IDLE = 2'b00;
    localparam STATE_OP = 2'b01;
    localparam STATE_WAIT = 2'b10;

    // Registers
    reg [1:0] state, stateNext;
    reg [7:0] number, numberNext;
    reg [2:0] operation, operationNext;
    reg [7:0] dataOutNext;
    reg validIn_d;
    wire validIn_pos;

    // Detect positive edge of validIn
    assign validIn_pos = validIn & ~validIn_d;

    // State machine and combinational logic
    always @(*) begin
        stateNext = state;
        numberNext = number;
        operationNext = operation;
        dataOutNext = dataOut;

        case (state)
            STATE_IDLE: begin
                if (validIn_pos) begin
                    numberNext = dataIn;
                    stateNext = STATE_OP;
                end
            end

            STATE_OP: begin
                if (validIn_pos) begin
                    case (dataIn)
                        3: begin // Square
                            dataOutNext = number * number;
                            stateNext = STATE_IDLE;
                        end
                        4: begin // Add 2
                            dataOutNext = number + 8'd2;
                            stateNext = STATE_IDLE;
                        end
                        5: begin // Subtract 2
                            dataOutNext = number - 8'd2;
                            stateNext = STATE_IDLE;
                        end
                        0, 1, 2: begin // Store operation and wait for second operand
                            operationNext = dataIn[1:0];
                            stateNext = STATE_WAIT;
                        end
                        default: stateNext = STATE_IDLE;
                    endcase
                end
            end

            STATE_WAIT: begin
                if (validIn_pos) begin
                    case (operation)
                        0: dataOutNext = number * dataIn; // Multiply
                        1: dataOutNext = number + dataIn; // Add
                        2: dataOutNext = number - dataIn; // Subtract
                        default: dataOutNext = 8'd0;
                    endcase
                    stateNext = STATE_IDLE;
                end
            end

            default: stateNext = STATE_IDLE;
        endcase
    end

    // Sequential logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= STATE_IDLE;
            number <= 8'd0;
            operation <= 3'd0;
            dataOut <= 8'd0;
            validIn_d <= 1'b0;
        end else begin
            state <= stateNext;
            number <= numberNext;
            operation <= operationNext;
            dataOut <= dataOutNext;
            validIn_d <= validIn;
        end
    end

endmodule