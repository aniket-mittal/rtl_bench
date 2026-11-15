module mg_05689(Y,I0,I1,I2,I3,C0,C1);
input I0,I1,I2,I3,C0,C1; 
  output Y; 
  reg Y; 
  always@(I0 or I1 or I2 or I3 or C0 or C1) begin 
  case ({C1,C0}) 
  2'b00 : Y = I0 ; 
  2'b01 : Y = I1 ; 
  2'b10 : Y = I2 ; 
  2'b11 : Y = I3 ; 
  endcase 
  end 
 endmodule