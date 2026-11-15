module origen_204157 #(
    parameter DATAW = 64,
    parameter BYTEW = 8,
    parameter METAW = 8,
    parameter USERW = 8,
    parameter FIFO_DEPTH = 16
) (
    input wire                   clk,
    input wire                   rst_n,

    // Input FIFO interface
    input wire [DATAW-1:0]       ififo_wdata,
    input wire                   ififo_wen,
    output reg                   ififo_rdy,

    // Output interface
    output reg [DATAW-1:0]       tfifo_rdata,
    output reg [BYTEW-1:0]       tfifo_rstrb,
    output reg [BYTEW-1:0]       tfifo_rkeep,
    output reg [METAW-1:0]       tfifo_rid,
    output reg [METAW-1:0]       tfifo_rdest,
    output reg [USERW-1:0]       tfifo_ruser,
    output reg                   tfifo_rlast,
    output reg                   tfifo_rvalid,
    input wire                   tfifo_rready,

    // FIFO status signals
    output reg                   fifo_empty,
    output reg                   fifo_full,
    output reg                   fifo_almost_full
);

    reg [DATAW-1:0] mem [FIFO_DEPTH-1:0];
    reg [BYTEW-1:0] mem_strb [FIFO_DEPTH-1:0];
    reg [BYTEW-1:0] mem_keep [FIFO_DEPTH-1:0];
    reg [METAW-1:0] mem_id [FIFO_DEPTH-1:0];
    reg [METAW-1:0] mem_dest [FIFO_DEPTH-1:0];
    reg [USERW-1:0] mem_user [FIFO_DEPTH-1:0];
    reg             mem_last [FIFO_DEPTH-1:0];

    reg [DATAW-1:0] head_ptr;
    reg [DATAW-1:0] tail_ptr;
    reg [DATAW-1:0] fifo_count;

    [MASKED]

endmodule