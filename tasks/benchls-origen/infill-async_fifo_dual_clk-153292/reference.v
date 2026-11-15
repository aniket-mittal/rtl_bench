module origen_153292 #(
  parameter DATA_WIDTH = 8,
  parameter ADDR_WIDTH = 4
)(
  // Write clock domain
  input  wire                wclk,
  input  wire                wrst,
  input  wire                wr,
  input  wire [DATA_WIDTH-1:0] wdata,
  output wire                full,

  // Read clock domain
  input  wire                rclk,
  input  wire                rrst,
  input  wire                rd,
  output wire [DATA_WIDTH-1:0] rdata,
  output wire                empty
);

  // Write pointer
  reg [ADDR_WIDTH:0] b_wptr_wclk;
  reg [ADDR_WIDTH:0] g_wptr_wclk;
  reg [ADDR_WIDTH:0] g_wptr_rclk_s0;
  reg [ADDR_WIDTH:0] g_wptr_rclk_s1;

  // Read pointer
  reg [ADDR_WIDTH:0] b_rptr_rclk;
  reg [ADDR_WIDTH:0] g_rptr_rclk;
  reg [ADDR_WIDTH:0] g_rptr_wclk_s0;
  reg [ADDR_WIDTH:0] g_rptr_wclk_s1;

  // FIFO memory
  reg [DATA_WIDTH-1:0] fifo [0:(1<<ADDR_WIDTH)-1];

  // Binary to Gray code conversion
  function [ADDR_WIDTH:0] b2g;
    input [ADDR_WIDTH:0] binary;
    reg [ADDR_WIDTH:0] g;
    integer i;
    begin
      g[ADDR_WIDTH] = binary[ADDR_WIDTH];
      for (i = ADDR_WIDTH-1; i >= 0; i = i - 1)
        g[i] = binary[i+1] ^ binary[i];
      b2g = g;
    end
  endfunction

  // Write pointer logic
  always @(posedge wclk or posedge wrst) begin
    if (wrst) begin
      b_wptr_wclk <= 0;
      g_wptr_wclk <= 0;
    end else if (wr && !full) begin
      b_wptr_wclk <= b_wptr_wclk + 1;
      g_wptr_wclk <= b2g(b_wptr_wclk + 1);
    end
  end

  always @(posedge rclk or posedge rrst) begin
    if (rrst) begin
      g_wptr_rclk_s0 <= 0;
      g_wptr_rclk_s1 <= 0;
    end else begin
      g_wptr_rclk_s0 <= g_wptr_wclk;
      g_wptr_rclk_s1 <= g_wptr_rclk_s0;
    end
  end

  // Read pointer logic
  always @(posedge rclk or posedge rrst) begin
    if (rrst) begin
      b_rptr_rclk <= 0;
      g_rptr_rclk <= 0;
    end else if (rd && !empty) begin
      b_rptr_rclk <= b_rptr_rclk + 1;
      g_rptr_rclk <= b2g(b_rptr_rclk + 1);
    end
  end

  always @(posedge wclk or posedge wrst) begin
    if (wrst) begin
      g_rptr_wclk_s0 <= 0;
      g_rptr_wclk_s1 <= 0;
    end else begin
      g_rptr_wclk_s0 <= g_rptr_rclk;
      g_rptr_wclk_s1 <= g_rptr_wclk_s0;
    end
  end

  // FIFO data
  always @(posedge wclk) begin
    if (wr && !full)
      fifo[b_wptr_wclk[ADDR_WIDTH-1:0]] <= wdata;
  end

  assign rdata = fifo[b_rptr_rclk[ADDR_WIDTH-1:0]];

  // Status signals
  assign full = (b_wptr_wclk[ADDR_WIDTH] != g_rptr_wclk_s1[ADDR_WIDTH]) && (b_wptr_wclk[ADDR_WIDTH-1:0] == g_rptr_wclk_s1[ADDR_WIDTH-1:0]);
  assign empty = (b_rptr_rclk == g_wptr_rclk_s1);

endmodule