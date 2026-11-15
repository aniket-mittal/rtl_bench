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
 always@(posedge clk) 
 begin 
 addr = {Mem_addr_in[31:2],2'b00}; 
 if(Mem_byte_wr_in[3]) 
  IR_reg[addr+3]<=Mem_data[31:24]; 
 if(Mem_byte_wr_in[2]) 
  IR_reg[addr+2]<=Mem_data[23:16]; 
 if(Mem_byte_wr_in[1]) 
  IR_reg[addr+1]<=Mem_data[15:8]; 
 if(Mem_byte_wr_in[0]) 
  IR_reg[addr]<=Mem_data[7:0]; 
 if(addr >= 496) 
  Mem_data_out <= 32'h00000000; 
 else begin 
  Mem_data_out[31:24]<=IR_reg[addr + 3]; 
  Mem_data_out[23:16]<=IR_reg[addr+2]; 
  Mem_data_out[15:8]<=IR_reg[addr+1]; 
  Mem_data_out[7:0]<=IR_reg[addr]; 
 end 
 end 
 endmodule