module origen_020349 #(
    parameter ADDR_WIDTH = 4,
    parameter AEMPTY_THRESHOLD = 2,
    parameter FIFO_DEPTH = 16
) (
    input wire [ADDR_WIDTH:0] write_ptr,
    input wire clk,
    input wire reset_n,
    input wire flush,
    input wire read_req,
    output reg read_enable,
    output reg rdata_valid,
    output wire fifo_empty,
    output wire fifo_aempty,
    output reg [ADDR_WIDTH:0] read_ptr
);

    wire [ADDR_WIDTH-1:0] read_addr;
    wire [ADDR_WIDTH-1:0] write_addr;

    assign read_addr = read_ptr[ADDR_WIDTH-1:0];
    assign write_addr = write_ptr[ADDR_WIDTH-1:0];

    // FIFO empty detection
    assign fifo_empty = (read_ptr == write_ptr);

    // Read enable logic
    always @(*) begin
        read_enable = read_req && !fifo_empty;
    end

    // Almost empty detection
    assign fifo_aempty = ((write_addr - read_addr) <= AEMPTY_THRESHOLD) ||
                         ((read_addr - write_addr) >= (FIFO_DEPTH - AEMPTY_THRESHOLD));

    // Read pointer management and rdata_valid logic
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            read_ptr <= {(ADDR_WIDTH+1){1'b0}};
            rdata_valid <= 1'b0;
        end else if (flush) begin
            read_ptr <= {(ADDR_WIDTH+1){1'b0}};
            rdata_valid <= 1'b0;
        end else begin
            if (read_enable) begin
                read_ptr <= read_ptr + 1'b1;
                rdata_valid <= 1'b1;
            end else begin
                rdata_valid <= 1'b0;
            end
        end
    end

endmodule