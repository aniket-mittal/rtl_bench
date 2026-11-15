module origen_059964 #(
    parameter WIDTH = 32,
    parameter DEPTH = 256,
    parameter TRIGAT = 64,
    parameter MODE = "NORMAL"
) (
    input wire clk,
    input wire resetn,
    input wire enable,
    input wire trigger,
    input wire [WIDTH-1:0] data,
    input wire dump_en,
    input wire dump_ready,
    output reg triggered,
    output reg dump_valid,
    output reg [7:0] dump_data
);

    localparam ADDR_WIDTH = $clog2(DEPTH);
    localparam BYTES_PER_WORD = (WIDTH + 7) / 8;
    localparam BYTE_COUNT_WIDTH = $clog2(BYTES_PER_WORD);

    reg [WIDTH-1:0] memory [0:DEPTH-1];
    reg [ADDR_WIDTH-1:0] write_ptr, read_ptr, trigger_ptr;
    reg [ADDR_WIDTH:0] sample_count;
    reg [BYTE_COUNT_WIDTH-1:0] byte_count;
    reg [1:0] state;

    localparam RUNNING = 2'b00, TRIGGERED = 2'b01, WAIT_DUMP = 2'b10, DUMPING = 2'b11;

    [MASKED]

endmodule