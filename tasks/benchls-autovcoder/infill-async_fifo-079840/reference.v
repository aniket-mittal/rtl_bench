module autovcoder_079840 #(
    parameter TCQ        = 100,
    parameter DSIZE      = 32,
    parameter FIFO_DEPTH = 16,
    parameter ASIZE      = 4,
    parameter SYNC       = 1     // only has always '1' logic.
) (
    input                  wr_clk,
    input                  rst,
    input                  wr_en,
    input      [DSIZE-1:0] wr_data,
    input                  rd_en,
    input                  rd_clk,
    output     [DSIZE-1:0] rd_data,
    output reg             full,
    output reg             empty,
    output reg             almost_full
);

  // memory array
  reg [DSIZE-1:0] mem [0:FIFO_DEPTH-1];

  //Read Capture Logic
  // if Sync = 1, then no need to remove metastability logic because wrclk = rdclk
  reg [ASIZE:0]    rd_capture_ptr;
  reg [ASIZE:0]    pre_rd_capture_gray_ptr;
  reg [ASIZE:0]    rd_capture_gray_ptr;

  reg [ASIZE:0] wr_capture_ptr;
  reg [ASIZE:0] pre_wr_capture_gray_ptr;
  reg [ASIZE:0] wr_capture_gray_ptr;
  wire [ASIZE:0] buf_avail;
  wire [ASIZE:0] buf_filled;
  wire [ASIZE-1:0] wr_addr, rd_addr;
  wire COutb, COutd;
  reg COuta, COutc;
  reg [ASIZE:0] wr_ptr, rd_ptr, rd_ptr_cp;
  integer i, j, k;


  always @(rd_ptr) rd_capture_ptr = rd_ptr;



  //capture the wr_gray_pointers to rd_clk domains and convert the gray pointers to binary pointers 
  // before do comparison.



  always @(wr_ptr) wr_capture_ptr = wr_ptr;

  // dualport ram 
  // Memory (RAM) that holds the contents of the FIFO


  assign wr_addr = wr_ptr[ASIZE-1:0];
  assign rd_data = mem[rd_addr];
  always @(posedge wr_clk) begin
    if (wr_en && !full) mem[wr_addr] <= #TCQ wr_data;

  end


  // Read Side Logic


  assign rd_addr   = rd_ptr_cp[ASIZE-1:0];
  assign rd_strobe = rd_en && !empty;

  integer n;
  // change the binary pointer to gray pointer


  always @(posedge rd_clk) begin
    if (rst) begin
      rd_ptr <= #TCQ 'b0;
      rd_ptr_cp <= #TCQ 'b0;

    end else begin
      if (rd_strobe) begin
        {COuta, rd_ptr} <= #TCQ rd_ptr + 1'b1;
        rd_ptr_cp <= #TCQ rd_ptr_cp + 1'b1;

      end

      // change the binary pointer to gray pointer
    end

  end

  //generate empty signal
  assign {COutb, buf_filled} = wr_capture_ptr - rd_ptr;

  always @(posedge rd_clk) begin
    if (rst) empty <= #TCQ 1'b1;
    else if ((buf_filled == 0) || (buf_filled == 1 && rd_strobe)) empty <= #TCQ 1'b1;
    else empty <= #TCQ 1'b0;
  end


  // write side logic;

  reg [ASIZE:0] wbin;
  wire [ASIZE:0] wgraynext, wbinnext;



  always @(posedge rd_clk) begin
    if (rst) begin
      wr_ptr <= #TCQ 'b0;
    end else begin
      if (wr_en) {COutc, wr_ptr} <= #TCQ wr_ptr + 1'b1;

      // change the binary pointer to gray pointer
    end

  end


  // calculate how many buf still available
  //assign {COutd,buf_avail }= (rd_capture_ptr + 5'd16) - wr_ptr;
  assign {COutd, buf_avail} = rd_capture_ptr - wr_ptr + +5'd16;


  always @(posedge wr_clk) begin
    if (rst) full <= #TCQ 1'b0;
    else if ((buf_avail == 0) || (buf_avail == 1 && wr_en)) full <= #TCQ 1'b1;
    else full <= #TCQ 1'b0;
  end


  always @(posedge wr_clk) begin
    if (rst) almost_full <= #TCQ 1'b0;
    else if ((buf_avail == FIFO_DEPTH - 2) || ((buf_avail == FIFO_DEPTH - 3) && wr_en))
      almost_full <= #TCQ 1'b1;
    else almost_full <= #TCQ 1'b0;
  end

endmodule

