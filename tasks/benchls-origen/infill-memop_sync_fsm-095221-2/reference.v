module origen_095221 (
    input wire i_clk,
    input wire i_reset_n,
    input wire i_load,
    input wire i_store,
    input wire i_ex_rtr,
    input wire i_id_ex_rts,
    input wire i_last_uop,
    input wire i_lq_empty,
    input wire i_mem_req,
    input wire i_memop_sync_end,
    output reg o_memop_sync_start,
    output reg o_completed_valid,
    output reg o_ovi_stall,
    output reg o_is_load
);

    // FSM states
    localparam IDLE = 2'b00;
    localparam PREPARE = 2'b01;
    localparam BUSY = 2'b10;
    localparam COMMIT = 2'b11;

    reg [1:0] state, next_state;
    reg sent_sync, got_sync_end;

    // State transition logic
    always @(posedge i_clk or negedge i_reset_n) begin
        if (!i_reset_n) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end

    // Next state and output logic
    always @(*) begin
        next_state = state;
        o_memop_sync_start = 1'b0;
        o_completed_valid = 1'b0;
        o_ovi_stall = 1'b0;
        o_is_load = i_load;

        case (state)
            IDLE: begin
                if ((i_load || i_store) && i_ex_rtr && i_id_ex_rts) begin
                    if (i_last_uop) begin
                        next_state = BUSY;
                        o_memop_sync_start = 1'b1;
                    end else begin
                        next_state = PREPARE;
                    end
                end
            end

            PREPARE: begin
                if (i_last_uop) begin
                    next_state = BUSY;
                    o_memop_sync_start = 1'b1;
                end
            end

            BUSY: begin
                o_ovi_stall = 1'b1;
                if (i_memop_sync_end) begin
                    next_state = COMMIT;
                end
            end

            COMMIT: begin
                o_ovi_stall = 1'b1;
                if (i_lq_empty) begin
                    next_state = IDLE;
                    o_completed_valid = 1'b1;
                end
            end
        endcase
    end

    // Synchronization tracking
    always @(posedge i_clk or negedge i_reset_n) begin
        if (!i_reset_n) begin
            sent_sync <= 1'b0;
            got_sync_end <= 1'b0;
        end else begin
            if (o_memop_sync_start) begin
                sent_sync <= 1'b1;
            end else if (state == IDLE) begin
                sent_sync <= 1'b0;
            end

            if (i_memop_sync_end) begin
                got_sync_end <= 1'b1;
            end else if (state == IDLE) begin
                got_sync_end <= 1'b0;
            end
        end
    end

endmodule