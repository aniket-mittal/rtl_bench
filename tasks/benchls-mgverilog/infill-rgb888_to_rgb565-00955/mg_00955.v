module mg_00955(input[23:0] rgb24,output[15:0] vga);
[MASKED] 
  assign vga[10:5] = rgb24[15:10]; 
  assign vga[4:0] = rgb24[7:3]; 
 endmodule