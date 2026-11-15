module origen_053259 (
    input wire clk,
    input wire reset_n,
    input wire [15:0] HVVoltage,
    output reg discharge_ctrl
);

// State definitions
localparam WAIT = 1'b0;
localparam DISCHARGE = 1'b1;

// Registers
reg state, next_state;
reg [31:0] discharge_counter;
reg [15:0] prev_voltage;
reg start;

// State machine
[MASKED]

// Next state logic
always @(*) begin
    next_state = state;
    start = (HVVoltage > prev_voltage);
    
    case (state)
        WAIT:
            if (start) next_state = DISCHARGE;
        DISCHARGE:
            if (discharge_counter >= 32'd300_000_000) next_state = WAIT;
    endcase
end

endmodule