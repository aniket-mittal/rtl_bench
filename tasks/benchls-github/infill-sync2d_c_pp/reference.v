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

module sync2d_c_pp ( d, clk, clr_, q );
input  d, clk, clr_;
output q;
    p_SSYNC2DO_C_PP NV_GENERIC_CELL( .d(d), .clk (clk), .clr_(clr_), .q(q) );
    // synopsys dc_script_begin
    // synopsys dc_script_end
    //g2c if {[find / -null_ok -subdesign sync2d_c_pp] != {} } { set_attr preserve 1 [find / -subdesign sync2d_c_pp] }
endmodule