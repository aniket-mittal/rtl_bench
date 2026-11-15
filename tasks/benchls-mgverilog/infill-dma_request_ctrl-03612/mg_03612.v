module mg_03612(clk, rst, cfg, status, full_empty, dma_req, dma_ack);
input clk, rst; 
 input [7:0] cfg; 
 input [1:0] status; 
 input full_empty; 
 output dma_req; 
 input dma_ack; 
 reg dma_req_d; 
 reg dma_req_r1; 
 reg dma_req; 
 [MASKED] 
 always @(posedge clk) 
  dma_req_r1 <= #1 dma_req_d & !dma_ack; 
 always @(posedge clk or negedge rst) 
  if(!rst) dma_req <= #1 1'b0; 
  else 
  if(dma_req_r1 & dma_req_d & !dma_ack) dma_req <= #1 1'b1; 
  else 
  if(dma_ack) dma_req <= #1 1'b0; 
 endmodule