module origen_181531(
    input clock,
    input brake,
    input [2:0] l_signal,
    input [2:0] r_signal,
    output reg [2:0] l_lights,
    output reg [2:0] r_lights,
    output reg [1:0] c_lights
);

reg brake_active;

localparam IDLE = 2'b00, BRAKE1 = 2'b01, BRAKE2 = 2'b10;
reg [1:0] state;

always @(posedge clock) begin
    case (state)
        IDLE: begin
            if (brake) begin
                state <= BRAKE1;
                brake_active <= 1;
            end else begin
                brake_active <= 0;
            end
        end
        BRAKE1: begin
            if (!brake) begin
                state <= BRAKE2;
            end
        end
        BRAKE2: begin
            if (!brake) begin
                state <= IDLE;
            end else begin
                state <= BRAKE1;
            end
        end
    endcase
end

always @(*) begin
    if (brake_active) begin
        l_lights = ~l_signal;
        r_lights = ~r_signal;
        c_lights = 2'b11;
    end else begin
        l_lights = l_signal;
        r_lights = r_signal;
        c_lights = 2'b00;
    end
end

endmodule