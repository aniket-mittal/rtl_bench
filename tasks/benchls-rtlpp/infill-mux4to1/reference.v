module Mux4to1(I0, I1, I2, I3, s, o);
    input I0, I1, I2, I3;
    input [1:0] s;
    output o;
    
    assign o = (s == 2'b00) ? I0 : 
               (s == 2'b01) ? I1 : 
               (s == 2'b10) ? I2 : I3;
endmodule