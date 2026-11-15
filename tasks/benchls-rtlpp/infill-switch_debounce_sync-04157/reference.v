module rtlpp_04157(
	input                clk,
	input                rst_n,
	input                switch,
	output               q
);

	wire                 q0;
	wire                 q1;
	wire                 q2;
	reg  [19:0]          counter;
	reg                  slowclk;
	integer              count = 1_000_000;

	always @ (posedge clk, negedge rst_n)
	begin
		if (~rst_n)
			counter <= 20'd0;
		else
		begin
			counter <= counter + 20'd1;
			if (counter >= count) 
			begin
				counter <= 20'd0;
			end
			slowclk <= (counter < count) ? 1'b1 : 1'b0;
		end	
	end
	
	reg q0_dff1, q1_dff1, q2_dff1;

	always @ (posedge slowclk, negedge rst_n)
	begin
		if (~rst_n)
			q0_dff1 <= 1'b0;
		else
			q0_dff1 <= switch;
	end

	always @ (posedge slowclk, negedge rst_n)
	begin
		if (~rst_n)
			q1_dff1 <= 1'b0;
		else
			q1_dff1 <= q0_dff1;
	end

	always @ (posedge clk, negedge rst_n)
	begin
		if (~rst_n)
			q2_dff1 <= 1'b0;
		else
			q2_dff1 <= q1_dff1;
	end

	assign q0 = q0_dff1;
	assign q1 = q1_dff1;
	assign q2 = q2_dff1;
	assign q = ~q2 && q1;

endmodule