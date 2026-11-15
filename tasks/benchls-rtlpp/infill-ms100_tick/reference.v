module ms100_tick (clk, reset, tick);

input clk, reset;
output reg tick;
reg [18:0] count;

localparam compare_val = 19'b1111010000100011111;

always @(posedge clk or negedge reset)
begin
	if (~reset)
		count <= 19'b0;
	else
	begin
		if (count == compare_val)
		begin
			count <= 19'b0;
			tick <= 1'b1;
		end
		else
		begin
			count <= count + 19'b1;
			tick <= 1'b0;
		end
	end
end
endmodule