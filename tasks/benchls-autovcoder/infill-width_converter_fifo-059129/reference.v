module autovcoder_059129 (
    input  wire        clk,
    input  wire        rst,
    // Incoming port
    input  wire [21:0] a_data,
    input  wire        a_valid,
    output wire        a_ready,
    // Outgoing port
    input  wire        b_short,
    output wire [63:0] b_data,
    output wire        b_valid,
    input  wire        b_ready
);
  // Store from higher order byte to lower order
  reg [63:0] fifo;
  reg [1:0] fifo_level;
  wire fifo_full = (b_short) ? (fifo_level == 2) : (fifo_level == 3);

  wire [63:0] new_data =
            ((fifo_level == 2) && !b_short) ? {fifo[63:22], a_data} :
            (fifo_level == 1) ? {fifo[63:44], a_data, 22'b0} :
            ((fifo_level == 0) || ((fifo_level == 3) || (b_short && (fifo_level == 2)))) ? {a_data[19:0], 44'b0} :
            64'bx;

  always @(posedge clk) begin
    if (fifo_full) begin
      if (b_ready && a_valid) begin
        // Output ready, input valid, shiftin new data
        fifo <= new_data;
        fifo_level <= 1;
      end else if (b_ready) begin
        // Output ready, no input, output data
        fifo_level <= 0;
      end
    end else begin
      // Not full, output not valid, input ready
      if (a_valid) begin
        fifo <= new_data;
        fifo_level <= fifo_level + 1;
      end
    end

    if (rst) begin
      fifo_level <= 0;
    end
  end

  // RX data if fifo is empty
  assign a_ready = !fifo_full || (fifo_full && b_ready);
  assign b_valid = fifo_full;
  assign b_data  = fifo;

endmodule

