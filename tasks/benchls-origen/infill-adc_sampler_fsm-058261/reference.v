module origen_058261 (
    input wire clock,
    input wire reset,
    input wire start,
    input wire SDO,
    output reg CLK,
    output reg CNV,
    output wire SDI,
    output reg sample_rdy,
    output reg [15:0] ADC_sample
);

    // State encoding
    localparam IDLE = 3'd0, START = 3'd1, WT_RDY = 3'd2, SAMPLE = 3'd3, DELAY = 3'd4, DELAY2 = 3'd5;

    reg [2:0] state, next_state;
    reg [4:0] bit_cnt;
    reg [15:0] ADC_buff;
    reg clk_en, smpl_start;
    reg SDO_prev;

    // State register
    always @(posedge clock or posedge reset) begin
        if (reset)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        next_state = state;
        case (state)
            IDLE:   if (start) next_state = START;
            START:  next_state = WT_RDY;
            WT_RDY: if (smpl_start) next_state = SAMPLE;
            SAMPLE: if (bit_cnt == 5'd16) next_state = DELAY;
            DELAY:  next_state = DELAY2;
            DELAY2: next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end

    // Output logic
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            CLK <= 1'b0;
            CNV <= 1'b0;
            sample_rdy <= 1'b0;
            ADC_sample <= 16'd0;
            ADC_buff <= 16'd0;
            bit_cnt <= 5'd0;
            clk_en <= 1'b0;
            SDO_prev <= 1'b0;
        end else begin
            SDO_prev <= SDO;
            case (state)
                IDLE: begin
                    CNV <= 1'b0;
                    sample_rdy <= 1'b0;
                    clk_en <= 1'b0;
                end
                START: begin
                    CNV <= 1'b1;
                    clk_en <= 1'b1;
                end
                WT_RDY: begin
                    CNV <= 1'b0;
                    if (SDO_prev && !SDO) smpl_start <= 1'b1;
                    else smpl_start <= 1'b0;
                end
                SAMPLE: begin
                    ADC_buff <= {ADC_buff[14:0], SDO};
                    bit_cnt <= bit_cnt + 1'b1;
                end
                DELAY: begin
                    clk_en <= 1'b0;
                    bit_cnt <= 5'd0;
                end
                DELAY2: begin
                    ADC_sample <= ADC_buff;
                    sample_rdy <= 1'b1;
                end
            endcase
        end
    end

    // Clock gating
    always @(posedge clock) begin
        CLK <= clock & clk_en;
    end

    assign SDI = 1'b0; // SDI is not used in this design

endmodule