module compressor_32(a,b,c,s,ca);
parameter B_SIZE = 8;
input  [B_SIZE-1:0] a;
input  [B_SIZE-1:0] b;
input  [B_SIZE-1:0] c;
output [B_SIZE-1:0] s;
output [B_SIZE-1:0] ca;

wire [B_SIZE-1:0] s;
wire [B_SIZE-1:0]ca;

assign s[B_SIZE-1:0]  = a[B_SIZE-1:0]^b[B_SIZE-1:0]^c[B_SIZE-1:0];
assign ca[B_SIZE-1:0] = (a[B_SIZE-1:0]&b[B_SIZE-1:0])
                      | (c[B_SIZE-1:0]&b[B_SIZE-1:0])
                      | (a[B_SIZE-1:0]&c[B_SIZE-1:0]);

//reg   [B_SIZE-1:0]s,ca;
//integer i;
//always @(a[B_SIZE-1:0]
//      or b[B_SIZE-1:0]
//      or c[B_SIZE-1:0]) 
//begin
//  for(i= 0;i<B_SIZE;i=i+1) begin
//    {ca[i],s[i]} =  a[i] + b[i] +  c[i];
//  end
//end
endmodule