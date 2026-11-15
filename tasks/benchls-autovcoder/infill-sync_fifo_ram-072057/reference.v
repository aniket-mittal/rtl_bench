module autovcoder_072057 #(
    parameter MEM_STYLE  = "block",
              DATA_WIDTH = 32,
              ADDR_WIDTH = 5,
              DEPTH      = 32
) (
    // system signal
    input wire clk,
    input wire reset,
    input wire sclk_en,

    // write
    output wire                  if_full_n,
    input  wire                  if_write_ce,
    input  wire                  if_write,
    input  wire [DATA_WIDTH-1:0] if_din,

    // read
    output wire                  if_empty_n,
    input  wire                  if_read_ce,
    input  wire                  if_read,
    output wire [DATA_WIDTH-1:0] if_dout
);
  //------------------------Parameter----------------------

  //------------------------Local signal-------------------
  (* ram_style = MEM_STYLE *)
  reg  [DATA_WIDTH-1:0] mem               [0:DEPTH-1];
  reg  [DATA_WIDTH-1:0] q_buf = 1'b0;
  reg  [ADDR_WIDTH-1:0] waddr = 1'b0;
  reg  [ADDR_WIDTH-1:0] raddr = 1'b0;
  wire [ADDR_WIDTH-1:0] wnext;
  wire [ADDR_WIDTH-1:0] rnext;
  wire                  push;
  wire                  pop;
  reg  [ADDR_WIDTH-1:0] mOutPtr = 1'b0;
  reg                   full_n = 1'b1;
  reg                   empty_n = 1'b0;
  reg  [DATA_WIDTH-1:0] q_tmp = 1'b0;
  reg                   show_ahead = 1'b0;
  reg  [DATA_WIDTH-1:0] dout_buf = 1'b0;
  reg                   dout_valid = 1'b0;


  //------------------------Instantiation------------------

  //------------------------Task and function--------------

  //------------------------Body---------------------------
  assign if_full_n  = full_n;
  assign if_empty_n = dout_valid;
  assign if_dout    = dout_buf;
  assign push       = full_n & if_write_ce & (if_write === 1'b1);
  assign pop        = empty_n & if_read_ce & (~dout_valid | if_read);
  assign wnext      = !push ? waddr : (waddr == DEPTH - 1) ? 1'b0 : waddr + 1'b1;
  assign rnext      = !pop ? raddr : (raddr == DEPTH - 1) ? 1'b0 : raddr + 1'b1;

  // waddr
  always @(posedge clk) begin
    if (reset == 1'b1) waddr <= 1'b0;
    else if (sclk_en) waddr <= wnext;
  end

  // raddr
  always @(posedge clk) begin
    if (reset == 1'b1) raddr <= 1'b0;
    else if (sclk_en) raddr <= rnext;
  end

  // mOutPtr
  always @(posedge clk) begin
    if (reset == 1'b1) mOutPtr <= 1'b0;
    else if (sclk_en)
      if (push & ~pop) mOutPtr <= mOutPtr + 1'b1;
      else if (~push & pop) mOutPtr <= mOutPtr - 1'b1;
  end

  // full_n
  always @(posedge clk) begin
    if (reset == 1'b1) full_n <= 1'b1;
    else if (sclk_en)
      if (push & ~pop) full_n <= (mOutPtr != DEPTH - 1);
      else if (~push & pop) full_n <= 1'b1;
  end

  // empty_n
  always @(posedge clk) begin
    if (reset == 1'b1) empty_n <= 1'b0;
    else if (sclk_en)
      if (push & ~pop) empty_n <= 1'b1;
      else if (~push & pop) empty_n <= (mOutPtr != 1'b1);
  end

  // mem
  always @(posedge clk) begin
    if (push) mem[waddr] <= if_din;
  end

  // q_buf
  always @(posedge clk) begin
    q_buf <= mem[rnext];
  end

  // q_tmp
  always @(posedge clk) begin
    if (reset == 1'b1) q_tmp <= 1'b0;
    else if (sclk_en) if (push) q_tmp <= if_din;
  end

  // show_ahead
  always @(posedge clk) begin
    if (reset == 1'b1) show_ahead <= 1'b0;
    else if (sclk_en)
      if (push && mOutPtr == pop) show_ahead <= 1'b1;
      else show_ahead <= 1'b0;
  end

  // dout_buf
  always @(posedge clk) begin
    if (reset == 1'b1) dout_buf <= 1'b0;
    else if (sclk_en) if (pop) dout_buf <= show_ahead ? q_tmp : q_buf;
  end

  // dout_valid
  always @(posedge clk) begin
    if (reset == 1'b1) dout_valid <= 1'b0;
    else if (sclk_en)
      if (pop) dout_valid <= 1'b1;
      else if (if_read_ce & if_read) dout_valid <= 1'b0;
  end

endmodule

