module first_stage_of_sync();
parameter mode = 0;
endmodule

module  p_SSYNC3DO_S_PPP (
	 clk
	,d
	,set_
	,q
	);

	//---------------------------------------
	//IO DECLARATIONS

input	 clk ;
input	 d ;
input	 set_ ;
output	 q ;

reg q,d1,d0;
always @(posedge clk or negedge set_)
begin
    if(~set_)
        {q,d1,d0} <= 3'b111;
    else
        {q,d1,d0} <= {d1,d0,d};
end

first_stage_of_sync first_stage_of_sync();

endmodule

module sync3d_s_ppp ( d, clk, set_, q);
input d, clk, set_;
output q;
    p_SSYNC3DO_S_PPP NV_GENERIC_CELL( .d(d), .clk(clk), .set_(set_), .q(q) );
    // synopsys dc_script_begin
    // synopsys dc_script_end
    //g2c if {[find / -null_ok -subdesign sync3d_s_ppp] != {} } { set_attr preserve 1 [find / -subdesign sync3d_s_ppp] }
endmodule