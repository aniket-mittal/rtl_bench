module fiftyfivenm_io_obuf (
	input i,
	input oe,
	input [15:0] seriesterminationcontrol,
	input devoe,
	output o,
	output obar
);
parameter bus_hold = "false";
parameter open_drain_output = "false";

assign o = (oe) ? i : 1'bz;
assign obar = ~o;

endmodule