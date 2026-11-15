module mg_03776(input rst_n,input clk,input se0,output usb_rst);
reg[18:0] cntr; 
 assign usb_rst = cntr == 1'b0; 
 [MASKED] 
 endmodule