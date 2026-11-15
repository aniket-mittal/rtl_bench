module Button_Debounce(Button, clk, output_tick);

input Button, clk;
output reg output_tick;
reg [31:0] counter;

// Assuming 50MHz clock and 20ms debounce time
localparam DEBOUNCE_LIMIT = 32'd1_000_000;

always @(posedge clk)
begin
	if (Button == 1'b1)
	begin
		if (counter < DEBOUNCE_LIMIT)
			counter <= counter + 32'd1;
		else
			output_tick <= 1'b1;
	end
	else
	begin
		counter <= 32'd0;
		output_tick <= 1'b0;
	end
end
endmodule