module mg_07252(clk,rst,if_pc,id_pc,update_BP,pred_right,taken,BHR_in,delayed_PHT,pred_out,BHR_rd,PHT_out);
input clk; 
 input rst; 
 input update_BP; 
 input pred_right; 
 input taken; 
 input [5:0] if_pc; 
 input [5:0] id_pc; 
 input [3:0] BHR_in; 
 input [1:0] delayed_PHT; 
 output pred_out; 
 output [3:0] BHR_rd; 
 output [1:0] PHT_out; 
 wire [1:0] PHT_out; 
 wire [3:0] BHR_rd; 
 reg en_update_PHT; 
 reg [1:0] PHT_in; 
 reg [3:0] BHT [7:0]; 
 reg [1:0] PHT [127:0]; 
 wire [6:0] index_PHT_id; 
 wire [6:0] index_PHT_if; 
 assign index_PHT_if={BHR_rd,if_pc[4:2]}; 
 assign index_PHT_id={BHR_in,id_pc[4:2]}; 
 wire [2:0] index_BHT_if; 
 wire [2:0] index_BHT_id; 
 assign index_BHT_if={if_pc[5]^if_pc[4],if_pc[3]^if_pc[2],if_pc[1]^if_pc[0]}; 
 assign index_BHT_id={id_pc[5]^id_pc[4],id_pc[3]^id_pc[2],id_pc[1]^id_pc[0]}; 
 always@(posedge clk) 
 begin 
  if(update_BP) 
  begin 
  if(taken) 
  BHT[index_BHT_id]<={BHR_in[2:0],1'b1}; 
  else 
  BHT[index_BHT_id]<={BHR_in[2:0],1'b1}; 
  end 
 end 
 always@(posedge clk) 
 begin 
  if(en_update_PHT) 
  begin 
  PHT[index_PHT_id]<=PHT_in; 
  end 
 end 
 always@(*) 
 begin 
  en_update_PHT=1'b0; 
  PHT_in=2'b00; 
  if(update_BP) 
  begin 
  if(delayed_PHT[1]&&pred_right) 
  begin 
  if(delayed_PHT[0]==1'b0) 
  begin 
  en_update_PHT=1'b1; 
  PHT_in=2'b11; 
  end 
  end 
  else if((!delayed_PHT[1])&&pred_right) 
  begin 
  en_update_PHT=1'b1; 
  PHT_in=2'b10; 
  end 
  else if(delayed_PHT[1]&&(!pred_right)) 
  begin 
  en_update_PHT=1'b1; 
  PHT_in=2'b01; 
  end 
  else if((!delayed_PHT[1])&&(!pred_right)) 
  begin 
  en_update_PHT=1'b1; 
  PHT_in=2'b00; 
  end 
  end 
 end 
 assign BHR_rd=BHT[index_BHT_if]; 
 assign PHT_out=PHT[index_PHT_if]; 
 assign pred_out=PHT_out[1]; 
 endmodule