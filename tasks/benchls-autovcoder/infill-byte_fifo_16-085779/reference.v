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

  always @(posedge sys_clk_i) begin
    // When the system is reset, we reset the pointers to zero
    // so that everything has a nice, well-known value for sim-
    // ulation purposes.  Pragmatically, though, it's sufficient
    // to just set them equal to each other.
    if (sys_reset_i) begin
      rp <= 0;
      wp <= 0;
    end

    // When writing data into the FIFO, the driving module
    // must assert the data on the d_i ports, then assert
    // we_i by the next rising edge of sys_clk_i.
    //
    //            __       _____        _____
    // sys_clk_i    \_____/     \______/     \___
    //       _____ ________________ _____________
    // d_i 	_____X________________X_____________
    //                  _____________
    // we_i  __________/             \___________
    //
    // Note that this operation can fail; if the queue is
    // full at the time the data is written, nothing will
    // be stored.
    if (~sys_reset_i & we_i & ~full_o) begin
      fifo[wp] <= d_i;
    end

    // After writing a byte to the FIFO, the driver must in-
    // crement the write pointer explicitly.
    //            __       _____        _____
    // sys_clk_i    \_____/     \______/     \___
    //       _____ ________________ _____________
    // d_i 	_____X________________X_____________
    //                  _____________
    // we_i  __________/             \___________
    //                                ________
    // inc_wp_i  ____________________/        \__
    //
    // Note that this operation may fail, too.  In the event
    // that the queue is full, it will not increment.
    if (~sys_reset_i & wp_inc_i & ~full_o) begin
      wp <= wp + 1;
    end

    // After reading the q_o ports, an upstream device may 
    // pop the queue by incrementing the read pointer.  This
    // operation may potentially fail -- if the queue is
    // already empty, popping the queue does nothing.
    if (~sys_reset_i & rp_inc_i & data_available_o) begin
      rp <= rp + 1;
    end
  end
endmodule

