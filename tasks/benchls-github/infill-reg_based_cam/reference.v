module reg_cam_cell (
	clk,rst,
	wdata,wcare,wused,wena,
	lookup_data,match
);

parameter DATA_WIDTH = 32;

input clk,rst;
input [DATA_WIDTH-1:0] wdata, wcare;
input wused,wena;

input [DATA_WIDTH-1:0] lookup_data;
output match;
reg match;

reg cell_used;

// Storage cells
reg [DATA_WIDTH - 1 : 0] data;
reg [DATA_WIDTH - 1 : 0] care;
always @(posedge clk) begin
  if (rst) begin
	cell_used <= 1'b0;
	data <= {DATA_WIDTH{1'b0}};
	care <= {DATA_WIDTH{1'b0}};
  end else begin
	if (wena) begin
	   cell_used <= wused;
	   data <= wdata;
       care <= wcare;
	end
  end
end

// Ternary match
wire [DATA_WIDTH-1:0] bit_match;
genvar i;
generate 
  for (i=0; i<DATA_WIDTH; i=i+1)
  begin : bmt
    assign bit_match[i] = !care[i] | !(data[i] ^ lookup_data[i]);
  end
endgenerate

always @(posedge clk) begin
  if (rst) match <= 1'b0;
  else match <= (& bit_match) & cell_used;
end

endmodule

module reg_based_cam (
	clk,rst,
	waddr,wdata,wcare,wena,
	lookup_data,match_lines
);

parameter DATA_WIDTH = 32;
parameter ADDR_WIDTH = 4;
parameter WORDS = (1<<ADDR_WIDTH);

input clk,rst;
input [ADDR_WIDTH-1:0] waddr;
input [DATA_WIDTH-1:0] wdata,wcare;
input wena;

input [DATA_WIDTH-1:0] lookup_data;
output [WORDS-1:0] match_lines;
wire [WORDS-1:0] match_lines;

// write decoder
wire [WORDS-1:0] word_wena;
reg [WORDS-1:0] waddr_dec;
always @(*) begin
    waddr_dec = 0;
    waddr_dec[waddr] = 1'b1;
end
assign word_wena = waddr_dec & {WORDS{wena}};

// writing "all don't care" disables the word.
wire wused = |wcare /*synthesis keep*/;

// storage and match cells
genvar i;
generate 
  for (i=0; i<WORDS; i=i+1)
  begin : cw
    reg_cam_cell c (
		.clk(clk),
		.rst(rst),
		.wdata(wdata),
		.wcare(wcare),
		.wused(wused),
		.wena(word_wena[i]),
		.lookup_data(lookup_data),
		.match(match_lines[i])
    );
    defparam c .DATA_WIDTH = DATA_WIDTH; 
  end
endgenerate

// match encoder

endmodule