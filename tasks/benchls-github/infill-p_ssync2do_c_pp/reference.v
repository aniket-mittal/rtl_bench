module  p_SSYNC2DO_C_PP (
	 clk
	,d
	,clr_
	,q
	);

	//---------------------------------------
	//IO DECLARATIONS

input	 clk ;
input	 d ;
input	 clr_ ;
output	 q ;

reg q,d0;

always @(posedge clk or negedge clr_)
begin
    if(~clr_)
        {q,d0} <= 2'd0;
    else
        {q,d0} <= {d0,d};
end


endmodule