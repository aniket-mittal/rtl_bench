module ibex_fetch_fifo (
	clk_i,
	rst_ni,
	clear_i,
	in_addr_i,
	in_rdata_i,
	in_err_i,
	in_valid_i,
	in_ready_o,
	out_valid_o,
	out_ready_i,
	out_rdata_o,
	out_addr_o,
	out_err_o,
	out_valid_stored_o
);
	reg _sv2v_0;
	input wire clk_i;
	input wire rst_ni;
	input wire clear_i;
	input wire [31:0] in_addr_i;
	input wire [31:0] in_rdata_i;
	input wire in_err_i;
	input wire in_valid_i;
	output wire in_ready_o;
	output reg out_valid_o;
	input wire out_ready_i;
	output reg [31:0] out_rdata_o;
	output wire [31:0] out_addr_o;
	output reg out_err_o;
	output reg out_valid_stored_o;
	localparam [31:0] DEPTH = 3;
	reg [95:0] addr_n;
	reg [95:0] addr_int;
	reg [95:0] addr_q;
	reg [95:0] rdata_n;
	reg [95:0] rdata_int;
	reg [95:0] rdata_q;
	reg [2:0] err_n;
	reg [2:0] err_int;
	reg [2:0] err_q;
	reg [2:0] valid_n;
	reg [2:0] valid_int;
	reg [2:0] valid_q;
	wire [31:2] addr_next;
	wire [31:0] rdata;
	wire [31:0] rdata_unaligned;
	wire err;
	wire err_unaligned;
	wire valid;
	wire valid_unaligned;
	wire aligned_is_compressed;
	wire unaligned_is_compressed;
	wire unaligned_is_compressed_st;
	assign rdata = (valid_q[0] ? rdata_q[0+:32] : in_rdata_i);
	assign err = (valid_q[0] ? err_q[0] : in_err_i);
	assign valid = valid_q[0] | in_valid_i;
	assign rdata_unaligned = (valid_q[1] ? {rdata_q[47-:16], rdata[31:16]} : {in_rdata_i[15:0], rdata[31:16]});
	assign err_unaligned = (valid_q[1] ? (err_q[1] & ~unaligned_is_compressed) | err_q[0] : (valid_q[0] & err_q[0]) | (in_err_i & (~valid_q[0] | ~unaligned_is_compressed)));
	assign valid_unaligned = (valid_q[1] ? 1'b1 : valid_q[0] & in_valid_i);
	assign unaligned_is_compressed = rdata[17:16] != 2'b11;
	assign aligned_is_compressed = rdata[1:0] != 2'b11;
	assign unaligned_is_compressed_st = rdata_q[17-:2] != 2'b11;
	always @(*) begin
		if (_sv2v_0)
			;
		if (out_addr_o[1]) begin
			out_rdata_o = rdata_unaligned;
			out_err_o = err_unaligned;
			if (unaligned_is_compressed)
				out_valid_o = valid;
			else
				out_valid_o = valid_unaligned;
		end
		else begin
			out_rdata_o = rdata;
			out_err_o = err;
			out_valid_o = valid;
		end
	end
	assign out_addr_o = (valid_q[0] ? addr_q[0+:32] : in_addr_i);
	always @(*) begin
		if (_sv2v_0)
			;
		out_valid_stored_o = 1'b1;
		if (out_addr_o[1]) begin
			if (unaligned_is_compressed_st)
				out_valid_stored_o = 1'b1;
			else
				out_valid_stored_o = valid_q[1];
		end
		else
			out_valid_stored_o = valid_q[0];
	end
	assign in_ready_o = ~valid_q[1];
	always @(*) begin : sv2v_autoblock_1
		reg [0:1] _sv2v_jump;
		_sv2v_jump = 2'b00;
		if (_sv2v_0)
			;
		addr_int = addr_q;
		rdata_int = rdata_q;
		err_int = err_q;
		valid_int = valid_q;
		if (in_valid_i) begin : sv2v_autoblock_2
			reg signed [31:0] j;
			begin : sv2v_autoblock_3
				reg signed [31:0] _sv2v_value_on_break;
				for (j = 0; j < DEPTH; j = j + 1)
					if (_sv2v_jump < 2'b10) begin
						_sv2v_jump = 2'b00;
						if (!valid_q[j]) begin
							addr_int[j * 32+:32] = in_addr_i;
							rdata_int[j * 32+:32] = in_rdata_i;
							err_int[j] = in_err_i;
							valid_int[j] = 1'b1;
							_sv2v_jump = 2'b10;
						end
						_sv2v_value_on_break = j;
					end
				if (!(_sv2v_jump < 2'b10))
					j = _sv2v_value_on_break;
				if (_sv2v_jump != 2'b11)
					_sv2v_jump = 2'b00;
			end
		end
	end
	assign addr_next[31:2] = addr_int[31-:30] + 30'h00000001;
	always @(*) begin
		if (_sv2v_0)
			;
		addr_n = addr_int;
		rdata_n = rdata_int;
		err_n = err_int;
		valid_n = valid_int;
		if (out_ready_i && out_valid_o) begin
			if (addr_int[1]) begin
				if (unaligned_is_compressed)
					addr_n[0+:32] = {addr_next[31:2], 2'b00};
				else
					addr_n[0+:32] = {addr_next[31:2], 2'b10};
				rdata_n = {32'b00000000000000000000000000000000, rdata_int[32+:64]};
				err_n = {1'b0, err_int[2:1]};
				valid_n = {1'b0, valid_int[2:1]};
			end
			else if (aligned_is_compressed)
				addr_n[0+:32] = {addr_int[31-:30], 2'b10};
			else begin
				addr_n[0+:32] = {addr_next[31:2], 2'b00};
				rdata_n = {32'b00000000000000000000000000000000, rdata_int[32+:64]};
				err_n = {1'b0, err_int[2:1]};
				valid_n = {1'b0, valid_int[2:1]};
			end
		end
	end
	always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni) begin
			addr_q <= {DEPTH {32'b00000000000000000000000000000000}};
			rdata_q <= {DEPTH {32'b00000000000000000000000000000000}};
			err_q <= 1'sb0;
			valid_q <= 1'sb0;
		end
		else if (clear_i)
			valid_q <= 1'sb0;
		else begin
			addr_q <= addr_n;
			rdata_q <= rdata_n;
			err_q <= err_n;
			valid_q <= valid_n;
		end
	initial _sv2v_0 = 0;
endmodule
