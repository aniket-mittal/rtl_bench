module origen_145479 (
    // Qsys bus interface
    input  wire        rsi_MRST_reset,
    input  wire        csi_MCLK_clk,
    input  wire [31:0] avs_ctrl_writedata,
    output reg  [31:0] avs_ctrl_readdata,
    input  wire [3:0]  avs_ctrl_byteenable,
    input  wire [2:0]  avs_ctrl_address,
    input  wire        avs_ctrl_write,
    input  wire        avs_ctrl_read,
    output wire        avs_ctrl_waitrequest,

    // Brush motor interface
    output reg         HX,
    output reg         HY,
    input  wire        rsi_PWMRST_reset,
    input  wire        csi_PWMCLK_clk
);

// Register definitions
reg [31:0] pwm_frequency;
reg [31:0] pwm_width;
reg        forward_back;
reg        on_off;

// PWM counter and comparator
reg [31:0] pwm_counter;
wire       pwm_out;

// Register write logic
always @(posedge csi_MCLK_clk or posedge rsi_MRST_reset) begin
    if (rsi_MRST_reset) begin
        pwm_frequency <= 32'd0;
        pwm_width <= 32'd0;
        forward_back <= 1'b0;
        on_off <= 1'b0;
    end else if (avs_ctrl_write) begin
        case (avs_ctrl_address)
            3'b000: begin
                if (avs_ctrl_byteenable[0]) pwm_frequency[7:0]   <= avs_ctrl_writedata[7:0];
                if (avs_ctrl_byteenable[1]) pwm_frequency[15:8]  <= avs_ctrl_writedata[15:8];
                if (avs_ctrl_byteenable[2]) pwm_frequency[23:16] <= avs_ctrl_writedata[23:16];
                if (avs_ctrl_byteenable[3]) pwm_frequency[31:24] <= avs_ctrl_writedata[31:24];
            end
            3'b001: begin
                if (avs_ctrl_byteenable[0]) pwm_width[7:0]   <= avs_ctrl_writedata[7:0];
                if (avs_ctrl_byteenable[1]) pwm_width[15:8]  <= avs_ctrl_writedata[15:8];
                if (avs_ctrl_byteenable[2]) pwm_width[23:16] <= avs_ctrl_writedata[23:16];
                if (avs_ctrl_byteenable[3]) pwm_width[31:24] <= avs_ctrl_writedata[31:24];
            end
            3'b010: begin
                if (avs_ctrl_byteenable[0]) forward_back <= avs_ctrl_writedata[0];
            end
            3'b011: begin
                if (avs_ctrl_byteenable[0]) on_off <= avs_ctrl_writedata[0];
            end
        endcase
    end
end

// Register read logic
always @(posedge csi_MCLK_clk) begin
    if (avs_ctrl_read) begin
        case (avs_ctrl_address)
            3'b000: avs_ctrl_readdata <= pwm_frequency;
            3'b001: avs_ctrl_readdata <= pwm_width;
            3'b010: avs_ctrl_readdata <= {31'b0, forward_back};
            3'b011: avs_ctrl_readdata <= {31'b0, on_off};
            default: avs_ctrl_readdata <= 32'b0;
        endcase
    end
end

// PWM counter logic
always @(posedge csi_PWMCLK_clk or posedge rsi_PWMRST_reset) begin
    if (rsi_PWMRST_reset) begin
        pwm_counter <= 32'd0;
    end else begin
        if (pwm_counter >= pwm_frequency - 1) begin
            pwm_counter <= 32'd0;
        end else begin
            pwm_counter <= pwm_counter + 1;
        end
    end
end

// PWM comparator
assign pwm_out = (pwm_counter < pwm_width) ? 1'b1 : 1'b0;

// Motor control logic
always @(posedge csi_PWMCLK_clk or posedge rsi_PWMRST_reset) begin
    if (rsi_PWMRST_reset) begin
        HX <= 1'b0;
        HY <= 1'b0;
    end else begin
        if (on_off) begin
            if (forward_back) begin
                HX <= 1'b0;
                HY <= pwm_out;
            end else begin
                HX <= pwm_out;
                HY <= 1'b0;
            end
        end else begin
            HX <= 1'b0;
            HY <= 1'b0;
        end
    end
end

// No wait states
assign avs_ctrl_waitrequest = 1'b0;

endmodule