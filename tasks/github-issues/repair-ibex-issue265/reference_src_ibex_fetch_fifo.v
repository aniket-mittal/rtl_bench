module ibex_fetch_fifo (
	clk_i,
	rst_ni,
	clear_i,
	in_valid_i,
	in_ready_o,
	in_addr_i,
	in_rdata_i,
	in_err_i,
	out_valid_o,
	out_ready_i,
	out_addr_o,
	out_rdata_o,
	out_err_o
);
	reg _sv2v_0;
	input wire clk_i;
	input wire rst_ni;
	input wire clear_i;
	input wire in_valid_i;
	output wire in_ready_o;
	input wire [31:0] in_addr_i;
	input wire [31:0] in_rdata_i;
	input wire in_err_i;
	output reg out_valid_o;
	input wire out_ready_i;
	output wire [31:0] out_addr_o;
	output reg [31:0] out_rdata_o;
	output reg out_err_o;
	localparam [31:0] DEPTH = 3;
	wire [91:2] addr_d;
	reg [91:2] addr_q;
	wire [95:0] rdata_d;
	reg [95:0] rdata_q;
	wire [2:0] err_d;
	reg [2:0] err_q;
	wire [2:0] valid_d;
	reg [2:0] valid_q;
	wire [2:0] lowest_free_entry;
	wire [2:0] valid_pushed;
	wire [2:0] valid_popped;
	wire [2:0] entry_en;
	wire pop_fifo;
	wire [31:0] rdata;
	wire [31:0] rdata_unaligned;
	wire err;
	wire err_unaligned;
	wire valid;
	wire valid_unaligned;
	wire entry0_unaligned_d;
	reg entry0_unaligned_q;
	wire aligned_is_compressed;
	wire unaligned_is_compressed;
	wire unused_addr_in;
	assign rdata = (valid_q[0] ? rdata_q[0+:32] : in_rdata_i);
	assign err = (valid_q[0] ? err_q[0] : in_err_i);
	assign valid = valid_q[0] | in_valid_i;
	assign entry0_unaligned_d = ((((in_valid_i & in_addr_i[1]) | entry0_unaligned_q) & ~(out_ready_i & unaligned_is_compressed)) | (((valid & out_ready_i) & ~out_addr_o[1]) & aligned_is_compressed)) & ~clear_i;
	assign rdata_unaligned = (valid_q[1] ? {rdata_q[47-:16], rdata[31:16]} : {in_rdata_i[15:0], rdata[31:16]});
	assign err_unaligned = (valid_q[1] ? (err_q[1] & ~unaligned_is_compressed) | err_q[0] : (valid_q[0] & err_q[0]) | (in_err_i & (~valid_q[0] | ~unaligned_is_compressed)));
	assign valid_unaligned = (valid_q[1] ? 1'b1 : valid_q[0] & in_valid_i);
	assign unaligned_is_compressed = rdata[17:16] != 2'b11;
	assign aligned_is_compressed = rdata[1:0] != 2'b11;
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
	assign out_addr_o[31:2] = (valid_q[0] ? addr_q[2+:30] : in_addr_i[31:2]);
	assign out_addr_o[1] = (valid_q[0] ? entry0_unaligned_q : in_addr_i[1]);
	assign out_addr_o[0] = 1'b0;
	assign unused_addr_in = in_addr_i[0];
	assign in_ready_o = ~valid_q[1];
	assign pop_fifo = (out_ready_i & out_valid_o) & (~aligned_is_compressed | out_addr_o[1]);
	genvar _gv_i_1;
	generate
		for (_gv_i_1 = 0; _gv_i_1 < 2; _gv_i_1 = _gv_i_1 + 1) begin : g_fifo_next
			localparam i = _gv_i_1;
			if (i == 0) begin : g_ent0
				assign lowest_free_entry[i] = ~valid_q[i];
			end
			else begin : g_ent_others
				assign lowest_free_entry[i] = ~valid_q[i] & (&valid_q[i - 1:0]);
			end
			assign valid_pushed[i] = (in_valid_i & lowest_free_entry[i]) | valid_q[i];
			assign valid_popped[i] = (pop_fifo ? valid_pushed[i + 1] : valid_pushed[i]);
			assign valid_d[i] = valid_popped[i] & ~clear_i;
			assign entry_en[i] = (valid_pushed[i + 1] & pop_fifo) | ((in_valid_i & lowest_free_entry[i]) & ~pop_fifo);
			assign addr_d[2 + (i * 30)+:30] = (valid_q[i + 1] ? addr_q[2 + ((i + 1) * 30)+:30] : in_addr_i[31:2]);
			assign rdata_d[i * 32+:32] = (valid_q[i + 1] ? rdata_q[(i + 1) * 32+:32] : in_rdata_i);
			assign err_d[i] = (valid_q[i + 1] ? err_q[i + 1] : in_err_i);
		end
	endgenerate
	assign lowest_free_entry[2] = ~valid_q[2] & (&valid_q[1:0]);
	assign valid_pushed[2] = valid_q[2] | (in_valid_i & lowest_free_entry[2]);
	assign valid_popped[2] = (pop_fifo ? 1'b0 : valid_pushed[2]);
	assign valid_d[2] = valid_popped[2] & ~clear_i;
	assign entry_en[2] = in_valid_i & lowest_free_entry[2];
	assign addr_d[62+:30] = in_addr_i[31:2];
	assign rdata_d[64+:32] = in_rdata_i;
	assign err_d[2] = in_err_i;
	always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni) begin
			valid_q <= 1'sb0;
			entry0_unaligned_q <= 1'sb0;
		end
		else begin
			valid_q <= valid_d;
			entry0_unaligned_q <= entry0_unaligned_d;
		end
	genvar _gv_i_2;
	generate
		for (_gv_i_2 = 0; _gv_i_2 < DEPTH; _gv_i_2 = _gv_i_2 + 1) begin : g_fifo_regs
			localparam i = _gv_i_2;
			always @(posedge clk_i)
				if (entry_en[i]) begin
					addr_q[2 + (i * 30)+:30] <= addr_d[2 + (i * 30)+:30];
					rdata_q[i * 32+:32] <= rdata_d[i * 32+:32];
					err_q[i] <= err_d[i];
				end
		end
	endgenerate
	initial _sv2v_0 = 0;
endmodule
