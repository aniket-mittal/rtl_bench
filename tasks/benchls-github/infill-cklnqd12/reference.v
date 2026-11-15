module  CKLNQD12 (
	 TE
	,E
	,CP
	,Q
	);

input	 TE ;
input	 E ;
input	 CP ;
output	 Q ;

reg qd;
always @(negedge CP)
    qd <= TE | E;

assign Q = CP & qd;
endmodule