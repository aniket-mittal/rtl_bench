module rtlpp_05006(data_out, fifo_full, fifo_empty, fifo_threshold, fifo_overflow, fifo_underflow, clk, rst_n, wr, rd, data_in);

  input wr, rd, clk, rst_n;
  input [7:0] data_in;
  output [7:0] data_out;
  output fifo_full, fifo_empty, fifo_threshold, fifo_overflow, fifo_underflow;
  wire [4:0] wptr, rptr;
  wire fifo_we, fifo_rd;

  // Write Pointer Logic
  reg [4:0] write_ptr;
  assign fifo_we = (~fifo_full) & wr;

  always @(posedge clk or negedge rst_n) begin
      if (~rst_n) 
          write_ptr <= 5'b00000;
      else if (fifo_we)
          write_ptr <= write_ptr + 5'b00001;
  end

  // Read Pointer Logic
  reg [4:0] read_ptr;
  assign fifo_rd = (~fifo_empty) & rd;

  always @(posedge clk or negedge rst_n) begin
      if (~rst_n) 
          read_ptr <= 5'b00000;
      else if (fifo_rd)
          read_ptr <= read_ptr + 5'b00001;
  end

  // Memory Array Logic
  reg [7:0] mem_array [15:0];
  reg [7:0] data_out_reg;

  always @(posedge clk) begin
      if (fifo_we)
          mem_array[write_ptr[3:0]] <= data_in;
  end

  assign data_out = mem_array[read_ptr[3:0]];

  // Status Signals Logic
  wire fbit_comp = write_ptr[4] ^ read_ptr[4];
  wire pointer_equal = (write_ptr[3:0] == read_ptr[3:0]);
  wire [4:0] pointer_result = write_ptr - read_ptr;
  wire overflow_set = fifo_full & wr;
  wire underflow_set = fifo_empty & rd;

  reg fifo_full_reg, fifo_empty_reg, fifo_threshold_reg, fifo_overflow_reg, fifo_underflow_reg;

  assign fifo_full = fifo_full_reg;
  assign fifo_empty = fifo_empty_reg;
  assign fifo_threshold = fifo_threshold_reg;
  assign fifo_overflow = fifo_overflow_reg;
  assign fifo_underflow = fifo_underflow_reg;

  always @(*) begin
      fifo_full_reg = fbit_comp & pointer_equal;
      fifo_empty_reg = (~fbit_comp) & pointer_equal;
      fifo_threshold_reg = (pointer_result[4] || pointer_result[3]) ? 1 : 0;
  end

  always @(posedge clk or negedge rst_n) begin
      if (~rst_n) 
          fifo_overflow_reg <= 0;
      else if ((overflow_set == 1) && (fifo_rd == 0))
          fifo_overflow_reg <= 1;
      else if (fifo_rd)
          fifo_overflow_reg <= 0;
  end

  always @(posedge clk or negedge rst_n) begin
      if (~rst_n) 
          fifo_underflow_reg <= 0;
      else if ((underflow_set == 1) && (fifo_we == 0))
          fifo_underflow_reg <= 1;
      else if (fifo_we)
          fifo_underflow_reg <= 0;
  end

endmodule