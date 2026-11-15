module mg_02889(output reg bunch_strb,input store_strb,input clk,input [7:0] b1_strobe,input [7:0] b2_strobe,input [1:0] no_bunches,input [3:0] no_samples,input [7:0] sample_spacing,output reg LUTcond);
reg [4:0] bunch_counter=0; 
 initial bunch_strb=0; 
 (* equivalent_register_removal = "no"*) reg [7:0] i; 
 reg [7:0] start_bunch_strb=0; 
 reg [7:0] end_bunch_strb=0; 
 always @ (posedge clk) begin 
 LUTcond<=i==b2_strobe+1|| i== b2_strobe+sample_spacing+1; 
 if (store_strb) begin 
 i<=i+1; 
 end 
 else i<=0; 
 end 
 reg cond1,cond1_a, cond2, cond3; 
 [MASKED] 
 endmodule