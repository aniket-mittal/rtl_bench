module rtlpp_04366 (a, b);

output a, b;

// Remove conditional compilation and set default parameters
parameter OutputA = 1;
parameter OutputB = 0;

assign a = OutputA;
assign b = OutputB;

endmodule