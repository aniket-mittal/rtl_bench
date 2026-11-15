module mg_03034(keyboard_clk, keyboard_data, clock50, reset, read, scan_ready, scan_code);
input keyboard_clk; 
 input keyboard_data; 
 input clock50; 
 input reset; 
 input read; 
 output scan_ready; 
 output [7:0] scan_code; 
 reg ready_set; 
 reg [7:0] scan_code; 
 reg scan_ready; 
 reg read_char; 
 reg clock; 
 reg [3:0] incnt; 
 reg [8:0] shiftin; 
 reg [7:0] filter; 
 reg keyboard_clk_filtered; 
 always @ (posedge ready_set or posedge read) 
 if (read == 1) scan_ready <= 0; 
 else scan_ready <= 1; 
 always @(posedge clock50) 
  clock <= ~clock; 
 always @(posedge clock) 
 begin 
  filter <= {keyboard_clk, filter[7:1]}; 
  if (filter==8'b1111_1111) keyboard_clk_filtered <= 1; 
  else if (filter==8'b0000_0000) keyboard_clk_filtered <= 0; 
 end 
 [MASKED] 
 endmodule