module mg_07247(input clk,input clr,input [19:0] scroll_datain_QU,output [15:0] scroll_dataout_QU);
reg [26:0] q; 
 reg [23:0] msg_array; 
 always @(posedge clk_3 or posedge clr) 
 begin 
 if(clr==1) 
  begin 
  msg_array [19:0] <= scroll_datain_QU[19:0]; 
  msg_array [23:20] <= 'hC; 
  end 
 else 
  begin 
  msg_array [19:0] <= msg_array[23:4]; 
  msg_array [23:20] <= msg_array[3:0]; 
  end 
 end 
 assign scroll_dataout_QU[15:0] = msg_array[15:0]; 
 always @(posedge clk or posedge clr) 
 begin 
 if(clr==1) 
 q<=0; 
 else 
 q<=q+1; 
 end 
 assign clk_3 = q[26]; 
 endmodule