module mg_08202(input wire clk,input wire rst,input wire [31:0] addr,input wire [31:0] im_add,input wire [31:0] im_data,input wire im_en,input wire im_rd_wr,input stall,input mispredict,output logic [31:0] inst1,output logic [31:0] inst1_pc,output logic inst1_valid);
parameter NMEM = 128; 
  parameter IM_DATA = "im_data.txt"; 
  reg [31:0] mem [0:127]; 
  integer i; 
  initial 
  begin 
  end 
  always @(*) begin 
  if (!rst) begin 
  for (i = 0; i < 128; i=i+1) begin 
  mem[i] <= 32'h0; 
  end 
  end 
  else if (im_rd_wr) begin 
  mem[im_add] <= im_data; 
  end 
  end 
  [MASKED] 
 endmodule