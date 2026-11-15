module buf_3to2 ( 
	clk,rst,

	din,
	din_valid,
	din_ack,

	dout,
	dout_valid,
	dout_ack
);

input clk,rst;

input [23:0] din;
input din_valid;
output din_ack;

output [15:0] dout;
output dout_valid;
input dout_ack;

reg [47:0] storage;
reg [2:0] held;

wire din_ack = !rst & din_valid & (held < 4);
wire dout_valid = !rst & (held > 1);
assign dout = storage[15:0];

always @(posedge clk) begin
	if (rst) begin
		storage <= 0;
		held <= 0;
	end
	else begin
		if (din_ack && dout_ack) begin
			// accepting new data and dumping old	
			// not doing the held = 4 'make space' option
			// because it extends the critical path 
			// and makes things (more) confusing
			if (held == 3'b10) begin
				storage[23:0] <= din;
				held <= 3'b011;
			end
			else begin // held == 3
				storage[31:0] <= {din,storage[23:16]};
				held <= 3'b100;
			end		 	
		end
		else if (din_ack) begin
			// accepting new data only
			if (held == 3'b0) begin
				storage[23:0] <= din;
				held <= 3'b011;
			end
			else if (held == 3'b1) begin
				storage[31:8] <= din;
				held <= 3'b100;
			end
			else if (held == 3'b10) begin
				storage[39:16] <= din;
				held <= 3'b101;
			end			
			else begin // held == 3
				storage[47:24] <= din;
				held <= 3'b110;
			end	
		end
		else if (dout_ack) begin
			// dumping old data only
			storage <= {16'b0,storage[47:16]};
			held <= held - 2'b10;
		end
	end		
end
endmodule