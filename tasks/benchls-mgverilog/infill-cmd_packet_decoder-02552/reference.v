module mg_02552 (reset, bitin, bitclk, cmd_out, packet_complete_out, cmd_complete,m, trext, dr);
input reset, bitin, bitclk; 
  output packet_complete_out, cmd_complete; 
  output [8:0] cmd_out; 
  output [1:0] m; 
  output trext, dr; 
  reg packet_complete_out; 
  wire [8:0] cmd_out; 
  wire packet_complete, cmd_complete; 
  reg [7:0] cmd; 
  wire [7:0] new_cmd; 
  reg [5:0] count; 
  reg [1:0] m; 
  reg trext, dr; 
  always @ (posedge bitclk or posedge reset) begin 
  if(reset) begin 
  count <= 0; 
  cmd <= 0; 
  m <= 0; 
  dr <= 0; 
  trext <= 0; 
  packet_complete_out <= 0; 
  end else begin 
  cmd <= new_cmd; 
  count <= count + 6'd1; 
  packet_complete_out <= packet_complete; 
  if(cmd_out[2] && count == 4) dr <= bitin; 
  if(cmd_out[2] && count == 5) m[1] <= bitin; 
  if(cmd_out[2] && count == 6) m[0] <= bitin; 
  if(cmd_out[2] && count == 7) trext <= bitin; 
  end 
  end 
  assign cmd_complete = (cmd_out > 0); 
 assign packet_complete = ((cmd_out[0] && count >= 3 ) ||(cmd_out[1] && count >= 17) ||(cmd_out[2] && count >= 21) ||(cmd_out[3] && count >= 8 ) ||(cmd_out[4] && count >= 44) ||(cmd_out[5] && count >= 7 ) ||(cmd_out[6] && count >= 39) ||(cmd_out[7] && count >= 57) ||(cmd_out[8] && count >= 58)); 
  assign cmd_out[0] = (count >= 2 && ~cmd[0] && ~cmd[1]); 
  assign cmd_out[1] = (count >= 2 && ~cmd[0] && cmd[1]); 
  assign cmd_out[2] = (count >= 4 && cmd[0] && ~cmd[1] && ~cmd[2] && ~cmd[3]); 
  assign cmd_out[3] = (count >= 4 && cmd[0] && ~cmd[1] && ~cmd[2] && cmd[3]); 
  assign cmd_out[4] = (count >= 4 && cmd[0] && ~cmd[1] && cmd[2] && ~cmd[3]); 
  assign cmd_out[5] = (count >= 8 && cmd[0] && cmd[1] && ~cmd[6] && ~cmd[7]); 
  assign cmd_out[6] = (count >= 8 && cmd[0] && cmd[1] && ~cmd[6] && cmd[7]); 
  assign cmd_out[7] = (count >= 8 && cmd[0] && cmd[1] && cmd[6] && ~cmd[7]); 
  assign cmd_out[8] = (count >= 8 && cmd[0] && cmd[1] && cmd[6] && cmd[7]); 
  assign new_cmd[0] = (count==0) ? bitin : cmd[0]; 
  assign new_cmd[1] = (count==1) ? bitin : cmd[1]; 
  assign new_cmd[2] = (count==2 && !cmd_complete) ? bitin : cmd[2]; 
  assign new_cmd[3] = (count==3 && !cmd_complete) ? bitin : cmd[3]; 
  assign new_cmd[4] = (count==4 && !cmd_complete) ? bitin : cmd[4]; 
  assign new_cmd[5] = (count==5 && !cmd_complete) ? bitin : cmd[5]; 
  assign new_cmd[6] = (count==6 && !cmd_complete) ? bitin : cmd[6]; 
  assign new_cmd[7] = (count==7 && !cmd_complete) ? bitin : cmd[7]; 
 endmodule