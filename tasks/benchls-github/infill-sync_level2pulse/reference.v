module sync_level2level(
  clk,
  rst_b,
  sync_in,
  sync_out
);

parameter SIGNAL_WIDTH = 1;
parameter FLOP_NUM     = 3;

input          clk;
input          rst_b;
input   [SIGNAL_WIDTH-1:0]   sync_in;
output  [SIGNAL_WIDTH-1:0]   sync_out;

reg     [SIGNAL_WIDTH-1:0]  sync_ff[FLOP_NUM-1:0];

wire           clk;
wire           rst_b;
wire    [SIGNAL_WIDTH-1:0]   sync_in;
wire    [SIGNAL_WIDTH-1:0]   sync_out;


genvar i;

always @ (posedge clk or negedge rst_b)
begin
  if (!rst_b)
    sync_ff[0][SIGNAL_WIDTH-1:0] <= {SIGNAL_WIDTH{1'b0}};
  else
    sync_ff[0][SIGNAL_WIDTH-1:0] <= sync_in[SIGNAL_WIDTH-1:0];
end


generate
for (i = 1; i < FLOP_NUM; i = i+1)
begin: FLOP_GEN
  always @ (posedge clk or negedge rst_b)
  begin
    if (!rst_b)
      sync_ff[i][SIGNAL_WIDTH-1:0] <= {SIGNAL_WIDTH{1'b0}};
    else
      sync_ff[i][SIGNAL_WIDTH-1:0] <= sync_ff[i-1][SIGNAL_WIDTH-1:0];
  end
end
endgenerate

assign sync_out[SIGNAL_WIDTH-1:0] = sync_ff[FLOP_NUM-1][SIGNAL_WIDTH-1:0];


endmodule

module sync_level2pulse(
  clk,
  rst_b,
  sync_in,
  sync_out,
  sync_ack
);


input          clk;
input          rst_b;
input          sync_in;
output         sync_out;
output         sync_ack;

reg            sync_ff;

wire           clk;
wire           rst_b;
wire           sync_in;
wire           sync_out;
wire           sync_ack;

wire           sync_out_level;

sync_level2level x_sync_level2level (
  .clk      (clk),
  .rst_b    (rst_b),
  .sync_in  (sync_in),
  .sync_out (sync_out_level)
);

always @ (posedge clk or negedge rst_b)
begin
  if (!rst_b)
    sync_ff <= 1'b0;
  else
    sync_ff <= sync_out_level;
end

assign sync_out = sync_out_level & ~sync_ff;
assign sync_ack = sync_out_level;

endmodule