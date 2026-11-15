module mg_04312 (flit,ctrl,en_dest_fifo,dest_fifo,flit2pass_req,ctrl2pass_req,flit2pass_rep,ctrl2pass_rep,flit2local_in_req,ctrl2local_in_req,flit2local_in_rep,ctrl2local_in_rep,en_pass_req,en_pass_rep,en_local_in_req,en_local_in_rep);
input [15:0] flit; 
 input [1:0] ctrl; 
 input en_dest_fifo; 
 input [1:0] dest_fifo; 
 output [15:0] flit2pass_req; 
 output [1:0] ctrl2pass_req; 
 output [15:0] flit2pass_rep; 
 output [1:0] ctrl2pass_rep; 
 output [15:0] flit2local_in_req; 
 output [1:0] ctrl2local_in_req; 
 output [15:0] flit2local_in_rep; 
 output [1:0] ctrl2local_in_rep; 
 output en_pass_req; 
 output en_pass_rep; 
 output en_local_in_req; 
 output en_local_in_rep; 
 reg [15:0] flit2pass_req; 
 reg [1:0] ctrl2pass_req; 
 reg [15:0] flit2pass_rep; 
 reg [1:0] ctrl2pass_rep; 
 reg [15:0] flit2local_in_req; 
 reg [1:0] ctrl2local_in_req; 
 reg [15:0] flit2local_in_rep; 
 reg [1:0] ctrl2local_in_rep; 
 reg en_pass_req; 
 reg en_pass_rep; 
 reg en_local_in_req; 
 reg en_local_in_rep; 
 always@(*) 
 begin 
  {en_pass_req,flit2pass_req,ctrl2pass_req}={1'b0,flit,ctrl}; 
  {en_pass_rep,flit2pass_rep,ctrl2pass_rep}={1'b0,flit,ctrl}; 
  {en_local_in_req,flit2local_in_req,ctrl2local_in_req}={1'b0,flit,ctrl}; 
  {en_local_in_rep,flit2local_in_rep,ctrl2local_in_rep}={1'b0,flit,ctrl}; 
  if(en_dest_fifo) 
  begin 
  case(dest_fifo) 
  2'b00:{en_pass_req,flit2pass_req,ctrl2pass_req}={1'b1,flit,ctrl}; 
  2'b01:{en_pass_rep,flit2pass_rep,ctrl2pass_rep}={1'b1,flit,ctrl}; 
  2'b10:{en_local_in_req,flit2local_in_req,ctrl2local_in_req}={1'b1,flit,ctrl}; 
  2'b11:{en_local_in_rep,flit2local_in_rep,ctrl2local_in_rep}={1'b1,flit,ctrl}; 
  endcase 
  end 
 end 
 endmodule