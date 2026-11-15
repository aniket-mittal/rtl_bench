module eight_input_rom (in,out);
input [7:0] in;
output out;
wire out /* synthesis keep */;

parameter [255:0] mask = 256'b0;

wire [3:0] t /* synthesis keep */;
wire [63:0] m0 = mask[63:0];
wire [63:0] m1 = mask[127:64];
wire [63:0] m2 = mask[191:128];
wire [63:0] m3 = mask[255:192];

assign t[0] = m0[in[5:0]];
assign t[1] = m1[in[5:0]];
assign t[2] = m2[in[5:0]];
assign t[3] = m3[in[5:0]];
assign out = t[in[7:6]];

endmodule

module sbox (in,out);
input [7:0] in;
output [7:0] out;
wire [7:0] out;

parameter METHOD = 1;

generate
  if (METHOD == 0) begin
    reg [7:0] o;
    [MASKED]
    assign out = o;
  end
  else if (METHOD == 1) begin
      eight_input_rom r0 (.in(in),.out(out[0]));
        defparam r0 .mask = 256'h4f1ead396f247a0410bdb210c006eab568ab4bfa8acb7a13b14ede67096c6eed;
      eight_input_rom r1 (.in(in),.out(out[1]));
        defparam r1 .mask = 256'hc870974094ead8a96a450b2ef33486b4e61a4c5e97816f7a7bae007d4c53fc7d;
      eight_input_rom r2 (.in(in),.out(out[2]));
        defparam r2 .mask = 256'hac39b6c0d6ce2efc577d64e03b0c3ffb23a869a2a428c424a16387fb3b48b4c6;
      eight_input_rom r3 (.in(in),.out(out[3]));
        defparam r3 .mask = 256'h4e9ddb76c892fb1be9da849cf6ac6c1b2568ea2effa8527d109020a2193d586a;
      eight_input_rom r4 (.in(in),.out(out[4]));
        defparam r4 .mask = 256'hf210a3aece472e532624b286bc48ecb4f7f17a494ce30f58c2b0f97752b8b11e;
      eight_input_rom r5 (.in(in),.out(out[5]));
        defparam r5 .mask = 256'h54b248130b4f256f7d8dcc4706319e086bc2aa4e0d787aa4f8045f7b6d98dd7f;
      eight_input_rom r6 (.in(in),.out(out[6]));
        defparam r6 .mask = 256'h21e0b833255917823f6bcb91b30db559e4851b3bf3ab2560980a3cc2c2fdb4ff;
      eight_input_rom r7 (.in(in),.out(out[7]));
        defparam r7 .mask = 256'h52379de7b844e3e14cb3770196ca0329e7bac28f866aac825caa2ec7bf977090;
  end
endgenerate
endmodule

module sub_bytes (in,out);
input [16*8-1 : 0] in;
output [16*8-1 : 0] out;
wire [16*8-1 : 0] out;

genvar i;
generate
    for (i=0; i<16; i=i+1)
    begin : sb
        sbox s (.in(in[8*i+7:8*i]), .out(out[8*i+7:8*i]));
    end
endgenerate
endmodule