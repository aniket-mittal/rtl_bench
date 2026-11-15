module mg_05990(clk,rst,clr_max,clr_inv_ids,clr_sel_cnt_inv,clr_sel_cnt,inc_sel_cnt,inc_sel_cnt_inv,en_flit_max_in,en_for_reg,en_inv_ids,inv_ids_in,dest_sel,flit_max_in,head_flit,addrhi,addrlo,flit_out,cnt_eq_max,cnt_invs_eq_3,cnt_eq_0,inv_ids_reg_out,sel_cnt_invs_out);
input clk; 
  input rst; 
  input [15:0] head_flit; 
  input [15:0] addrhi; 
  input [15:0] addrlo; 
  input clr_max; 
  input clr_inv_ids; 
  input clr_sel_cnt_inv; 
  input clr_sel_cnt; 
  input inc_sel_cnt; 
  input inc_sel_cnt_inv; 
  input en_for_reg; 
  input en_inv_ids; 
  input [3:0] inv_ids_in; 
  input [3:0] flit_max_in; 
  input en_flit_max_in; 
  input dest_sel; 
  output [15:0] flit_out; 
  output cnt_eq_max; 
  output cnt_invs_eq_3; 
  output cnt_eq_0; 
  output [3:0] inv_ids_reg_out; 
  output [1:0] sel_cnt_invs_out; 
 reg [3:0] flits_max; 
 always@(posedge clk) 
 begin 
  if(rst||clr_max) 
  flits_max<=4'b0000; 
  else if(en_flit_max_in) 
  flits_max<=flit_max_in; 
 end 
 reg [3:0] inv_ids_reg; 
 always@(posedge clk) 
 begin 
  if(rst||clr_inv_ids) 
  inv_ids_reg<=4'b0000; 
  else if(en_inv_ids) 
  inv_ids_reg<=inv_ids_in; 
 end 
 wire [3:0] inv_ids_reg_out; 
 assign inv_ids_reg_out=inv_ids_reg; 
 reg [3:0] sel_cnt; 
 always@(posedge clk) 
 begin 
  if(rst||clr_sel_cnt) 
  sel_cnt<=4'b0000; 
  else if(inc_sel_cnt) 
  sel_cnt<=sel_cnt+4'b0001; 
 end 
 reg [1:0] sel_cnt_invs; 
 always@(posedge clk) 
 begin 
  if(rst||clr_sel_cnt_inv) 
  sel_cnt_invs<=2'b00; 
  else if(inc_sel_cnt_inv) 
  sel_cnt_invs<=sel_cnt_invs+2'b01; 
 end 
 wire [1:0] sel_cnt_invs_out; 
 assign sel_cnt_invs_out=sel_cnt_invs; 
 wire cnt_eq_0; 
 assign cnt_eq_0=(sel_cnt==4'b0000); 
 wire cnt_eq_max; 
 assign cnt_eq_max=(sel_cnt==flits_max); 
 wire cnt_invs_eq_3; 
 assign cnt_invs_eq_3=(sel_cnt_invs==2'b11); 
  reg [15:0] head_flit_reg; 
  reg [15:0] addrhi_reg; 
  reg [15:0] addrlo_reg; 
  always@(posedge clk) 
  begin 
  if(rst) 
  begin 
  head_flit_reg<=16'h0000; 
  addrhi_reg<=16'h0000; 
  addrlo_reg<=16'h0000; 
  end 
  else if(en_for_reg) 
  begin 
  head_flit_reg<=head_flit; 
  addrhi_reg<=addrhi; 
  addrlo_reg<=addrlo; 
  end 
 end 
 wire [1:0] dest_seled_id; 
 assign dest_seled_id=dest_sel?head_flit_reg[15:14]:sel_cnt_invs; 
 reg [15:0] flit_seled_out; 
 always@(*) 
 begin 
  case(sel_cnt) 
  4'b0000:flit_seled_out={dest_seled_id,head_flit_reg[13:0]}; 
  4'b0001:flit_seled_out=addrhi_reg; 
  4'b0010:flit_seled_out=addrlo_reg; 
  default:flit_seled_out=head_flit_reg; 
  endcase 
 end 
 assign flit_out=flit_seled_out; 
 endmodule