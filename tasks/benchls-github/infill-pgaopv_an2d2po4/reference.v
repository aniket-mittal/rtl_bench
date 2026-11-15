module  PGAOPV_AN2D2PO4 (
	 A1
	,A2
	,Z
	);

	//---------------------------------------
	//IO DECLARATIONS

input	 A1 ;
input	 A2 ;
output	 Z ;

assign Z = A1 & A2;

endmodule