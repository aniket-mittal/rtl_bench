module origen_175267 (
    input  wire        mclk_i,
    input  wire [15:0] sernum_i,
    input  wire [31:0] count_i,
    input  wire        write_strobe_i,
    input  wire        fifo_full_i,
    output reg  [7:0]  fifo_in_o,
    output reg         fifo_write_strobe_o,
    output reg         busy_o
);

    reg [31:0] local_count;
    reg [15:0] local_sernum;
    reg        last_write_strobe;
    reg  [3:0] state;
    reg  [3:0] post_strobe_state;
    reg  [3:0] fifo_write_strobe_count;

    localparam [3:0] IDLE          = 4'b0000,
                     CAPTURE_INPUT = 4'b0001,
                     WRITE_HEADER  = 4'b0010,
                     WRITE_SERNUM   = 4'b0011,
                     WRITE_SERNUM_2 = 4'b0100,
                     WRITE_COUNT    = 4'b0101,
                     WRITE_COUNT_2  = 4'b0110,
                     WRITE_COUNT_3  = 4'b0111,
                     WRITE_COUNT_4  = 4'b1000,
                     COMPLETE       = 4'b1001;

    [MASKED]
endmodule