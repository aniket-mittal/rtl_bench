module mg_04271(x_axis,y_axis,z_axis,temp_data,data,sel);
input [15:0] x_axis; 
  input [15:0] y_axis; 
  input [15:0] z_axis; 
  input [7:0] temp_data; 
  input [1:0] sel; 
  output [15:0] data; 
  reg [15:0] data; 
  always @(sel, x_axis, y_axis, z_axis, temp_data) begin 
  case (sel) 
  2'b00 : data <= x_axis; 
  2'b01 : data <= y_axis; 
  2'b10 : data <= z_axis; 
  2'b11 : data <= {8'h00, temp_data}; 
  endcase 
  end 
 endmodule