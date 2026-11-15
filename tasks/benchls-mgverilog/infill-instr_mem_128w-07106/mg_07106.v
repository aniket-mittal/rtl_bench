module mg_07106(input [3:0]Mem_byte_wr_in,input clk,input [31:0]Mem_data,input [31:0]Mem_addr_in,output reg [31:0]Mem_data_out);
reg [31:0]addr; 
 integer i; 
 reg [7:0] IR_reg [500:0]; 
 initial 
 begin 
 for(i=0;i<=500;i=i+1) IR_reg[i]=8'b0; 
 IR_reg[256] = 8'b10011000; 
 IR_reg[257] = 8'b10010110; 
 IR_reg[258] = 8'b10011100; 
 IR_reg[259] = 8'b11001110; 
 end 
 [MASKED] 
 endmodule