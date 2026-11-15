module read_pointer(
    rptr, fifo_rd, rd, fifo_empty, clk, rst_n
);

  input rd, fifo_empty, clk, rst_n;
  output[4:0] rptr;
  output fifo_rd;
  reg[4:0] rptr;

  assign fifo_rd = (~fifo_empty) & rd;

  [MASKED]

endmodule