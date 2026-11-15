module first_stage_of_sync();
parameter mode = 0;
endmodule

module  p_SSYNC3DO (
	 clk
	,d
	,q
	);

	//---------------------------------------
	//IO DECLARATIONS

input	 clk ;
input	 d ;
output	 q ;

reg q, d1, d0;

always @(posedge clk)
begin
    {q,d1,d0} <= {d1,d0,d};
end

first_stage_of_sync first_stage_of_sync();

endmodule

module sync3d ( d, clk, q);
input d, clk;
output q;
    p_SSYNC3DO NV_GENERIC_CELL( .d(d), .clk(clk), .q(q) );
    // synopsys dc_script_begin
    // synopsys dc_script_end
    //g2c if {[find / -null_ok -subdesign sync3d] != {} } { set_attr preserve 1 [find / -subdesign sync3d] }
endmodule