module frequency_monitor #(
	parameter NUM_SIGNALS = 4,
	parameter REF_KHZ = 20'd156250
)
(
	input [NUM_SIGNALS-1:0] signal,
	input ref_clk,
	output [20*NUM_SIGNALS-1:0] khz_counters
);

// Divide reference clock to make a 1 KHz pulse
reg [19:0] ref_cntr = 0;
reg ref_cntr_max = 1'b0;

always @(posedge ref_clk) begin
	ref_cntr_max <= (ref_cntr == (REF_KHZ-2)); 
	if (ref_cntr_max) ref_cntr <= 0;
	else ref_cntr <= ref_cntr + 1'b1;	
end

// Divide by 1000 to create a seconds pulse
reg [9:0] khz_cntr = 0;
reg khz_cntr_max = 1'b0;

always @(posedge ref_clk) begin
	khz_cntr_max <= (khz_cntr == 10'd999) && ref_cntr_max; 
	if (khz_cntr_max) khz_cntr <= 0;
	else if (ref_cntr_max) khz_cntr <= khz_cntr + 1'b1;	
end
wire one_second = khz_cntr_max;

genvar i;
generate 
	for (i=0; i<NUM_SIGNALS; i=i+1) begin : cn
		
		// scale the signal down from MHz range to KHz range
		reg [9:0] prescale = 0;
		reg prescale_max = 0;
		reg scaled_toggle = 0 /* synthesis preserve */
		/* synthesis ALTERA_ATTRIBUTE = "-name SDC_STATEMENT \"set_false_path -from [get_keepers *frequency_monitor*scaled_toggle]\" " */;

		always @(posedge signal[i]) begin
			prescale_max <= (prescale == 10'd998);
			if (prescale_max) prescale <= 0;
			else prescale <= prescale + 1'b1;
			if (prescale_max) scaled_toggle <= ~scaled_toggle;
		end
		
		// synchronize to reference domain
		reg [4:0] capture = 0 /* synthesis preserve */;
		always @(posedge ref_clk) begin
			capture <= {capture [3:0],scaled_toggle};
		end
		
		// tally KHz of signal activity over a 1s window
		reg [19:0] tally = 0,last_tally = 0;
		always @(posedge ref_clk) begin
			if (one_second) begin
				tally <= 0;
				last_tally <= tally;
			end
			else if (capture[4] ^ capture[3]) tally <= tally + 1'b1;
		end
		
		assign khz_counters[(i+1)*20-1:i*20] = last_tally;				
	end
endgenerate

endmodule