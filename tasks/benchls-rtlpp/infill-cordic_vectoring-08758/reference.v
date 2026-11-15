module rtlpp_08758(clk, rst, x_input, y_input, z_res);

input clk, rst;
input signed [19:0] x_input;
input signed [19:0] y_input;

output reg signed [19:0] z_res;

reg signed [19:0] x_input_clk;
reg signed [19:0] y_input_clk;

reg signed [19:0] x;
reg signed [19:0] y [9:0];

wire signed [19:0] look_up [9:0];
reg signed [19:0] z[10:0];
reg d[9:0];

reg d10;
reg signed [19:0] y10;

assign look_up[0] = 20'b00000000010000000000;
assign look_up[1] = 20'b00000000001000000000;
assign look_up[2] = 20'b00000000000100000000;
assign look_up[3] = 20'b00000000000010000000;
assign look_up[4] = 20'b00000000000001000000;
assign look_up[5] = 20'b00000000000000100000;
assign look_up[6] = 20'b00000000000000010000;
assign look_up[7] = 20'b00000000000000001000;
assign look_up[8] = 20'b00000000000000000100;
assign look_up[9] = 20'b00000000000000000010;

always @(posedge clk)
begin
    if (rst == 0)
    begin
        x_input_clk <= 20'b0;
        y_input_clk <= 20'b0;
        z_res <= 20'b0;
    end
    else
    begin
        x_input_clk <= x_input;
        y_input_clk <= y_input;
        z_res <= z[10][19:0];
    end
end

always @(*)
begin
    x = x_input_clk;
    y[0] = y_input_clk;
    z[0] = 20'b0;
    d[0] = ((x[19] ^ (y[0][19])) == 0) ? 0 : 1;
end

integer i;
always @(*)
begin
    for (i = 1; i <= 9; i = i + 1)
    begin
        y[i] = (d[i-1] == 1) ? (y[i-1] + (x >>> (i-1))) : (y[i-1] - (x >>> (i-1)));
        z[i] = (d[i-1] == 1) ? (z[i-1] - look_up[i-1]) : (z[i-1] + look_up[i-1]);
        d[i] = ((x[19] ^ (y[i][19])) == 0) ? 0 : 1;
    end
    
    y10 = (d[9] == 1) ? (y[9] + (x >>> 9)) : (y[9] - (x >>> 9));
    z[10] = (d[9] == 1) ? (z[9] - look_up[9]) : (z[9] + look_up[9]);
    d10 = ((x[19] ^ (y10[19])) == 0) ? 0 : 1;
end

endmodule