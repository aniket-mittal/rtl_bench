module origen_059907 (
    input  wire        clock_clk,
    input  wire        reset_reset,
    
    // Avalon MM Slave Interface
    input  wire [7:0]  avs_s0_address,
    input  wire        avs_s0_read,
    input  wire        avs_s0_write,
    output reg  [31:0] avs_s0_readdata,
    input  wire [31:0] avs_s0_writedata,
    output wire        avs_s0_waitrequest,
    
    // Motor Control Signals
    output reg  [15:0] RPM,
    input  wire [15:0] PWM,
    output reg  [15:0] KP,
    output reg  [15:0] KI,
    output reg  [15:0] KD,
    input  wire        DIR
);

    // Constant wait request
    assign avs_s0_waitrequest = 1'b0;

    // Read operation
    always @(*) begin
        case (avs_s0_address)
            8'd0:    avs_s0_readdata = {16'b0, PWM};
            8'd1:    avs_s0_readdata = {31'b0, DIR};
            8'd2:    avs_s0_readdata = {16'b0, RPM};
            8'd3:    avs_s0_readdata = {16'b0, KP};
            8'd4:    avs_s0_readdata = {16'b0, KI};
            8'd5:    avs_s0_readdata = {16'b0, KD};
            default: avs_s0_readdata = 32'b0;
        endcase
    end

    // Write operation
    always @(posedge clock_clk or posedge reset_reset) begin
        if (reset_reset) begin
            RPM <= 16'b0;
            KP  <= 16'b0;
            KI  <= 16'b0;
            KD  <= 16'b0;
        end else if (avs_s0_write) begin
            case (avs_s0_address)
                8'd0: RPM <= avs_s0_writedata[15:0];
                8'd1: KP  <= avs_s0_writedata[15:0];
                8'd2: KI  <= avs_s0_writedata[15:0];
                8'd3: KD  <= avs_s0_writedata[15:0];
            endcase
        end
    end

endmodule