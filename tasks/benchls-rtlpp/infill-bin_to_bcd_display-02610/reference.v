module rtlpp_02610(
		input            clk,
		input            dclk,
		input            rst,
		input            display_sel,
		input [1:0]      sel,
		input [15:0]     data,
		output [3:0]     D1,
		output [3:0]     D2,
		output [3:0]     D3,
		output [3:0]     D4
);

	wire [15:0]  bcd_buf;
	wire [19:0]  temp;
	wire [15:0]  unsigned_data;
	wire [19:0]  unsigned_scaled_data;
	wire [15:0]  bcd;

	assign D1 = (display_sel == 1'b1) ? bcd[15:12] : 4'b0000;
	assign D2 = (display_sel == 1'b1) ? bcd[11:8] : data[15:12];
	assign D3 = (display_sel == 1'b1) ? bcd[7:4] : data[11:8];
	assign D4 = (display_sel == 1'b1) ? bcd[3:0] : data[7:4];
			
	assign bcd[15:12] = ((data[15] == 1'b1 & (bcd[11:0] != 0))) ? 4'b1111 : 4'b1010;
			
	assign unsigned_data = (data[15] == 1'b1) ? ((~(data)) + 1'b1) : data;
			
	assign temp = (sel != 2'b11) ? (unsigned_data * 4'b1001) : {4'b0000, (5'd25 - (data - 5'd25))};
	assign unsigned_scaled_data = (sel != 2'b11) ? {10'b0000000000, temp[19:10]} : temp;
			
	// Binary_To_BCD Module Logic
	reg [19:0] bcd_out;
	reg [15:0] bin;
	reg start;
	reg [3:0] shift_cnt;
	reg busy;
	reg [3:0] state;
	parameter IDLE = 4'd0, START = 4'd1, SHIFT = 4'd2, DONE = 4'd3;

	always @(posedge clk or posedge rst) begin
		if (rst) begin
			bcd_out <= 20'b0;
			bin <= 16'b0;
			start <= 1'b0;
			busy <= 1'b0;
			shift_cnt <= 4'd0;
			state <= IDLE;
		end else begin
			case (state)
				IDLE: begin
					if (dclk) begin
						start <= 1'b1;
						bin <= unsigned_scaled_data[15:0];
						busy <= 1'b1;
						shift_cnt <= 4'd0;
						bcd_out <= 20'b0;
						state <= START;
					end
				end
				START: begin
					if (start) begin
						state <= SHIFT;
					end
				end
				SHIFT: begin
					if (shift_cnt < 16) begin
						bcd_out <= {bcd_out[18:0], bin[15]};
						bin <= {bin[14:0], 1'b0};
						if (bcd_out[3:0] > 4) bcd_out[3:0] <= bcd_out[3:0] + 4'd3;
						if (bcd_out[7:4] > 4) bcd_out[7:4] <= bcd_out[7:4] + 4'd3;
						if (bcd_out[11:8] > 4) bcd_out[11:8] <= bcd_out[11:8] + 4'd3;
						if (bcd_out[15:12] > 4) bcd_out[15:12] <= bcd_out[15:12] + 4'd3;
						shift_cnt <= shift_cnt + 4'd1;
					end else begin
						state <= DONE;
					end
				end
				DONE: begin
					busy <= 1'b0;
					start <= 1'b0;
					state <= IDLE;
				end
			endcase
		end
	end

	assign bcd_buf = bcd_out[15:0];
	assign bcd[11:0] = (sel == 2'b11) ? {bcd_buf[7:0], 4'b1011} : bcd_buf[11:0];

endmodule