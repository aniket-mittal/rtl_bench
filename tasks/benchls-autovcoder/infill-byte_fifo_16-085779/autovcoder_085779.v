module autovcoder_085779 (
    input [7:0] d_i,
    input we_i,
    input wp_inc_i,
    output [7:0] q_o,
    input rp_inc_i,
    output full_o,
    output data_available_o,
    input sys_clk_i,
    input sys_reset_i
);

  // The FIFO used in the UXA contains 16 bytes.
  reg [7:0] fifo[15:0];

  // When the user reads a value from the adapter, the read-pointer
  // determines which of the 16 bytes are read from.
  reg [3:0] rp;  /* synthesis keep */

  // When the deserializer has data to deliver to the FIFO, it is
  // placed into the location pointed to by wp.
  reg [3:0] wp;  /* synthesis keep */

  // The queue is full when no more bytes can be written into
  // the buffer without overwriting an unread byte.  This happens
  // when the write pointer is one less than the read pointer,
  // modulo 16 of course.
  assign full_o = (wp == (rp - 1));

  // The queue is empty when the read and write pointers become
  // equal to each other, such as is what happens at reset time.
  // Consequently, we know that at least one byte of data exists
  // in the queue provided the read and write pointers do not
  // match.
  assign data_available_o = ~(wp == rp);

  // The data output ports of the FIFO always reflect the data
  // referred to by the read pointer.  An upstream device may
  // thus query the head of the queue without actually popping
  // it.
  assign q_o = fifo[rp];

  [MASKED]
endmodule

