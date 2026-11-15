module mg_05644(input CLK2,input NSA,input [ 4:0] Keypad,input Keyready,output [15:0] INP_BUS,output KeyStrobe);
assign INP_BUS = {2'b00, !NSA, 8'h00, Keypad}; 
 reg [2:0] DRedge; 
 always @(posedge CLK2) DRedge <= {DRedge[1:0], Keyready}; 
 wire DR_risingedge = (DRedge[2:1] == 2'b01); 
 assign KeyStrobe = DR_risingedge; 
 endmodule