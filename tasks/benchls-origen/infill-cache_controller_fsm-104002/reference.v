module origen_104002 (
    input wire clk,
    input wire mem_read,
    input wire mem_write,
    input wire hit,
    output reg hit_out,
    output reg dirty1_out,
    output reg dirty2_out,
    output reg valid1_out,
    output reg valid2_out,
    output reg pmem_read,
    output reg pmem_write,
    input wire pmem_resp,
    output reg [1:0] set_sel,
    output reg [1:0] tag_sel,
    output reg dirty1_in,
    output reg dirty2_in,
    output reg valid1_in,
    output reg valid2_in,
    output reg lru_in,
    output reg lru_out,
    output reg [31:0] hits,
    output reg [31:0] miss,
    output reg pmem_address_sel
);

    // State encoding
    localparam HREAD = 2'b00;
    localparam MISS_S = 2'b01;
    localparam GETD = 2'b10;

    reg [1:0] state, next_state;

    // State transition logic
    always @(posedge clk) begin
        state <= next_state;
    end

    // Next state and output logic
    always @(*) begin
        next_state = state;
        pmem_read = 1'b0;
        pmem_write = 1'b0;
        set_sel = 2'b00;
        tag_sel = 2'b00;
        dirty1_in = dirty1_out;
        dirty2_in = dirty2_out;
        valid1_in = valid1_out;
        valid2_in = valid2_out;
        lru_in = lru_out;
        pmem_address_sel = 1'b0;

        case (state)
            HREAD: begin
                if (hit) begin
                    if (mem_read) begin
                        hits = hits + 1;
                        lru_in = ~lru_out;
                    end else if (mem_write) begin
                        hits = hits + 1;
                        lru_in = ~lru_out;
                        if (lru_out == 1'b0) begin
                            dirty1_in = 1'b1;
                        end else begin
                            dirty2_in = 1'b1;
                        end
                    end
                    next_state = HREAD;
                end else begin
                    miss = miss + 1;
                    next_state = MISS_S;
                end
            end

            MISS_S: begin
                if (lru_out == 1'b0 && dirty1_out == 1'b1) begin
                    pmem_write = 1'b1;
                    pmem_address_sel = 1'b1;
                    if (pmem_resp) begin
                        next_state = GETD;
                    end
                end else if (lru_out == 1'b1 && dirty2_out == 1'b1) begin
                    pmem_write = 1'b1;
                    pmem_address_sel = 1'b1;
                    if (pmem_resp) begin
                        next_state = GETD;
                    end
                end else begin
                    next_state = GETD;
                end
            end

            GETD: begin
                pmem_read = 1'b1;
                pmem_address_sel = 1'b0;
                if (pmem_resp) begin
                    if (lru_out == 1'b0) begin
                        valid1_in = 1'b1;
                        dirty1_in = 1'b0;
                        tag_sel = 2'b01;
                    end else begin
                        valid2_in = 1'b1;
                        dirty2_in = 1'b0;
                        tag_sel = 2'b10;
                    end
                    lru_in = ~lru_out;
                    next_state = HREAD;
                end
            end

            default: next_state = HREAD;
        endcase
    end

    // Output assignments
    assign hit_out = hit;

endmodule