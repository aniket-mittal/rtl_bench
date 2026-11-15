module rtlpp_00266(
  clk,
  rst,
  din,
  wr_en,
  rd_en,
  dout,
  full,
  empty,
  valid
);

parameter AWIDTH = 9;

input clk;
input rst;
input [8 : 0] din;
input wr_en;
input rd_en;
output [8 : 0] dout;
output full;
output empty;
output valid;

reg [8:0] wr_pointer;
reg [8:0] rd_pointer;
reg [9:0] status_cnt;
reg [8:0] q;
reg [8:0] data_ram;
reg [8:0] ram[511:0]; // Changing the size of ram to 512 elements

assign full = (status_cnt == 10'h1ff);
assign empty = (status_cnt == 10'h0);
assign dout = q;
assign valid = ~empty;

always @(posedge clk or posedge rst)
begin  
  if (rst) begin
    wr_pointer <= 0;
  end 
  else begin
    if (wr_en) begin
      wr_pointer <= wr_pointer + 1'b1;
    end
  end
end
  
always @(posedge clk or posedge rst)
begin  
  if (rst) begin
    rd_pointer <= 0;
  end 
  else begin
    if (rd_en) begin
      rd_pointer <= rd_pointer + 1'b1;
    end
  end
end  

always @(posedge clk)
begin  
  if (rd_en) begin
    q <= data_ram;
  end
end
  
always @(posedge clk or posedge rst)
begin 
  if (rst) begin
    status_cnt <= 0;
  end
  else begin
    if ((rd_en) && (!wr_en) && (status_cnt != 0))
      status_cnt <= status_cnt - 1'b1;
    else if ((wr_en) && (!rd_en) && (status_cnt != 10'h1ff))
      status_cnt <= status_cnt + 1'b1;
    else
      status_cnt <= status_cnt;
  end
end

always @(posedge clk) begin
  if (wr_en) 
    ram[wr_pointer] <= din;

  data_ram <= ram[rd_pointer];
end

endmodule