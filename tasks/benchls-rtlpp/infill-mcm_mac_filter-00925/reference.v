module rtlpp_00925 (clk, reset, X, Y); 

parameter word_size_in = 8; 
parameter word_size_out = 20; 

input clk, reset;
input signed [word_size_in-1:0] X;   
output reg signed [word_size_out-1:0] Y;

wire signed [word_size_in:0] x1;
wire signed [10:0] x3;
assign x1 = X;
assign x3 = +(x1<<1)+(x1<<0);

wire signed [11:0] x_4;  
wire signed [9:0] x_1;
wire signed [11:0] x4;
wire signed [12:0] x9;
wire signed [11:0] x5;
wire signed [12:0] x_15;
wire signed [14:0] x_36;
wire signed [13:0] x_22;
wire signed [14:0] x51;
wire signed [16:0] x161;
wire signed [16:0] x244;

assign x_4 = -(x1<<2);
assign x_1 = -(x1<<0);
assign x4 = +(x1<<2);
assign x9 = +(x1<<0)+(x1<<3);
assign x5 = -(x3<<0)+(x1<<3);
assign x_15 = +(x1<<0)-(x1<<4);
assign x_36 = -(x9<<2);
assign x_22 = -(x3<<1)-(x1<<4);
assign x51 = +(x3<<0)+(x3<<4);
assign x161 = +(x1<<0)-(x1<<5)+(x3<<6);
assign x244 = -(x3<<2)+(x1<<8);

wire signed [11:0] SCM_0;  
wire signed [9:0] SCM_1;
wire signed [11:0] SCM_2;
wire signed [12:0] SCM_3;
wire signed [11:0] SCM_4;
wire signed [12:0] SCM_5;
wire signed [14:0] SCM_6;
wire signed [13:0] SCM_7;
wire signed [14:0] SCM_8;
wire signed [16:0] SCM_9;
wire signed [16:0] SCM_10;
wire signed [16:0] SCM_11;
wire signed [16:0] SCM_12;
wire signed [14:0] SCM_13;
wire signed [13:0] SCM_14;
wire signed [14:0] SCM_15;
wire signed [12:0] SCM_16;
wire signed [11:0] SCM_17;
wire signed [12:0] SCM_18;
wire signed [11:0] SCM_19;
wire signed [9:0] SCM_20;

assign SCM_0 = x_4;
assign SCM_1 = x_1;
assign SCM_2 = x4;
assign SCM_3 = x9;
assign SCM_4 = x5;
assign SCM_5 = x_15;
assign SCM_6 = x_36;
assign SCM_7 = x_22;
assign SCM_8 = x51;
assign SCM_9 = x161;
assign SCM_10 = x244;
assign SCM_11 = x244;
assign SCM_12 = x161;
assign SCM_13 = x51;
assign SCM_14 = x_22;
assign SCM_15 = x_36;
assign SCM_16 = x_15;
assign SCM_17 = x5;
assign SCM_18 = x9;
assign SCM_19 = x4;
assign SCM_20 = x_1;

reg signed [19:0] MAC_0; 
reg signed [19:0] MAC_1;
reg signed [19:0] MAC_2;
reg signed [19:0] MAC_3;
reg signed [19:0] MAC_4;
reg signed [19:0] MAC_5;
reg signed [19:0] MAC_6;
reg signed [19:0] MAC_7;
reg signed [18:0] MAC_8;
reg signed [18:0] MAC_9;
reg signed [18:0] MAC_10;
reg signed [18:0] MAC_11;
reg signed [17:0] MAC_12;
reg signed [16:0] MAC_13;
reg signed [15:0] MAC_14;
reg signed [15:0] MAC_15;
reg signed [14:0] MAC_16;
reg signed [13:0] MAC_17;
reg signed [12:0] MAC_18;
reg signed [11:0] MAC_19;
reg signed [9:0] MAC_20;

wire signed [19:0] Y_in;

always @(posedge clk or negedge reset) begin
  if (~reset) begin
    MAC_0 <=  0;
    MAC_1 <=  0;
    MAC_2 <=  0;
    MAC_3 <=  0;
    MAC_4 <=  0;
    MAC_5 <=  0;
    MAC_6 <=  0;
    MAC_7 <=  0;
    MAC_8 <=  0;
    MAC_9 <=  0;
    MAC_10 <=  0;
    MAC_11 <=  0;
    MAC_12 <=  0;
    MAC_13 <=  0;
    MAC_14 <=  0;
    MAC_15 <=  0;
    MAC_16 <=  0;
    MAC_17 <=  0;
    MAC_18 <=  0;
    MAC_19 <=  0;
    MAC_20 <=  0;
    Y <= 0;
  end else begin
    MAC_0 <=  MAC_1 + SCM_0;
    MAC_1 <=  MAC_2 + SCM_1;
    MAC_2 <=  MAC_3 + SCM_2;
    MAC_3 <=  MAC_4 + SCM_3;
    MAC_4 <=  MAC_5 + SCM_4;
    MAC_5 <=  MAC_6 + SCM_5;
    MAC_6 <=  MAC_7 + SCM_6;
    MAC_7 <=  MAC_8 + SCM_7;
    MAC_8 <=  MAC_9 + SCM_8;
    MAC_9 <=  MAC_10 + SCM_9;
    MAC_10 <=  MAC_11 + SCM_10;
    MAC_11 <=  MAC_12 + SCM_11;
    MAC_12 <=  MAC_13 + SCM_12;
    MAC_13 <=  MAC_14 + SCM_13;
    MAC_14 <=  MAC_15 + SCM_14;
    MAC_15 <=  MAC_16 + SCM_15;
    MAC_16 <=  MAC_17 + SCM_16;
    MAC_17 <=  MAC_18 + SCM_17;
    MAC_18 <=  MAC_19 + SCM_18;
    MAC_19 <=  MAC_20 + SCM_19;
    MAC_20 <=  SCM_20;
    Y <= Y_in;
  end
end

assign Y_in = MAC_0;

endmodule