module rtlpp_08791(clk, rst, x_input, y_input, z_res);

 input clk, rst;  
 input signed [19:0] x_input;   
 input signed [19:0] y_input;   
 
 output reg signed [19:0] z_res; 
 
 reg signed [19:0] x_input_clk;  
 reg signed [19:0] y_input_clk;  
 
 reg signed [19:0] x;        
 reg signed [19:0] y [9:0];  
 
 reg signed [19:0] look_up [8:0];       
 reg signed [19:0] z[9:0];  
 reg d[9:0]; 
 
 initial begin // Initialize look_up
   look_up[0] = 20'b00010000000000000000;   
   look_up[1] = 20'b00001000000000000000;   
   look_up[2] = 20'b00000100000000000000;   
   look_up[3] = 20'b00000010000000000000;   
   look_up[4] = 20'b00000001000000000000;   
   look_up[5] = 20'b00000000100000000000;   
   look_up[6] = 20'b00000000010000000000;   
   look_up[7] = 20'b00000000001000000000;   
   look_up[8] = 20'b00000000000100000000;
 end
 
 always @(posedge clk) begin
   if (rst == 0) begin
     x_input_clk <= 20'b0;
     y_input_clk <= 20'b0;
     z_res <= 20'b0; 
   end  
   else begin
     x_input_clk <= x_input;
     y_input_clk <= y_input;
     z_res <= z[8][19:0]; 
   end
 end
 
 always @(*) begin
   x = x_input_clk; 
   y[0] = y_input_clk; 
   z[0] = 20'b0; 
   d[0] = ((x[19] ^ (y[0][19])) == 0) ? 0 : 1;
 end

 always @(*) begin
   y[1] = (d[0] == 1) ? (y[0] + x) : (y[0] - x);
   z[1] = (d[0] == 1) ? (z[0] - look_up[0]) : (z[0] + look_up[0]);
   d[1] = ((x[19] ^ (y[1][19])) == 0) ? 0 : 1;

   y[2] = (d[1] == 1) ? (y[1] + (x >>> 1)) : (y[1] - (x >>> 1));
   z[2] = (d[1] == 1) ? (z[1] - look_up[1]) : (z[1] + look_up[1]);
   d[2] = ((x[19] ^ (y[2][19])) == 0) ? 0 : 1;

   y[3] = (d[2] == 1) ? (y[2] + (x >>> 2)) : (y[2] - (x >>> 2));
   z[3] = (d[2] == 1) ? (z[2] - look_up[2]) : (z[2] + look_up[2]);
   d[3] = ((x[19] ^ (y[3][19])) == 0) ? 0 : 1;

   y[4] = (d[3] == 1) ? (y[3] + (x >>> 3)) : (y[3] - (x >>> 3));
   z[4] = (d[3] == 1) ? (z[3] - look_up[3]) : (z[3] + look_up[3]);
   d[4] = ((x[19] ^ (y[4][19])) == 0) ? 0 : 1;

   y[5] = (d[4] == 1) ? (y[4] + (x >>> 4)) : (y[4] - (x >>> 4));
   z[5] = (d[4] == 1) ? (z[4] - look_up[4]) : (z[4] + look_up[4]);
   d[5] = ((x[19] ^ (y[5][19])) == 0) ? 0 : 1;

   y[6] = (d[5] == 1) ? (y[5] + (x >>> 5)) : (y[5] - (x >>> 5));
   z[6] = (d[5] == 1) ? (z[5] - look_up[5]) : (z[5] + look_up[5]);
   d[6] = ((x[19] ^ (y[6][19])) == 0) ? 0 : 1;

   y[7] = (d[6] == 1) ? (y[6] + (x >>> 6)) : (y[6] - (x >>> 6));
   z[7] = (d[6] == 1) ? (z[6] - look_up[6]) : (z[6] + look_up[6]);
   d[7] = ((x[19] ^ (y[7][19])) == 0) ? 0 : 1;

   y[8] = (d[7] == 1) ? (y[7] + (x >>> 7)) : (y[7] - (x >>> 7));
   z[8] = (d[7] == 1) ? (z[7] - look_up[7]) : (z[7] + look_up[7]);
   d[8] = ((x[19] ^ (y[8][19])) == 0) ? 0 : 1;

   y[9] = (d[8] == 1) ? (y[8] + (x >>> 8)) : (y[8] - (x >>> 8));
   z[9] = (d[8] == 1) ? (z[8] - look_up[8]) : (z[8] + look_up[8]);
   d[9] = ((x[19] ^ (y[9][19])) == 0) ? 0 : 1;
 end

endmodule