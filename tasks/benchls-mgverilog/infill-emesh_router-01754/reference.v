module mg_01754 (cmesh_wait_out, cmesh_access_out, cmesh_packet_out, rmesh_wait_out,rmesh_access_out, rmesh_packet_out, xmesh_wait_out,xmesh_access_out, xmesh_packet_out, emesh_wait_out,emesh_access_out, emesh_packet_out,cmesh_access_in, cmesh_packet_in, cmesh_wait_in, rmesh_access_in,rmesh_packet_in, rmesh_wait_in, xmesh_access_in, xmesh_packet_in,xmesh_wait_in, emesh_access_in, emesh_packet_in, emesh_wait_in);
parameter AW = 32; 
  parameter PW = 2*AW+40; 
  input cmesh_access_in; 
  input [PW-1:0] cmesh_packet_in; 
  output cmesh_wait_out; 
  output cmesh_access_out; 
  output [PW-1:0] cmesh_packet_out; 
  input cmesh_wait_in; 
  input rmesh_access_in; 
  input [PW-1:0] rmesh_packet_in; 
  output rmesh_wait_out; 
  output rmesh_access_out; 
  output [PW-1:0] rmesh_packet_out; 
  input rmesh_wait_in; 
  input xmesh_access_in; 
  input [PW-1:0] xmesh_packet_in; 
  output xmesh_wait_out; 
  output xmesh_access_out; 
  output [PW-1:0] xmesh_packet_out; 
  input xmesh_wait_in; 
  input emesh_access_in; 
  input [PW-1:0] emesh_packet_in; 
  output emesh_wait_out; 
  output emesh_access_out; 
  output [PW-1:0] emesh_packet_out; 
  input emesh_wait_in; 
  assign cmesh_access_out = emesh_access_in & emesh_packet_in[0]; 
  assign rmesh_access_out = emesh_access_in & ~emesh_packet_in[0]; 
  assign xmesh_access_out = 1'b0; 
  assign cmesh_packet_out[PW-1:0] = emesh_packet_in[PW-1:0]; 
  assign rmesh_packet_out[PW-1:0] = emesh_packet_in[PW-1:0]; 
  assign xmesh_packet_out[PW-1:0] = emesh_packet_in[PW-1:0]; 
  assign emesh_wait_out = cmesh_wait_in | 
  rmesh_wait_in | 
  xmesh_wait_in; 
  assign emesh_access_out = cmesh_access_in | 
  rmesh_access_in | 
  xmesh_access_in; 
  assign emesh_packet_out[PW-1:0] = cmesh_access_in ? cmesh_packet_in[PW-1:0] : 
  rmesh_access_in ? rmesh_packet_in[PW-1:0] : 
  xmesh_packet_in[PW-1:0]; 
  assign cmesh_wait_out = (cmesh_access_in & emesh_wait_in); 
  assign rmesh_wait_out = rmesh_access_in & 
  (emesh_wait_in | cmesh_access_in); 
  assign xmesh_wait_out = xmesh_access_in & 
  (emesh_wait_in | cmesh_access_in | rmesh_access_in); 
 endmodule