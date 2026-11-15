module origen_038774 (
    input wire clk,
    input wire reset,
    input wire nozzleSwitch,
    input wire pressureSensor,
    output reg fuel_out,
    output reg [2:0] State_out
);

    // State encoding
    parameter [2:0] State_0 = 3'b000,
                    State_1 = 3'b001,
                    State_2 = 3'b010,
                    State_3 = 3'b011,
                    State_4 = 3'b100;

    reg [2:0] current_state, next_state;

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= State_0;
        else
            current_state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            State_0: next_state = (nozzleSwitch && pressureSensor) ? State_2 : State_1;
            State_1: next_state = (nozzleSwitch && pressureSensor) ? State_2 : State_1;
            State_2: next_state = (nozzleSwitch && pressureSensor) ? State_4 : State_3;
            State_3: next_state = (nozzleSwitch && pressureSensor) ? State_4 : State_3;
            State_4: next_state = State_4;
            default: next_state = State_0;
        endcase
    end

    // Output logic
    always @(*) begin
        case (current_state)
            State_0: fuel_out = 1'b0;
            State_1: fuel_out = 1'b1;
            State_2: fuel_out = 1'b0;
            State_3: fuel_out = 1'b1;
            State_4: fuel_out = 1'b0;
            default: fuel_out = 1'b0;
        endcase
    end

    // State output
    always @(*) begin
        State_out = current_state;
    end

endmodule