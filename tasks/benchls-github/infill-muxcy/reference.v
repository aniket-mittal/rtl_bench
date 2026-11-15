module MUXCY (O, CI, DI, S);

    output O;
    reg    O;

    input  CI, DI, S;

	always @(CI or DI or S) begin
	    if (S)
		O <= CI;
	    else
		O <= DI;
	end


endmodule