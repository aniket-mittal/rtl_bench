module mg_06475 (input wire clk_i,input wire areset_i,output reg [15:0] address_o,output reg [7:0] data_o,input wire [7:0] q_i,output reg wren_o,input wire [3:0] A_i,input wire [7:0] D_i,output reg [7:0] D_o,input wire rd_i,input wire wr_i);
parameter IDLE = 4'd0, 
  PRE_READ = 4'd1, READ_READY = 4'd2, READ_CAPTURE = 4'd4, WAIT_READ = 4'd5, 
  WRITE_WAIT = 4'd6, WRITE_NEXT = 4'd7; 
  wire rd_sig, wr_sig, abort_sig; 
  wire read_trigger, write_trigger; 
  reg [15:0] A; 
  reg cpu_rd, cpu_wr, fsm_rd, fsm_wr, cpu_abort, fsm_abort; 
  reg [3:0] state; 
  reg [7:0] rd_buffer; 
  assign rd_sig = (cpu_rd != fsm_rd); 
  assign wr_sig = (cpu_wr != fsm_wr); 
  assign abort_sig = (cpu_abort != fsm_abort); 
  assign read_trigger = (A_i == 4'd8) && rd_i; 
  assign write_trigger = (A_i == 4'd8) && wr_i; 
  always @(posedge clk_i or posedge areset_i) 
  if( areset_i ) 
  begin 
  D_o <= 8'd0; 
  cpu_rd <= 1'b0; 
  cpu_wr <= 1'b0; 
  cpu_abort <= 1'b0; 
  end else if( rd_i | wr_i ) begin 
  case(A_i) 
  4'd0: begin 
  if( wr_i ) A[7:0] <= D_i; else D_o <= A[7:0]; 
  end 
  4'd1: begin 
  if( wr_i ) A[15:8] <= D_i; else D_o <= A[15:8]; 
  end 
  4'd8: begin 
  if( rd_i ) D_o <= rd_buffer; 
  end 
  4'd15: begin 
  if( wr_i ) begin 
  if( D_i[0] ) if( ~rd_sig) cpu_rd <= ~cpu_rd; 
  if( D_i[1] ) if( ~wr_sig) cpu_wr <= ~cpu_wr; 
  if( D_i[7] ) if( ~abort_sig ) cpu_abort <= ~cpu_abort; 
  end else begin 
  D_o <= {8'b0}; 
  end 
  end 
  endcase 
  end 
  [MASKED] 
 endmodule