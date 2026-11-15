module LUT5(O, I0, I1, I2, I3, I4);
  parameter INIT = 0;
  input I0, I1, I2, I3, I4;
  output O;
  wire [31:0] lutdata;
  assign lutdata = INIT;
  wire [4:0] idx;
  assign idx = { I4, I3, I2, I1, I0 };
  assign O = lutdata[idx];
endmodule