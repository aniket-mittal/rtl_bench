module origen_132809 (
    // Qsys bus interface
    input wire rsi_MRST_reset,
    input wire csi_MCLK_clk,
    input wire [31:0] avs_ctrl_writedata,
    output reg [31:0] avs_ctrl_readdata,
    input wire [3:0] avs_ctrl_byteenable,
    input wire [2:0] avs_ctrl_address,
    input wire avs_ctrl_write,
    input wire avs_ctrl_read,
    output reg avs_ctrl_waitrequest,

    // Step motor interface
    output reg AX,
    output reg AY,
    output reg BX,
    output reg BY,
    output reg AE,
    output reg BE
);

    // Internal registers
    reg [31:0] pwm_frequency;
    reg [31:0] pwm_duty_cycle;
    reg motor_on;
    reg motor_direction;
    reg [1:0] current_state;

    // PWM counter
    reg [31:0] pwm_counter;
    wire pwm_out;

    // State machine parameters
    localparam S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

    // PWM generation
    always @(posedge csi_MCLK_clk or posedge rsi_MRST_reset) begin
        if (rsi_MRST_reset) begin
            pwm_counter <= 32'd0;
        end else begin
            if (pwm_counter >= pwm_frequency) begin
                pwm_counter <= 32'd0;
            end else begin
                pwm_counter <= pwm_counter + 1;
            end
        end
    end

    assign pwm_out = (pwm_counter < pwm_duty_cycle);

    // Motor control logic
    always @(posedge csi_MCLK_clk or posedge rsi_MRST_reset) begin
        if (rsi_MRST_reset) begin
            current_state <= S0;
            {AX, AY, BX, BY} <= 4'b0000;
            {AE, BE} <= 2'b00;
        end else if (motor_on) begin
            {AE, BE} <= 2'b11;
            case (current_state)
                S0: {AX, AY, BX, BY} <= motor_direction ? 4'b1000 : 4'b0010;
                S1: {AX, AY, BX, BY} <= motor_direction ? 4'b1010 : 4'b1000;
                S2: {AX, AY, BX, BY} <= motor_direction ? 4'b0010 : 4'b1010;
                S3: {AX, AY, BX, BY} <= motor_direction ? 4'b0000 : 4'b0000;
            endcase
            current_state <= motor_direction ? current_state + 1 : current_state - 1;
        end else begin
            {AX, AY, BX, BY} <= 4'b0000;
            {AE, BE} <= 2'b00;
        end
    end

    // Qsys bus interface logic
    always @(posedge csi_MCLK_clk or posedge rsi_MRST_reset) begin
        if (rsi_MRST_reset) begin
            pwm_frequency <= 32'd1000;
            pwm_duty_cycle <= 32'd500;
            motor_on <= 1'b0;
            motor_direction <= 1'b0;
            avs_ctrl_readdata <= 32'd0;
            avs_ctrl_waitrequest <= 1'b0;
        end else begin
            if (avs_ctrl_write) begin
                case (avs_ctrl_address)
                    3'b000: pwm_frequency <= avs_ctrl_writedata;
                    3'b001: pwm_duty_cycle <= avs_ctrl_writedata;
                    3'b010: motor_on <= avs_ctrl_writedata[0];
                    3'b011: motor_direction <= avs_ctrl_writedata[0];
                endcase
            end else if (avs_ctrl_read) begin
                case (avs_ctrl_address)
                    3'b000: avs_ctrl_readdata <= pwm_frequency;
                    3'b001: avs_ctrl_readdata <= pwm_duty_cycle;
                    3'b010: avs_ctrl_readdata <= {31'd0, motor_on};
                    3'b011: avs_ctrl_readdata <= {31'd0, motor_direction};
                    default: avs_ctrl_readdata <= 32'd0;
                endcase
            end
        end
    end

endmodule