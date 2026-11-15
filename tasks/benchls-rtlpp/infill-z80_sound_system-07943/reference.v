module rtlpp_07943
(
	input         RESET,
	input         CLK,
	input         CE_N,
	input         CE_P,

	input         A,
	input   [7:0] DI,
	output  [7:0] DO,
	input         CS_n, 
	input         WR_n,
	input         RD_n,

	output [20:0] MEM_ADDR,
	output  [7:0] MEM_DI,
	input   [7:0] MEM_DO,
	output        MEM_RD,
	output        MEM_WR,
	input         MEM_WAIT,

	output [14:0] OUTL,
	output [14:0] OUTR
);

parameter INT_DIV = 291;

assign DO = A ? {bit7, 6'b111111, bit0} : port_03;

reg         int_n;
wire        cpu_m1_n;
wire        cpu_mreq_n;
wire        cpu_iorq_n;
wire        cpu_rfsh_n;
wire        cpu_rd_n;
wire        cpu_wr_n;
wire [15:0] cpu_a_bus;
wire  [7:0] cpu_do_bus;
reg  [7:0] cpu_di_bus;

reg bit7;
reg bit0;
reg [7:0] port_BB;
reg [7:0] port_B3;
reg [5:0] port_00;
reg [7:0] port_03;
reg signed [6:0] port_06, port_07, port_08, port_09;
reg signed [7:0] ch_a, ch_b, ch_c, ch_d;
reg signed [14:0] out_a, out_b, out_c, out_d;
reg signed [14:0] outl, outr;

wire CE = CE_P;

always @(posedge CLK) begin
	reg [9:0] cnt;
	if (RESET) begin
		cnt <= 0;
		int_n <= 1;
	end else if(CE) begin
		cnt <= cnt + 1'b1;
		if (cnt == INT_DIV) begin 
			cnt <= 0;
			int_n <= 0;
		end
	end
	if (~cpu_iorq_n & ~cpu_m1_n) int_n <= 1;
end

always @(posedge CLK) begin
	if (~cpu_iorq_n & cpu_m1_n) begin
		case(cpu_a_bus[3:0])
			'h2: bit7 <= 0;
			'h3: bit7 <= 1;
			'h5: bit0 <= 0;
			'hA: bit7 <= ~port_00[0];
			'hB: bit0 <=  port_09[5];
		endcase
	end
	else if (~CS_n) begin
		if (~A & ~RD_n) bit7 <= 0;
		if (~A & ~WR_n) bit7 <= 1;
		if ( A & ~WR_n) bit0 <= 1;
	end
end

always @(posedge CLK) begin
	if (RESET) begin
		port_BB <= 0;
		port_B3 <= 0;
	end
	else if (~CS_n && ~WR_n) begin
		if(A) port_BB <= DI;
		else  port_B3 <= DI;
	end
end

always @(posedge CLK) begin
	if (RESET) begin
		port_00 <= 0;
		port_03 <= 0;
	end
	else begin
		if (~cpu_iorq_n & ~cpu_wr_n) begin
			case(cpu_a_bus[3:0])
				0: port_00 <= cpu_do_bus[5:0];
				3: port_03 <= cpu_do_bus;
				6: port_06 <= cpu_do_bus[5:0];
				7: port_07 <= cpu_do_bus[5:0];
				8: port_08 <= cpu_do_bus[5:0];
				9: port_09 <= cpu_do_bus[5:0];
			endcase
		end

		if (mem_rd && cpu_a_bus[15:13] == 3 && ~MEM_WAIT) begin
			case(cpu_a_bus[9:8])
				0: ch_a <= {~MEM_DO[7],MEM_DO[6:0]};
				1: ch_b <= {~MEM_DO[7],MEM_DO[6:0]};
				2: ch_c <= {~MEM_DO[7],MEM_DO[6:0]};
				3: ch_d <= {~MEM_DO[7],MEM_DO[6:0]};
			endcase
		end
	end
end

assign cpu_di_bus =
	mem_rd                                            ? MEM_DO  :
	(~cpu_iorq_n && ~cpu_rd_n && cpu_a_bus[3:0] == 1) ? port_BB :
	(~cpu_iorq_n && ~cpu_rd_n && cpu_a_bus[3:0] == 2) ? port_B3 :
	(~cpu_iorq_n && ~cpu_rd_n && cpu_a_bus[3:0] == 4) ? {bit7, 6'b111111, bit0} :
	8'hFF;

wire mem_wr = ~cpu_wr_n & ~cpu_mreq_n & |page_addr;
wire mem_rd = ~cpu_rd_n & ~cpu_mreq_n;

wire [5:0] page_addr = cpu_a_bus[15] ? port_00 : cpu_a_bus[14];

assign MEM_ADDR = {page_addr, &cpu_a_bus[15:14], cpu_a_bus[13:0]};
assign MEM_RD   = mem_rd;
assign MEM_WR   = mem_wr;
assign MEM_DI   = cpu_do_bus;

always @(posedge CLK) begin
	if(CE) begin
		out_a <= ch_a * port_06;
		out_b <= ch_b * port_07;
		out_c <= ch_c * port_08;
		out_d <= ch_d * port_09;
	end
end

always @(posedge CLK) begin
	if(CE) begin
		outl <= out_a + out_b;
		outr <= out_c + out_d;
	end
end

assign OUTL = outl;
assign OUTR = outr;

endmodule