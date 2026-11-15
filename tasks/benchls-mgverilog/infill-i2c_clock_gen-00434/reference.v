module mg_00434(Enable, ClockI2C, Reset, clock, BaudRate, ClockFrequency);
input [19:0] BaudRate; 
  input [29:0] ClockFrequency; 
  input clock, Reset, Enable; 
  output reg ClockI2C; 
  reg [15:0] baud_count; 
  reg [15:0] counter; 
  always @(posedge clock or posedge Reset) 
  if (Reset == 1) begin baud_count <= 1'b0; ClockI2C <= 1'b1; end 
  else if(Enable == 0) begin baud_count <= 1'b0; ClockI2C <= 1'b1; end 
  else if(baud_count == ClockFrequency/(BaudRate*3)) 
  begin 
  baud_count <= 1'b0; 
  ClockI2C <= ~ClockI2C; 
  end 
  else begin baud_count <= baud_count + 1'b1; end 
 endmodule