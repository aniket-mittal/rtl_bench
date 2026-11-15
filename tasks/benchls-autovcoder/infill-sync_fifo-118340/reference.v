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

  always @(posedge CLK) begin
    if (RST) {cnt, head, tail} <= 0;
    else begin
      case ({
        enq, deq
      })
        2'b01: begin
          head <= head + 1;
          cnt  <= cnt - 1;
        end
        2'b10: begin
          mem[tail] <= din;
          tail <= tail + 1;
          cnt <= cnt + 1;
        end
        2'b11: begin
          mem[tail] <= din;
          head <= head + 1;
          tail <= tail + 1;
        end
      endcase
    end
  end
endmodule

