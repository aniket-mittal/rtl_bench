module mg_00620 (clk,data,rdaddress,rdclken,reset_n,wraddress,wrclock,wren,q);
output [ 15: 0] q; 
  input clk; 
  input [ 15: 0] data; 
  input [ 4: 0] rdaddress; 
  input rdclken; 
  input reset_n; 
  input [ 4: 0] wraddress; 
  input wrclock; 
  input wren; 
  reg [ 15: 0] mem_array [ 31: 0]; 
  wire [ 15: 0] q; 
  reg [ 4: 0] read_address; 
  always @(posedge clk or negedge reset_n) 
  begin 
  if (reset_n == 0) 
  read_address <= 0; 
  else if (rdclken) 
  read_address <= rdaddress; 
  end 
  assign q = mem_array[read_address]; 
  always @(posedge wrclock) 
  begin 
  if (wren) 
  mem_array[wraddress] <= data; 
  end 
 endmodule