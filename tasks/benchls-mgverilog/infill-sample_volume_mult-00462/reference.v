module mg_00462 (input [7:0] sample,input [5:0] volume,output [13:0] out);
wire [13:0] sesample; 
 wire [13:0] sevolume; 
 assign sesample[13:0] = {{6{sample[7]}},sample[7:0]}; 
 assign sevolume[13:0] = {8'b00000000,volume[5:0]}; 
 assign out[13:0] = {sesample[13:0] * sevolume[13:0]}; 
 endmodule