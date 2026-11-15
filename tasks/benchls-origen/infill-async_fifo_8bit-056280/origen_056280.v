module origen_056280 #(
    parameter WIDTH = 8
) (
    input wire [WIDTH-1:0] DATA_IN,
    output reg [WIDTH-1:0] DATA_OUT,
    input wire ICLK,
    input wire OCLK,
    input wire RST_ICLK,
    input wire RST_OCLK
);

    reg [WIDTH-1:0] fifo_mem [3:0];
    reg [1:0] simple_fifo_ptr;
    reg [1:0] simple_fifo_ptr_CLK;
    reg [2:0] read_flag_CLK;
    reg begin_read;

    // Input clock domain
    always @(posedge ICLK) begin
        fifo_mem[simple_fifo_ptr] <= DATA_IN;
        case (simple_fifo_ptr)
            2'b00: simple_fifo_ptr <= 2'b01;
            2'b01: simple_fifo_ptr <= 2'b11;
            2'b11: simple_fifo_ptr <= 2'b10;
            2'b10: simple_fifo_ptr <= 2'b00;
        endcase
    end

    // Output clock domain
    [MASKED]

endmodule