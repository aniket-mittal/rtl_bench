module origen_081730 (
    input wire reset,
    input wire clock,
    input wire [1:0] parameter_selector,
    input wire [3:0] time_value,
    input wire reprogram,
    input wire [1:0] interval,
    output reg [4:0] value
);

    // Internal parameters
    localparam T_ARM_DELAY = 2'b00;
    localparam T_DRIVER_DELAY = 2'b01;
    localparam T_PASSENGER_DELAY = 2'b10;
    localparam T_ALARM_ON = 2'b11;

    // Internal registers for storing parameter values
    reg [4:0] arm_delay, driver_delay, passenger_delay, alarm_on;
    reg [4:0] next_value;

    // Synchronous logic for updating parameters and output
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            arm_delay <= 5'd6;
            driver_delay <= 5'd8;
            passenger_delay <= 5'd15;
            alarm_on <= 5'd10;
            value <= 5'd6;
        end else begin
            if (reprogram) begin
                case (parameter_selector)
                    T_ARM_DELAY: arm_delay <= {1'b0, time_value};
                    T_DRIVER_DELAY: driver_delay <= {1'b0, time_value};
                    T_PASSENGER_DELAY: passenger_delay <= {1'b0, time_value};
                    T_ALARM_ON: alarm_on <= {1'b0, time_value};
                endcase
            end
            value <= next_value;
        end
    end

    // Combinatorial logic for selecting output value
    always @(*) begin
        case (interval)
            T_ARM_DELAY: next_value = arm_delay;
            T_DRIVER_DELAY: next_value = driver_delay;
            T_PASSENGER_DELAY: next_value = passenger_delay;
            T_ALARM_ON: next_value = alarm_on;
            default: next_value = arm_delay;
        endcase
    end

endmodule