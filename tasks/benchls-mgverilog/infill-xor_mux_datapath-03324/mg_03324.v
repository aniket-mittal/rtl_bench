module mg_03324(input [47:0] X,input [59:0] Y,output reg [47:0] Dout,input CLK);
wire [47:0] Xtmp; 
 always @(posedge CLK) 
 begin 
  Dout <= Xtmp ^ Y[47:0]; 
 end 
 [MASKED] 
 endmodule