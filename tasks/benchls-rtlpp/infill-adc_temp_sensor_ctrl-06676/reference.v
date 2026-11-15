module rtlpp_06676(rst_i, clk_i, bufin, bufout, trigger, done, rst1626, clk1626, d1626, q1626, en1626);

parameter pClkFreq = 50000000;
parameter tRC = pClkFreq / 10000000 + 1;	
parameter tCL = pClkFreq /  3508772 + 1;	
parameter tCH = pClkFreq /  3508772 + 1;	
parameter tCRH = pClkFreq /  25000000 + 1;	

parameter CLK1 = 4'd1;
parameter CLK2 = 4'd2;
parameter CLK3 = 4'd3;
parameter CLK4 = 4'd4;
parameter CLK5 = 4'd5;
parameter CLK6 = 4'd6;
parameter CRH1 = 4'd7;
parameter CRH2 = 4'd8;

parameter START_CNV = 8'h51;
parameter STOP_CNV = 8'h22;
parameter READ_TEMP = 8'hAA;
parameter READ_CONFIG = 8'hAC;
parameter READ_TH = 8'hA1;
parameter READ_TL = 8'hA2;
parameter WRITE_TH = 8'h01;
parameter WRITE_TL = 8'h02;
parameter WRITE_CONFIG = 8'h0C;
parameter POR = 8'h54;

input  rst_i;			
input  clk_i;			
input  trigger;
output done;
reg done;
output [20:0] bufin;	
reg    [20:0] bufin;
input  [20:0] bufout;	
output rst1626;		
reg    rst1626;
output clk1626;			
reg clk1626;			
output q1626;
output en1626;
input d1626;

wire [7:0] cmd = bufout[8:1];
wire isRead =
	cmd==READ_CONFIG ||
	cmd==READ_TEMP ||
	cmd==READ_TH ||
	cmd==READ_TL;
reg out_t;				
reg [3:0] state;		
reg [12:0] pscnt;		
reg [4:0] cnt;

assign en1626 = out_t;
assign q1626 = bufout[cnt];

always @(posedge clk_i or posedge rst_i)
if (rst_i) begin
	rst1626 <= 1'b0;
	clk1626 <= 1'b1;
	pscnt <= 13'h0000;
	state <= CLK1;
	done <= 1'b0;
	cnt <= 5'd1;
	out_t <= 1'b0;
end else begin

	done <= 1'b0;

	if (!pscnt[12])
		pscnt <= pscnt - 13'd1;

	case(state)

		CLK1:
			if (trigger) begin
				rst1626 <= 1'b1;
				cnt   <= 5'd1;
				pscnt <= tRC;
				out_t <= 1'b1;
				state <= CLK2;
			end

		CLK2:
			if (pscnt[12])
				state <= CLK3;

		CLK3: begin
			pscnt   <= tCL;
			clk1626 <= 1'b0;
			state   <= CLK4;
		end

		CLK4:
			if (pscnt[12]) begin
				pscnt <= tCH;
				clk1626 <= 1'b1;
				bufin[cnt] <= d1626;
				state <= CLK5;
			end

		CLK5:
			if (pscnt[12]) begin
				if (cnt==5'd20)			
					state <= CRH1;			
				else begin
					if (cnt==5'd8 && isRead)
						out_t <= 1'b0;
					pscnt <= tCL;
					clk1626 <= 1'b0;
					state <= CLK4;
					cnt <= cnt + 5'd1;
				end
			end

		CRH1: begin
			out_t <= 1'b1;
			pscnt <= tCRH;
			state <= CRH2;
		end

		CRH2:
			if (pscnt[12]) begin
				rst1626 <= 1'b0;
				done    <= 1'b1;
				state   <= CLK1;
			end

		default: begin
			out_t   <= 1'b1;
			rst1626 <= 1'b0;
			clk1626 <= 1'b1;
			state   <= CLK1;
		end
	endcase

end

endmodule