module mg_06186(input signed [20:0] charge_in,input signed [14:0] signal_in,input delay_en,input clk,input store_strb,output reg [12:0] DSPout,input bunch_strb);
(* equivalent_register_removal = "no"*) reg [7:0] j; 
 reg signed [47:0] DSPout_temp, DSPout_temp2,DSPout_temp4,DSPout_temp5; 
 reg signed [47:0] delayed =48'b0; 
 reg signed [47:0] delayed_a =48'b0; 
 reg signed [47:0] delayed_b =48'b0; 
 reg signed [12:0] DSPout_temp6; 
 initial DSPout=0; 
 [MASKED] 
 always @ (posedge clk) begin 
 if (~bunch_strb) j<=j+1; 
 else j<=0; 
 end 
 always @ (posedge clk) begin 
 delayed<=delayed_a; 
 delayed_a<=delayed_b; 
 if (~store_strb) begin 
 delayed_b<=0; 
 end 
 else if (j==1) delayed_b<=DSPout_temp5; 
 else delayed_b<=delayed_b; 
 end 
 endmodule