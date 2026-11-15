module NV_DW02_tree( INPUT, OUT0, OUT1 );
parameter num_inputs = 8;
parameter input_width = 8;
input [num_inputs*input_width-1 : 0]	INPUT;
output [input_width-1:0]		OUT0, OUT1;

reg [input_width-1 : 0] input_array [num_inputs-1 : 0];
reg [input_width-1 : 0] temp_array [num_inputs-1 : 0];
reg [input_width-1 : 0] input_slice;
integer num_in;
integer i, j;

[MASKED]

assign OUT0 = input_array[0];
assign OUT1 = input_array[1];
endmodule