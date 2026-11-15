module mg_03544(input clk,input rst,input en,input bitval,output reg [15:0] crc);
wire inv; 
 assign inv = bitval ^ crc[15]; 
 [MASKED] 
 endmodule