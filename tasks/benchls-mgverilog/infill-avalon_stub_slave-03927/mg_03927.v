module mg_03927 (input wire [3:0] avs_s0_address,input wire avs_s0_read,output wire [31:0] avs_s0_readdata,output wire avs_s0_readdatavalid,input wire avs_s0_write,input wire [31:0] avs_s0_writedata,output wire avs_s0_waitrequest,input wire [3:0] avs_s0_byteenable,input wire clock_clk,input wire reset_reset,output wire ins_irq0_irq);
[MASKED] 
  assign avs_s0_readdatavalid = 1'b0; 
  assign ins_irq0_irq = 1'b0; 
 endmodule