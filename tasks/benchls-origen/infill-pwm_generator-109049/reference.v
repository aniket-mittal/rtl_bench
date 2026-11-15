module origen_109049 (
    input wire [15:0] Top,
    input wire clk_enabled,
    input wire KEY,
    output reg GPIO_2
);

    reg [15:0] PWM_Counter;
    reg [15:0] Compare;
    reg [1:0] state;
    wire clk;

    localparam s0 = 2'b00;
    localparam s1 = 2'b01;
    localparam s2 = 2'b10;

    assign clk = KEY ? clk_enabled : 1'b0;

    always @(posedge clk or negedge KEY) begin
        if (!KEY) begin
            state <= s0;
            PWM_Counter <= 16'd0;
            GPIO_2 <= 1'b0;
        end else begin
            case (state)
                s0: begin
                    PWM_Counter <= 16'd0;
                    GPIO_2 <= 1'b0;
                    Compare <= Top >> 1; // Set Compare to half of Top
                    state <= s1;
                end
                s1: begin
                    if (PWM_Counter == Compare) begin
                        GPIO_2 <= 1'b1;
                        state <= s2;
                    end
                    PWM_Counter <= PWM_Counter + 1'b1;
                end
                s2: begin
                    if (PWM_Counter == Top) begin
                        GPIO_2 <= 1'b0;
                        PWM_Counter <= 16'd0;
                        state <= s1;
                    end else begin
                        PWM_Counter <= PWM_Counter + 1'b1;
                    end
                end
                default: state <= s0;
            endcase
        end
    end

endmodule