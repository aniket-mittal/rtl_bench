module autovcoder_118340 #(
    parameter FIFO_SIZE  = 2,  // size in log scale, 2 for 4 entry, 3 for 8 entry
    parameter FIFO_WIDTH = 32
)  // fifo width in bit
(
    input  wire                  CLK,
    input  wire                  RST,
    input  wire                  enq,
    input  wire                  deq,
    input  wire [FIFO_WIDTH-1:0] din,
    output wire [FIFO_WIDTH-1:0] dot,
    output wire                  emp,
    output wire                  full,
    output reg  [   FIFO_SIZE:0] cnt
);

  reg [FIFO_SIZE-1:0] head, tail;
  reg [FIFO_WIDTH-1:0] mem[(1<<FIFO_SIZE)-1:0];

  assign emp  = (cnt == 0);
  assign full = (cnt == (1 << FIFO_SIZE));
  assign dot  = mem[head];

  [MASKED]
endmodule

