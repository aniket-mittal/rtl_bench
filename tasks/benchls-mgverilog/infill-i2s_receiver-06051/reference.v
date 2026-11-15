module mg_06051 (input clk,input FRM,input BCK,input DIN,output [15:0] out_L,output [15:0] out_R,output ready_L,output ready_R);
assign out_L = data_L[15:0]; 
 assign out_R = data_R[15:0]; 
 assign ready_L = FRM_Rise; 
 assign ready_R = FRM_Fall; 
 reg [2:0] FRM_1; 
 always @(posedge BCK) FRM_1 <= {FRM_1[1:0], FRM}; 
 wire FRM_delayed = FRM_1[1]; 
 reg [2:0] FRMr; 
 always @(posedge clk) FRMr <= {FRMr[1:0], FRM_delayed}; 
 wire FRM_Rise = (FRMr[2:1] == 2'b01); 
 wire FRM_Fall = (FRMr[2:1] == 2'b10); 
 reg [16:0] data_R; 
 reg [16:0] data_L; 
 always @(posedge BCK) begin 
  if(FRM_delayed) begin 
  data_R <= {data_R[15:0], DIN}; 
  end 
  else begin 
  data_L <= {data_L[15:0], DIN}; 
  end 
 end 
 endmodule