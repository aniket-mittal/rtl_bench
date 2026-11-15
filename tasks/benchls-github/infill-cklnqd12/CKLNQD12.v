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
[MASKED]

assign Q = CP & qd;
endmodule