module origen_163177(
    input [1:0] Temperature,
    input [1:0] Pressure,
    output reg Heater,
    output reg Valve,
    output reg Alarm
);

always @(*) begin
    case ({Temperature, Pressure})
        4'b0000: begin
            Heater = 1'b1;
            Valve = 1'b1;
            Alarm = 1'b1;
        end
        4'b0001: begin
            Heater = 1'b1;
            Valve = 1'b0;
            Alarm = 1'b0;
        end
        4'b0010: begin
            Heater = 1'b1;
            Valve = 1'b0;
            Alarm = 1'b0;
        end
        4'b0011: begin
            Heater = 1'b1;
            Valve = 1'b0;
            Alarm = 1'b0;
        end
        4'b0100: begin
            Heater = 1'b0;
            Valve = 1'b0;
            Alarm = 1'b0;
        end
        4'b0101: begin
            Heater = 1'b0;
            Valve = 1'b0;
            Alarm = 1'b0;
        end
        4'b0110: begin
            Heater = 1'b0;
            Valve = 1'b1;
            Alarm = 1'b0;
        end
        4'b0111: begin
            Heater = 1'b0;
            Valve = 1'b0;
            Alarm = 1'b0;
        end
        4'b1000: begin
            Heater = 1'b0;
            Valve = 1'b0;
            Alarm = 1'b0;
        end
        4'b1001: begin
            Heater = 1'b0;
            Valve = 1'b1;
            Alarm = 1'b0;
        end
        4'b1010: begin
            Heater = 1'b0;
            Valve = 1'b0;
            Alarm = 1'b0;
        end
        4'b1011: begin
            Heater = 1'b0;
            Valve = 1'b0;
            Alarm = 1'b0;
        end
        4'b1100: begin
            Heater = 1'b0;
            Valve = 1'b0;
            Alarm = 1'b1;
        end
        4'b1101: begin
            Heater = 1'b0;
            Valve = 1'b0;
            Alarm = 1'b0;
        end
        4'b1110: begin
            Heater = 1'b0;
            Valve = 1'b0;
            Alarm = 1'b0;
        end
        4'b1111: begin
            Heater = 1'b0;
            Valve = 1'b0;
            Alarm = 1'b1;
        end
    endcase
end

endmodule