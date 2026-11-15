module rtlpp_00060 (
  ap_clk,
  ap_rst_n,
  count,
  maxcount,
  in0_V_TREADY,
  in0_V_TVALID,
  in0_V_TDATA,
  out_V_TREADY,
  out_V_TVALID,
  out_V_TDATA
);

input wire ap_clk;
input wire ap_rst_n;
output reg [1 : 0] count;
output reg [1 : 0] maxcount;
output reg in0_V_TREADY;
input wire in0_V_TVALID;
input wire [167 : 0] in0_V_TDATA;
input wire out_V_TREADY;
output reg out_V_TVALID;
output reg [167 : 0] out_V_TDATA;

// Internal registers
reg [1:0] fifo_count;
reg [1:0] fifo_maxcount;
reg [167:0] fifo_mem;

// Initialization
initial begin
  count = 2'b00;
  maxcount = 2'b10; // Assuming constant maxcount value, should be set according to your requirement
  in0_V_TREADY = 1'b0;
  out_V_TVALID = 1'b0;
  fifo_count = 2'b00;
end

always @(posedge ap_clk or negedge ap_rst_n) begin
  if (!ap_rst_n) begin
    count <= 2'b00;
    in0_V_TREADY <= 1'b1; // Ready to accept data when reset is low
    out_V_TVALID <= 1'b0;
  end else begin
    if(in0_V_TVALID && in0_V_TREADY) begin
      fifo_mem <= in0_V_TDATA;
      fifo_count <= fifo_count + 1;
      count <= fifo_count;
      if(fifo_count == fifo_maxcount) begin
        in0_V_TREADY <= 1'b0; // Stop accepting new data if FIFO is full
      end
    end
    
    if(out_V_TREADY && out_V_TVALID) begin
      fifo_count <= fifo_count - 1;
      count <= fifo_count;
      if(fifo_count != 0) begin
        out_V_TDATA <= fifo_mem; // Provide the stored data to the output
      end
    end
    
    if(fifo_count == 0) begin
      out_V_TVALID <= 1'b0;
    end else if(out_V_TREADY) begin
      out_V_TVALID <= 1'b1;
    end
  end
end

endmodule