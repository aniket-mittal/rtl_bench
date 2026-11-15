module reference_arbiter (
	req,grant,base
);

input [15:0] req;
output [15:0] grant;
input [3:0] base;

// rotate the request lines
wire [15:0] b0 = base[0] ? {req[0],req[15:1]} : req[15:0] ;
wire [15:0] b1 = base[1] ? {b0[1:0],b0[15:2]} : b0[15:0] ;
wire [15:0] b2 = base[2] ? {b1[3:0],b1[15:4]} : b1[15:0] ;
wire [15:0] b3 = base[3] ? {b2[7:0],b2[15:8]} : b2[15:0] ;

// pick the lowest one for a grant
wire [15:0] rotated_grant = b3 & ~(b3-1);

// unrotate the grant
wire [15:0] b4 = base[0] ? {rotated_grant[14:0],rotated_grant[15]} : rotated_grant[15:0] ;
wire [15:0] b5 = base[1] ? {b4[13:0],b4[15:14]} : b4[15:0] ;
wire [15:0] b6 = base[2] ? {b5[11:0],b5[15:12]} : b5[15:0] ;
wire [15:0] b7 = base[3] ? {b6[7:0],b6[15:8]} : b6[15:0] ;

assign grant = b7;

endmodule