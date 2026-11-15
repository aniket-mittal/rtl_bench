module ibex_counters (
	clk_i,
	rst_ni,
	counter_inc_i,
	counterh_we_i,
	counter_we_i,
	counter_val_i,
	counter_val_o
);
	reg _sv2v_0;
	parameter signed [31:0] MaxNumCounters = 29;
	parameter signed [31:0] NumCounters = 0;
	parameter signed [31:0] CounterWidth = 32;
	input clk_i;
	input rst_ni;
	input wire [MaxNumCounters - 1:0] counter_inc_i;
	input wire [MaxNumCounters - 1:0] counterh_we_i;
	input wire [MaxNumCounters - 1:0] counter_we_i;
	input wire [31:0] counter_val_i;
	output wire [(MaxNumCounters * 64) - 1:0] counter_val_o;
	wire [(MaxNumCounters * 64) - 1:0] counter;
	assign counter_val_o = counter;
	genvar _gv_i_2;
	generate
		for (_gv_i_2 = 0; _gv_i_2 < MaxNumCounters; _gv_i_2 = _gv_i_2 + 1) begin : g_counter
			localparam i = _gv_i_2;
			if (i < NumCounters) begin : g_counter_exists
				reg [63:0] counter_upd;
				reg [63:0] counter_load;
				reg we;
				reg [CounterWidth - 1:0] counter_d;
				always @(*) begin
					if (_sv2v_0)
						;
					we = counter_we_i[i] | counterh_we_i[i];
					counter_load[63:32] = counter[(((MaxNumCounters - 1) - i) * 64) + 63-:32];
					counter_load[31:0] = counter_val_i;
					if (counterh_we_i[i]) begin
						counter_load[63:32] = counter_val_i;
						counter_load[31:0] = counter[(((MaxNumCounters - 1) - i) * 64) + 31-:32];
					end
					counter_upd = counter[((MaxNumCounters - 1) - i) * 64+:64] + 64'h0000000000000001;
					if (we)
						counter_d = counter_load[CounterWidth - 1:0];
					else if (counter_inc_i[i])
						counter_d = counter_upd[CounterWidth - 1:0];
					else
						counter_d = counter[(((MaxNumCounters - 1) - i) * 64) + (CounterWidth - 1)-:CounterWidth];
				end
				reg [CounterWidth - 1:0] counter_q;
				always @(posedge clk_i or negedge rst_ni)
					if (!rst_ni)
						counter_q <= 1'sb0;
					else
						counter_q <= counter_d;
				if (CounterWidth < 64) begin : g_counter_narrow
					assign counter[(((MaxNumCounters - 1) - i) * 64) + (CounterWidth - 1)-:CounterWidth] = counter_q;
					assign counter[(((MaxNumCounters - 1) - i) * 64) + (63 >= CounterWidth ? 63 : (63 + (63 >= CounterWidth ? 64 - CounterWidth : CounterWidth - 62)) - 1)-:(63 >= CounterWidth ? 64 - CounterWidth : CounterWidth - 62)] = 1'sb0;
				end
				else begin : g_counter_full
					assign counter[((MaxNumCounters - 1) - i) * 64+:64] = counter_q;
				end
			end
			else begin : g_no_counter
				assign counter[((MaxNumCounters - 1) - i) * 64+:64] = 1'sb0;
			end
		end
	endgenerate
	initial _sv2v_0 = 0;
endmodule
