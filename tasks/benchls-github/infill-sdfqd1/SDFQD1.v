module  SDFQD1 (
	 SI
	,D
	,SE
	,CP
	,Q
	);

input	 SI ;
input	 D ;
input	 SE ;
input	 CP ;
output	 Q ;
reg Q;

assign sel = SE ? SI : D;

[MASKED]
endmodule