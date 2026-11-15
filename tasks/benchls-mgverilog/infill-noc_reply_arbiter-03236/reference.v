module mg_03236(clk,rst,OUT_rep_rdy,v_dc_rep,v_mem_rep,dc_rep_flit,mem_rep_flit,dc_rep_ctrl,mem_rep_ctrl,ack_OUT_rep,ack_dc_rep,ack_mem_rep,select);
input clk; 
 input rst; 
 input OUT_rep_rdy; 
 input v_dc_rep; 
 input v_mem_rep; 
 input [15:0] dc_rep_flit; 
 input [15:0] mem_rep_flit; 
 input [1:0] dc_rep_ctrl; 
 input [1:0] mem_rep_ctrl; 
 output ack_OUT_rep; 
 output ack_dc_rep; 
 output ack_mem_rep; 
 output [1:0] select; 
 parameter arbiter_idle=3'b001; 
 parameter dc_uploading=3'b010; 
 parameter mem_uploading=3'b100; 
 parameter nackrep_cmd=5'b10101; 
 parameter SCflurep_cmd=5'b11100; 
 reg [2:0] nstate; 
 reg [2:0] state; 
 reg priority1; 
 reg ack_OUT_rep; 
 reg ack_dc_rep; 
 reg ack_mem_rep; 
 reg update_priority; 
 reg [1:0] select; 
 always@(*) 
 begin 
  nstate=state; 
  ack_OUT_rep=1'b0; 
  ack_dc_rep=1'b0; 
  ack_mem_rep=1'b0; 
  update_priority=1'b0; 
  select=2'b00; 
  case(state) 
  arbiter_idle: 
  begin 
  if({v_dc_rep,v_mem_rep}==2'b11) 
  begin 
  update_priority=1'b1; 
  if(priority1) 
  begin 
  nstate=dc_uploading; 
  end 
  else 
  begin 
  nstate=mem_uploading; 
  end 
  end 
  else if({v_dc_rep,v_mem_rep}==2'b01) 
  begin 
  nstate=mem_uploading; 
  end 
  else if({v_dc_rep,v_mem_rep}==2'b10) 
  begin 
  nstate=dc_uploading; 
  end 
  end 
  dc_uploading: 
  begin 
  if(OUT_rep_rdy) 
  begin 
  ack_OUT_rep=1'b1; 
  ack_dc_rep=1'b1; 
  select=2'b01; 
  if(dc_rep_ctrl==2'b11||dc_rep_ctrl==2'b01&&(dc_rep_flit[9:5]==SCflurep_cmd||dc_rep_flit[9:5]==nackrep_cmd)) 
  begin 
  nstate=arbiter_idle; 
  end 
  end 
  end 
  mem_uploading: 
  begin 
  if(OUT_rep_rdy) 
  begin 
  ack_OUT_rep=1'b1; 
  ack_mem_rep=1'b1; 
  select=2'b10; 
  if(mem_rep_ctrl==2'b11||mem_rep_ctrl==2'b01&&(mem_rep_flit[9:5]==SCflurep_cmd||mem_rep_flit[9:5]==nackrep_cmd)) 
  begin 
  nstate=arbiter_idle; 
  end 
  end 
  end 
  endcase 
 end 
 always@(posedge clk) 
 begin 
  if(rst) 
  state<=3'b001; 
  else 
  state<=nstate; 
 end 
 always@(posedge clk) 
 begin 
  if(rst) 
  priority1<=1'b0; 
  else if(update_priority) 
  priority1<=~priority1; 
 end 
 endmodule