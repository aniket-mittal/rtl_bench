module origen_093881 #(
    parameter NUM_THREAD = 32,
    parameter BIT_THREAD = $clog2(NUM_THREAD)
)(
    input wire clk,
    input wire rst_n,
    input wire we_pixel_size_MC,
    input wire init_mem_fin_MC,
    input wire patch_out_done_MC,
    input wire [31:0] pixel_size_MC,
    output reg load_start_PD,
    output reg load_done_PD,
    output reg [31:0] pixel_id_PD,
    output reg load_done_term_MC
);

    // State definition
    localparam IDLE = 2'b00;
    localparam PATCHING = 2'b01;
    localparam PATCHING_WAIT = 2'b10;

    reg [1:0] state, next_state;
    reg [31:0] pixel_max, pixel_curr;
    reg [BIT_THREAD-1:0] thread_cnt;

    // State transition logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Next state and output logic
    always @(*) begin
        next_state = state;
        load_start_PD = 1'b0;
        load_done_PD = 1'b0;
        load_done_term_MC = 1'b0;

        case (state)
            IDLE: begin
                if (init_mem_fin_MC)
                    next_state = PATCHING;
            end
            PATCHING: begin
                load_start_PD = 1'b1;
                if (thread_cnt == NUM_THREAD - 1)
                    next_state = PATCHING_WAIT;
                if (pixel_curr == pixel_max - 1) begin
                    next_state = IDLE;
                    load_done_term_MC = 1'b1;
                end
            end
            PATCHING_WAIT: begin
                if (patch_out_done_MC)
                    next_state = PATCHING;
            end
        endcase
    end

    // Pixel and thread counter logic
    [MASKED]

    // Load done signal
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            load_done_PD <= 1'b0;
        else
            load_done_PD <= (state == PATCHING && next_state == PATCHING_WAIT);
    end

endmodule