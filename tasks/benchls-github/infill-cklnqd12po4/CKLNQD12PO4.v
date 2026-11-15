module  CKLNQD12PO4 (
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