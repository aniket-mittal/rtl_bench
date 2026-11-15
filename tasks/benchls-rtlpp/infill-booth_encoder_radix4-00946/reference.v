module rtlpp_00946 (
    input yc,   
    input yb,   
    input ya,   
    output negx,   
    output x,   
    output neg2x,   
    output _2x   
);   
  
  assign negx = (yc & yb & ~ya) | (yc & ~yb & ya);  
  assign x = (~yc & ~yb & ya) | (~yc & yb & ~ya);  
  assign neg2x = (yc & ~yb & ~ya);  
  assign _2x = (~yc & yb & ya);  
endmodule