module mg_01692 (input RST_N,input CLK,input INST_DIV,input INST_DIVU,input INST_REM,input INST_REMU,input [31:0] RS1,input [31:0] RS2,output wire WAIT,output wire READY,output wire [31:0] RD);
reg [1:0] state; 
  localparam S_IDLE = 2'd0; 
  localparam S_EXEC = 2'd1; 
  localparam S_FIN = 2'd2; 
  wire start; 
  assign start = INST_DIV | INST_DIVU | INST_REM | INST_REMU; 
  reg [31:0] dividend; 
  reg [62:0] divisor; 
  reg [31:0] quotient, quotient_mask; 
  reg outsign; 
  reg reg_inst_div, reg_inst_rem; 
  [MASKED] 
  assign WAIT = (state != S_IDLE); 
  assign READY = (state == S_FIN); 
  assign RD = (reg_inst_div)?((outsign)?-quotient:quotient): 
  ((outsign)?-dividend:dividend); 
 endmodule