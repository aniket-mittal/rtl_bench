module ltd8251 (
	input wire 			clk,
	input wire 			reset,
	input wire 			adr,
	input wire			cs,
	input wire			we,
	input wire [7:0]	din,
	output wire [7:0]	dout,

	input wire 			txc,
	output reg 			txd,

	input wire 			rxc,
	input wire 			rxd,

	output reg [7:0]	status
);

	reg [7:0]	cmd;
	reg [7:0]	txdata;
	reg			txbusy, _txbusy;
 	reg [7:0]	rxdata;
	reg			rxdone, _rxdone;
	reg [1:0]	rxerr, _rxerr;

	reg			_we;

	assign		dout = adr ? status : rxdata;

	always @(posedge clk) begin
		if (reset) begin
			status <= 8'h01;
			cmd <= 8'h00;
		end
		else if (cmd[4]) begin
			status[5:4] <= 2'b00;
			cmd[4] <= 1'b0;
		end
		else if (cs) begin
			if (we & ~_we)	begin
				if (adr) cmd <= din;
				else begin
					txdata <= din;
					status[0] <= 1'b0;
				end
			end
			else begin
				if (~adr) status[1] <= 1'b0;
			end
		end
		else begin
			if (txbusy & ~_txbusy) status[0] <= 1'b1;
 			if (rxdone & ~_rxdone) status[1] <= 1'b1;
			if (rxerr[0] & ~_rxerr[0]) status[4] <= 1'b1;
			if (rxerr[1] & ~_rxerr[1]) status[5] <= 1'b1;
		end
		_we <= we;
		_txbusy <= txbusy;
		_rxdone <= rxdone;
		_rxerr <= rxerr;
	end

	reg			_txc;
	reg [1:0]	txsts;
	reg [7:0]	txcnt;
	reg [10:0]	txbuf;

	always @(posedge clk) begin
		if (reset) begin
			txd <= 1'b1;
			txbusy <= 1'b0;
			txsts <= 2'b00;
		end
		else if ((txsts == 2'b00) & ~status[0]) begin
			txbuf <= {2'b11, txdata, 1'b0};
			txcnt <= 8'h00;
			txbusy <= 1'b1;
			txsts <= 2'b01;
		end
		else if (txsts == 2'b01) begin
			txsts <= 2'b10;
		end
		else if ((txsts == 2'b10) & txc & ~_txc) begin
			if (txcnt[3:0] == 4'h0) begin
				txd <= txbuf[0];
				txbuf <= {1'b1, txbuf[10:1]};
			end
			else if (txcnt == 8'hAF) begin
				txbusy <= 1'b0;
				txsts <= 2'b11;
			end
			txcnt <= txcnt + 8'h01;
		end
		else if (txsts == 2'b11) begin
			txsts <= 2'b00; 
		end
		_txc <= txc;
	end

	reg			_rxc;
	reg [1:0]	rxsts;
	reg [3:0]	s;
	reg [7:0]	rxcnt;
	reg [9:0]	rxbuf;
	wire		detfd = s == 4'b1100;

	always @(posedge clk) begin
		if (reset) begin
			rxdata <= 8'h00;
			rxdone <= 1'b0;
			rxerr <= 2'b00;
			rxsts <= 2'b00;
		end
		else if (rxc & ~_rxc) begin
			if (rxsts == 2'b00) begin
				if (detfd) begin
					rxcnt <= 8'h02;
					rxerr <= 2'b00;
					rxsts <= 2'b01;
				end
			end
			else if (rxsts == 2'b01) begin
				if (rxcnt[3:0] == 4'h8) begin
					rxbuf <= {rxd, rxbuf[9:1]};
					if (rxcnt[7:4] == 4'h9) rxsts <= 2'b10;
				end
				rxcnt <= rxcnt + 8'h01;
			end
			else if (rxsts == 2'b10) begin
				if (rxbuf[9] == 1'b0)	rxerr[1] <= 1'b1;
				else begin
					if (status[1]) rxerr[0] <= 1'b1;
					rxdone <= 1'b1;
				end
				rxdata <= rxbuf[8:1];
				rxsts <= 2'b11;
			end
			else if (rxsts == 2'b11) begin
				rxdone <= 1'b0;
				rxsts <= 2'b00;
			end
			else rxcnt <= rxcnt + 8'h01;
			s <= {s[2:0], rxd};
		end
		_rxc <= rxc;
	end

endmodule