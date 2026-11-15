module rtlpp_01161 (a, b);
  output a, b;
  reg a, b;
  
  // Define parameters based on the condition `SIM`
  parameter OutputA = 0;
  parameter OutputB = 1;
  `ifdef SIM
    assign a = 1;
    assign b = 0;
  `else
    assign a = OutputA;
    assign b = OutputB;
  `endif
  
endmodule