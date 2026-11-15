module pipeline_add_msb (clk,rst,a,b,o,msb);

parameter LS_WIDTH = 10;
parameter MS_WIDTH = 10;
parameter WIDTH = LS_WIDTH + MS_WIDTH;

input [WIDTH-1:0] a,b;
input clk,rst;
output [WIDTH-1:0] o;
output msb;
reg [WIDTH-1:0] o;

	// Build the less significant adder with an extra bit on the top to get
	// the carry chain onto the normal routing.  
	reg [LS_WIDTH-1+1:0] ls_adder;
	wire cross_carry = ls_adder[LS_WIDTH];
	always @(posedge clk or posedge rst) begin
		if (rst) ls_adder <= 1'b0;
		else ls_adder <= {1'b0,a[LS_WIDTH-1:0]} + {1'b0,b[LS_WIDTH-1:0]};
	end

	// the more significant data needs to wait a tick for the carry
	// signal to be ready
	reg [MS_WIDTH-1:0] ms_data_a,ms_data_b;
	always @(posedge clk or posedge rst) begin
		if (rst) begin
			ms_data_a <= 0;
			ms_data_b <= 0;
		end
		else begin
			ms_data_a <= a[WIDTH-1:WIDTH-MS_WIDTH];
			ms_data_b <= b[WIDTH-1:WIDTH-MS_WIDTH];
		end
	end

	// Build the more significant adder with an extra low bit to incorporate
	// the carry from the split lower chain.
	wire [MS_WIDTH-1+1:0] ms_adder;
	assign ms_adder = {ms_data_a,cross_carry} + 
			{ms_data_b,cross_carry};

	assign msb = ms_adder[MS_WIDTH];

	// collect the sum back together and register, drop the two internal bits
	always @(posedge clk or posedge rst) begin
		if (rst) o <= 0;
		else o <= {ms_adder[MS_WIDTH:1],ls_adder[LS_WIDTH-1:0]};
	end

endmodule