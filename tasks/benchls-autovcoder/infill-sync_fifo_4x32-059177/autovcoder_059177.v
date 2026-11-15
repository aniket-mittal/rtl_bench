module autovcoder_059177 (
    // PCI Signals
    input [31:0] din,   // Data in
    input        wr_en, // Write enable

    input rd_en,  // Read the next word

    output [31:0] dout,  // Data out
    output        full,
    output        empty,

    input reset,
    input clk
);


  parameter MAX_DEPTH_BITS = 2;
  parameter MAX_DEPTH = 2 ** MAX_DEPTH_BITS;

  reg [31:0] queue[MAX_DEPTH - 1 : 0];
  reg [MAX_DEPTH_BITS - 1 : 0] rd_ptr;
  reg [MAX_DEPTH_BITS - 1 : 0] wr_ptr;
  reg [MAX_DEPTH_BITS - 1 + 1 : 0] depth;

  // Sample the data
  always @(posedge clk) begin
    if (wr_en) queue[wr_ptr] <= din;
  end

  [MASKED]

  assign dout  = queue[rd_ptr];
  assign full  = depth == MAX_DEPTH;
  assign empty = depth == 'h0;

  // synthesis translate_off
  always @(posedge clk) begin
    if (wr_en && depth == MAX_DEPTH && !rd_en)
      ;
    if (rd_en && depth == 'h0) ;
  end
  // synthesis translate_on

endmodule

