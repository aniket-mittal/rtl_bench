module write_pointer(
    wptr, fifo_we, wr, fifo_full, clk, rst_n
);

  input wr, fifo_full, clk, rst_n;
  output[4:0] wptr;
  output fifo_we;
  reg[4:0] wptr;

  assign fifo_we = (~fifo_full) & wr;

  [MASKED]

endmodule