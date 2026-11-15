module origen_104664 (
    input wire clk,
    input wire hit0, hit1,
    input wire lru_out,
    input wire dirty0_out, dirty1_out,
    input wire pmem_resp,
    input wire mem_read, mem_write,
    output reg load_data0, load_data1,
    output reg load_valid0, load_valid1,
    output reg load_tag0, load_tag1,
    output reg load_lru,
    output reg load_dirty0, load_dirty1,
    output reg datainmux_sel,
    output reg addressmux_sel,
    output reg pmem_write, pmem_read,
    output reg mem_resp
);

    // State encoding
    localparam IDLE_HIT = 2'b00;
    localparam REPLACE  = 2'b01;
    localparam EVICT    = 2'b10;

    reg [1:0] state, next_state;

    // State transition logic
    always @(posedge clk) begin
        state <= next_state;
    end

    // Next state and output logic
    always @(*) begin
        // Default output values
        load_data0 = 1'b0; load_data1 = 1'b0;
        load_valid0 = 1'b0; load_valid1 = 1'b0;
        load_tag0 = 1'b0; load_tag1 = 1'b0;
        load_lru = 1'b0;
        load_dirty0 = 1'b0; load_dirty1 = 1'b0;
        datainmux_sel = 1'b0;
        addressmux_sel = 1'b0;
        pmem_write = 1'b0;
        pmem_read = 1'b0;
        mem_resp = 1'b0;
        next_state = state;

        case (state)
            IDLE_HIT: begin
                if (hit0 || hit1) begin
                    mem_resp = 1'b1;
                    load_lru = 1'b1;
                    if (mem_write) begin
                        datainmux_sel = 1'b1;
                        if (hit0) begin
                            load_data0 = 1'b1;
                            load_dirty0 = 1'b1;
                        end else begin
                            load_data1 = 1'b1;
                            load_dirty1 = 1'b1;
                        end
                    end
                end else if (mem_read || mem_write) begin
                    if ((lru_out && dirty1_out) || (!lru_out && dirty0_out))
                        next_state = EVICT;
                    else
                        next_state = REPLACE;
                end
            end

            REPLACE: begin
                pmem_read = 1'b1;
                addressmux_sel = 1'b1;
                if (pmem_resp) begin
                    if (lru_out) begin
                        load_data1 = 1'b1;
                        load_valid1 = 1'b1;
                        load_tag1 = 1'b1;
                        load_dirty1 = mem_write;
                    end else begin
                        load_data0 = 1'b1;
                        load_valid0 = 1'b1;
                        load_tag0 = 1'b1;
                        load_dirty0 = mem_write;
                    end
                    load_lru = 1'b1;
                    datainmux_sel = mem_write;
                    next_state = IDLE_HIT;
                end
            end

            EVICT: begin
                pmem_write = 1'b1;
                addressmux_sel = 1'b1;
                if (pmem_resp)
                    next_state = REPLACE;
            end

            default: next_state = IDLE_HIT;
        endcase
    end

endmodule