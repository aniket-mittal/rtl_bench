module spid_readbuffer (
	clk_i,
	rst_ni,
	sys_rst_ni,
	current_address_i,
	threshold_i,
	sfdp_hit_i,
	mailbox_hit_i,
	mailbox_en_i,
	start_i,
	event_watermark_o,
	event_flip_o
);
	reg _sv2v_0;
	localparam [31:0] spi_device_pkg_SramMsgDepth = 512;
	parameter [31:0] ReadBufferDepth = spi_device_pkg_SramMsgDepth;
	localparam [31:0] BufferAw = $clog2(ReadBufferDepth);
	input clk_i;
	input rst_ni;
	input sys_rst_ni;
	input [31:0] current_address_i;
	input [BufferAw:0] threshold_i;
	input sfdp_hit_i;
	input mailbox_hit_i;
	input mailbox_en_i;
	input start_i;
	output wire event_watermark_o;
	output wire event_flip_o;
	localparam [31:0] spi_device_pkg_SramDw = 32;
	localparam [31:0] BufferSize = (ReadBufferDepth * spi_device_pkg_SramDw) / 8;
	localparam [31:0] OneBufferSize = BufferSize / 2;
	localparam [31:0] OneBufferAw = $clog2(OneBufferSize);
	reg st_q;
	reg st_d;
	wire watermark_cross;
	reg watermark_crossed;
	wire flip;
	reg [31 - OneBufferAw:0] next_buffer_addr;
	wire active;
	assign active = st_q == 1'd1;
	function automatic signed [(32 - OneBufferAw) - 1:0] sv2v_cast_7DC5A_signed;
		input reg signed [(32 - OneBufferAw) - 1:0] inp;
		sv2v_cast_7DC5A_signed = inp;
	endfunction
	always @(posedge clk_i or negedge sys_rst_ni)
		if (!sys_rst_ni)
			next_buffer_addr <= sv2v_cast_7DC5A_signed(1);
		else if (active && flip)
			next_buffer_addr <= next_buffer_addr + 1'b1;
	wire [31 - OneBufferAw:0] current_buffer_idx;
	assign current_buffer_idx = current_address_i[31:OneBufferAw];
	assign flip = current_buffer_idx == next_buffer_addr;
	reg flip_q;
	always @(posedge clk_i or negedge sys_rst_ni)
		if (!sys_rst_ni)
			flip_q <= 1'b0;
		else
			flip_q <= flip;
	assign event_flip_o = (active && flip) && !flip_q;
	assign watermark_cross = (current_address_i[BufferAw:0] >= threshold_i) && |threshold_i;
	always @(posedge clk_i or negedge sys_rst_ni)
		if (!sys_rst_ni)
			watermark_crossed <= 1'b0;
		else if (active && watermark_cross)
			watermark_crossed <= 1'b1;
		else if (active && flip)
			watermark_crossed <= 1'b0;
	assign event_watermark_o = (active && !watermark_crossed) && watermark_cross;
	always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni)
			st_q <= 1'd0;
		else
			st_q <= st_d;
	always @(*) begin
		if (_sv2v_0)
			;
		st_d = st_q;
		(* full_case, parallel_case *)
		case (st_q)
			1'd0:
				if ((start_i && !sfdp_hit_i) && !(mailbox_en_i && mailbox_hit_i))
					st_d = 1'd1;
			1'd1: st_d = 1'd1;
			default: st_d = 1'd0;
		endcase
	end
	initial _sv2v_0 = 0;
endmodule
