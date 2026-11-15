module origen_102778 (
    input wire i_rst, i_stop, i_playpause, i_record,
    input wire i_BCLK, i_LRC, i_DAT,
    input wire i_Memory_full_flag,
    output reg sram_start,
    output reg o_reset_all_sram_addr,
    output reg [15:0] o_sram_data,
    output reg [1:0] state_denote
);

    // State definitions
    localparam RESET = 2'b00;
    localparam RECORD = 2'b01;
    localparam PAUSE = 2'b10;

    reg [1:0] current_state, next_state;
    reg [15:0] buffer_o_sram_data_r;
    reg [4:0] bit_counter;
    reg data_finish_r;

    // State transition logic
    always @(posedge i_BCLK or posedge i_rst) begin
        if (i_rst)
            current_state <= RESET;
        else
            current_state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            RESET: next_state = (i_playpause && i_record && !i_stop) ? RECORD : RESET;
            RECORD: begin
                if (i_stop || !i_record)
                    next_state = RESET;
                else if (i_playpause || i_Memory_full_flag)
                    next_state = PAUSE;
                else
                    next_state = RECORD;
            end
            PAUSE: begin
                if (i_stop || !i_record)
                    next_state = RESET;
                else if (i_playpause && !i_Memory_full_flag)
                    next_state = RECORD;
                else
                    next_state = PAUSE;
            end
            default: next_state = RESET;
        endcase
    end

    // Audio data sampling and processing
    always @(posedge i_BCLK) begin
        if (current_state == RECORD) begin
            if (i_LRC) begin
                buffer_o_sram_data_r <= {buffer_o_sram_data_r[14:0], i_DAT};
                bit_counter <= bit_counter + 1;
                if (bit_counter == 5'd15) begin
                    data_finish_r <= 1'b1;
                    bit_counter <= 5'd0;
                end else begin
                    data_finish_r <= 1'b0;
                end
            end
        end else begin
            buffer_o_sram_data_r <= 16'd0;
            bit_counter <= 5'd0;
            data_finish_r <= 1'b0;
        end
    end

    // Output logic
    always @(posedge i_BCLK) begin
        case (current_state)
            RESET: begin
                sram_start <= 1'b0;
                o_reset_all_sram_addr <= 1'b1;
                o_sram_data <= 16'd0;
            end
            RECORD: begin
                sram_start <= data_finish_r;
                o_reset_all_sram_addr <= 1'b0;
                if (data_finish_r)
                    o_sram_data <= buffer_o_sram_data_r;
            end
            PAUSE: begin
                sram_start <= 1'b0;
                o_reset_all_sram_addr <= 1'b0;
                o_sram_data <= 16'd0;
            end
        endcase
        state_denote <= current_state;
    end

endmodule