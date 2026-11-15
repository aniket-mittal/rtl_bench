module LUT1(O, I0);
  parameter INIT = 0;
  input I0;
  output O;
  wire [1:0] lutdata;
  assign lutdata = INIT;
  wire [0:0] idx;
  assign idx = I0;
  assign O = lutdata[idx];
endmodule