module origen_151948(
    input clk,
    input reset,
    input start,
    input [31:0] pulseCount,
    input waitOnMe,
    output reg pulse
);

    reg [31:0] count;
    reg [1:0] state;
    parameter IDLE = 2'd0, PULSING = 2'd1;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            count <= 32'd0;
            pulse <= 1'b0;
        end
        else begin
            case (state)
                IDLE: begin
                    if (start) begin
                        state <= PULSING;
                        count <= 32'd0;
                        pulse <= 1'b1;
                    end
                    else begin
                        pulse <= 1'b0;
                    end
                end
                PULSING: begin
                    count <= count + 32'd1;
                    if (count == pulseCount - 32'd1 && waitOnMe) begin
                        state <= IDLE;
                        pulse <= 1'b0;
                    end
                    else begin
                        pulse <= 1'b1;
                    end
                end
                default: begin
                    state <= IDLE;
                    count <= 32'd0;
                    pulse <= 1'b0;
                end
            endcase
        end
    end

endmodule