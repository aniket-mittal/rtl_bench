module mg_05925(input wire clk,input wire reset,input wire [17:0] s0_address,input wire s0_write,input wire s0_read,input wire [35:0] s0_writedata,output reg [35:0] s0_readdata,output reg s0_waitrequest,input wire [17:0] s1_address,input wire s1_write,input wire s1_read,input wire [35:0] s1_writedata,output reg [35:0] s1_readdata,output reg s1_waitrequest,output reg [17:0] m_address,output reg m_write,output reg m_read,output reg [35:0] m_writedata,input wire [35:0] m_readdata,input wire m_waitrequest);
wire cyc0 = s0_read | s0_write; 
  wire cyc1 = s1_read | s1_write; 
  reg sel0, sel1; 
  wire connected = sel0 | sel1; 
  always @(posedge clk or negedge reset) begin 
  if(~reset) begin 
  sel0 <= 0; 
  sel1 <= 0; 
  end else begin 
  if(sel0 & ~cyc0 | sel1 & ~cyc1) begin 
  sel0 <= 0; 
  sel1 <= 0; 
  end else if(~connected) begin 
  if(cyc0) 
  sel0 <= 1; 
  else if(cyc1) 
  sel1 <= 1; 
  end 
  end 
  end 
  [MASKED] 
 endmodule