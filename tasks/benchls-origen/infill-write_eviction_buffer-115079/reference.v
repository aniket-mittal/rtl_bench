module origen_115079 #(
    parameter hold_time = 10
) (
    input logic clk,
    input logic rst,
    
    // CPU side interface
    input logic [31:0] address,
    input logic read,
    input logic write,
    output logic [31:0] rdata,
    input logic [31:0] wdata,
    output logic resp,
    
    // Memory side interface
    output logic [31:0] pmem_address,
    output logic pmem_read,
    output logic pmem_write,
    input logic [31:0] pmem_rdata,
    output logic [31:0] pmem_wdata,
    input logic pmem_resp
);

    typedef enum logic [1:0] {
        buffer_unoccupied,
        buffer_occupied,
        writing
    } state_t;

    state_t state, next_state;
    logic [31:0] address_evicted, data_evicted;
    logic [$clog2(hold_time):0] delay_time;

    always_ff @(posedge clk) begin
        if (rst) begin
            state <= buffer_unoccupied;
            address_evicted <= '0;
            data_evicted <= '0;
            delay_time <= '0;
        end else begin
            state <= next_state;
            if (write && (state == buffer_unoccupied || state == buffer_occupied)) begin
                address_evicted <= address;
                data_evicted <= wdata;
                delay_time <= '0;
            end else if (state == buffer_occupied) begin
                delay_time <= delay_time + 1;
            end
        end
    end

    always_comb begin
        next_state = state;
        pmem_address = '0;
        pmem_read = 1'b0;
        pmem_write = 1'b0;
        pmem_wdata = '0;
        rdata = '0;
        resp = 1'b0;

        case (state)
            buffer_unoccupied: begin
                if (write) begin
                    next_state = buffer_occupied;
                    resp = 1'b1;
                end else if (read) begin
                    pmem_address = address;
                    pmem_read = 1'b1;
                    rdata = pmem_rdata;
                    resp = pmem_resp;
                end
            end

            buffer_occupied: begin
                if (write) begin
                    next_state = writing;
                    resp = 1'b1;
                end else if (read) begin
                    if (address == address_evicted) begin
                        rdata = data_evicted;
                        resp = 1'b1;
                        next_state = buffer_unoccupied;
                    end else begin
                        pmem_address = address;
                        pmem_read = 1'b1;
                        rdata = pmem_rdata;
                        resp = pmem_resp;
                    end
                end else if (delay_time >= hold_time) begin
                    next_state = writing;
                end
            end

            writing: begin
                pmem_address = address_evicted;
                pmem_write = 1'b1;
                pmem_wdata = data_evicted;
                if (pmem_resp) begin
                    next_state = buffer_unoccupied;
                end
                if (read) begin
                    if (address == address_evicted) begin
                        rdata = data_evicted;
                        resp = 1'b1;
                    end else begin
                        pmem_address = address;
                        pmem_read = 1'b1;
                        rdata = pmem_rdata;
                        resp = pmem_resp;
                    end
                end
                if (write) begin
                    resp = 1'b1;
                    next_state = buffer_occupied;
                end
            end
        endcase
    end

endmodule