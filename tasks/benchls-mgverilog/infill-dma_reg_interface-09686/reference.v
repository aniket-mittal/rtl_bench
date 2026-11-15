module mg_09686 (input clk,input rst,input [31:0] reg_data_in,input [6:0] reg_wr_addr,input [6:0] reg_rd_addr,input reg_wren,output reg [31:0] reg_data_out,output [63:0] dmaras,output reg [31:0] dmarad,output reg [31:0] dmarxs,output rd_dma_start,input rd_dma_done,input [31:0] dma_wr_count,input [31:0] dma_rd_count);
reg [31:0] dmaras_l, dmaras_u; 
 reg [31:0] dmacst; 
 assign dmaras[63:0] = {dmaras_u,dmaras_l}; 
 assign rd_dma_start = dmacst[2]; 
 always@(posedge clk or posedge rst) begin 
  if(rst) begin 
  dmaras_l <= 0; 
  dmaras_u <= 0; 
  dmarad <= 0; 
  dmarxs <= 0; 
  end else begin 
  if(reg_wren) begin 
  case(reg_wr_addr) 
  7'b000_1100: dmaras_l <= reg_data_in; 
  7'b001_0000: dmaras_u <= reg_data_in; 
  7'b001_0100: dmarad <= reg_data_in; 
  7'b001_1100: dmarxs <= reg_data_in; 
  default: begin 
  dmaras_l <= dmaras_l; 
  dmaras_u <= dmaras_u; 
  dmarad <= dmarad; 
  dmarxs <= dmarxs; 
  end 
  endcase 
  end 
  end 
  end 
 always@(posedge clk) begin 
  if(rst) begin 
  dmacst[3:2] <= 2'b00; 
  end else begin 
  if(rd_dma_done) begin 
  dmacst[2] <= 1'b0; 
  dmacst[3] <= 1'b1; 
  end else if(reg_wren) begin 
  case(reg_wr_addr) 
  7'b010_1000: begin 
  dmacst[31:4] <= reg_data_in[31:4]; 
  dmacst[1:0] <= reg_data_in[1:0]; 
  if(reg_data_in[2]) 
  dmacst[2] <= 1'b1; 
  else 
  dmacst[2] <= dmacst[2]; 
  if(reg_data_in[3]) 
  dmacst[3] <= 1'b0; 
  else 
  dmacst[3] <= dmacst[3]; 
  end 
  default: begin 
  dmacst[3:2] <= dmacst[3:2]; 
  end 
  endcase 
  end 
  end 
  end 
 always@(posedge clk or posedge rst ) 
  begin 
  if(rst) 
  begin 
  reg_data_out <= 0; 
  end 
  else 
  begin 
  case(reg_rd_addr[6:0]) 
  7'b000_1100: reg_data_out <= dmaras_l; 
  7'b001_0000: reg_data_out <= dmaras_u; 
  7'b001_0100: reg_data_out <= dmarad; 
  7'b001_1100: reg_data_out <= dmarxs; 
  7'b010_1000: reg_data_out <= dmacst; 
  7'b011_0000: reg_data_out <= dma_wr_count; 
  7'b011_0100: reg_data_out <= dma_rd_count; 
  endcase 
  end 
  end 
  endmodule