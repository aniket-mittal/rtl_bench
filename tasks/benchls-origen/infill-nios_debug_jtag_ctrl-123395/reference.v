module origen_123395 (
    input wire [31:0] MonDReg,
    input wire [31:0] break_readreg,
    input wire clk,
    input wire dbrk_hit0_latch,
    input wire debugack,
    input wire monitor_error,
    input wire monitor_ready,
    input wire reset_n,
    input wire resetlatch,
    input wire tracemem_on,
    input wire [35:0] tracemem_trcdata,
    input wire tracemem_tw,
    input wire [6:0] trc_im_addr,
    input wire trc_on,
    input wire trc_wrap,
    input wire [1:0] trigbrktype,
    input wire trigger_state_1,

    output reg [37:0] jdo,
    output reg jrst_n,
    output reg st_ready_test_idle,
    output reg take_action_break_a,
    output reg take_action_break_b,
    output reg take_action_break_c,
    output reg take_action_ocimem_a,
    output reg take_action_ocimem_b,
    output reg take_action_tracectrl,
    output reg take_no_action_break_a,
    output reg take_no_action_break_b,
    output reg take_no_action_break_c,
    output reg take_no_action_ocimem_a
);

    reg [3:0] state;
    reg [3:0] next_state;

    localparam IDLE = 4'b0000;
    localparam PROCESS_BREAK = 4'b0001;
    localparam PROCESS_OCIMEM = 4'b0010;
    localparam PROCESS_TRACE = 4'b0011;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            state <= IDLE;
            jrst_n <= 1'b0;
        end else begin
            state <= next_state;
            jrst_n <= 1'b1;
        end
    end

    always @(*) begin
        next_state = state;
        jdo = 38'b0;
        st_ready_test_idle = 1'b0;
        take_action_break_a = 1'b0;
        take_action_break_b = 1'b0;
        take_action_break_c = 1'b0;
        take_action_ocimem_a = 1'b0;
        take_action_ocimem_b = 1'b0;
        take_action_tracectrl = 1'b0;
        take_no_action_break_a = 1'b0;
        take_no_action_break_b = 1'b0;
        take_no_action_break_c = 1'b0;
        take_no_action_ocimem_a = 1'b0;

        case (state)
            IDLE: begin
                st_ready_test_idle = 1'b1;
                if (dbrk_hit0_latch) next_state = PROCESS_BREAK;
                else if (debugack) next_state = PROCESS_OCIMEM;
                else if (tracemem_on) next_state = PROCESS_TRACE;
            end

            PROCESS_BREAK: begin
                if (trigbrktype == 2'b00) begin
                    take_action_break_a = 1'b1;
                    jdo = {6'b0, break_readreg};
                end else if (trigbrktype == 2'b01) begin
                    take_action_break_b = 1'b1;
                    jdo = {6'b0, break_readreg};
                end else if (trigbrktype == 2'b10) begin
                    take_action_break_c = 1'b1;
                    jdo = {6'b0, break_readreg};
                end else begin
                    take_no_action_break_a = 1'b1;
                    take_no_action_break_b = 1'b1;
                    take_no_action_break_c = 1'b1;
                end
                next_state = IDLE;
            end

            PROCESS_OCIMEM: begin
                if (monitor_ready) begin
                    take_action_ocimem_a = 1'b1;
                    jdo = {6'b0, MonDReg};
                end else if (monitor_error) begin
                    take_action_ocimem_b = 1'b1;
                end else begin
                    take_no_action_ocimem_a = 1'b1;
                end
                next_state = IDLE;
            end

            PROCESS_TRACE: begin
                take_action_tracectrl = 1'b1;
                jdo = {2'b0, tracemem_trcdata};
                if (trc_wrap) next_state = IDLE;
            end

            default: next_state = IDLE;
        endcase
    end

endmodule