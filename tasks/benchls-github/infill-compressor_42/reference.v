module compressor_42(p0,p1,p2,p3,cin,s,ca,cout);
parameter B_SIZE = 8;
  
input  [B_SIZE-1:0] p0;
input  [B_SIZE-1:0] p1;
input  [B_SIZE-1:0] p2;
input  [B_SIZE-1:0] p3;
input  [B_SIZE-1:0] cin;
output [B_SIZE-1:0] s;
output [B_SIZE-1:0] ca;
output [B_SIZE-1:0] cout;

wire   [B_SIZE-1:0]  xor0;
wire   [B_SIZE-1:0]  xor1;
wire   [B_SIZE-1:0]  xor2;
wire   [B_SIZE-1:0]  s;
wire   [B_SIZE-1:0]  ca;
wire   [B_SIZE-1:0]  cout;

assign xor0[B_SIZE-1:0] = p0[B_SIZE-1:0] ^ p1[B_SIZE-1:0];
assign xor1[B_SIZE-1:0] = p2[B_SIZE-1:0] ^ p3[B_SIZE-1:0];
assign xor2[B_SIZE-1:0] = xor1[B_SIZE-1:0] ^ xor0[B_SIZE-1:0];

//cout is used for input cin
assign cout[B_SIZE-1:0] = xor0[B_SIZE-1:0] & p2[B_SIZE-1:0]
                        | (~xor0[B_SIZE-1:0] & p0[B_SIZE-1:0]);
assign s[B_SIZE-1:0]    = xor2[B_SIZE-1:0] ^ cin[B_SIZE-1:0];
assign ca[B_SIZE-1:0]   = xor2[B_SIZE-1:0] & cin[B_SIZE-1:0]
                        | ~xor2[B_SIZE-1:0] & p3[B_SIZE-1:0];

endmodule