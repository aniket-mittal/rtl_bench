module rtlpp_02104 (
    clk,
    downstream_readdata,
    downstream_readdatavalid,
    downstream_waitrequest,
    reset_n,
    upstream_address,
    upstream_burstcount,
    upstream_byteenable,
    upstream_debugaccess,
    upstream_nativeaddress,
    upstream_read,
    upstream_write,
    upstream_writedata,
    
    downstream_address,
    downstream_arbitrationshare,
    downstream_burstcount,
    downstream_byteenable,
    downstream_debugaccess,
    downstream_nativeaddress,
    downstream_read,
    downstream_write,
    downstream_writedata,
    upstream_readdata,
    upstream_readdatavalid,
    upstream_waitrequest
);

  output  [3:0] downstream_address;
  output  [3:0] downstream_arbitrationshare;
  output        downstream_burstcount;
  output  [1:0] downstream_byteenable;
  output        downstream_debugaccess;
  output  [3:0] downstream_nativeaddress;
  output        downstream_read;
  output        downstream_write;
  output [15:0] downstream_writedata;
  output [15:0] upstream_readdata;
  output        upstream_readdatavalid;
  output        upstream_waitrequest;
  input         clk;
  input  [15:0] downstream_readdata;
  input         downstream_readdatavalid;
  input         downstream_waitrequest;
  input         reset_n;
  input  [4:0]  upstream_address;
  input  [2:0]  upstream_burstcount;
  input  [1:0]  upstream_byteenable;
  input         upstream_debugaccess;
  input  [3:0]  upstream_nativeaddress;
  input         upstream_read;
  input         upstream_write;
  input  [15:0] upstream_writedata;

  reg  [4:0]  registered_upstream_address;
  reg  [1:0]  transactions_remaining;
  reg  [15:0] upstream_readdata;
  reg         upstream_readdatavalid;

  wire [4:0]  current_upstream_address;
  wire        sync_nativeaddress;

  assign sync_nativeaddress = |upstream_nativeaddress;

  always @(posedge clk or negedge reset_n) begin
    if (reset_n == 0)
      registered_upstream_address <= 0;
    else if (~|transactions_remaining)
      registered_upstream_address <= upstream_address;
  end

  assign current_upstream_address = ~|transactions_remaining ? upstream_address : registered_upstream_address;

  always @(posedge clk or negedge reset_n) begin
    if (reset_n == 0)
      transactions_remaining <= 0;
    else 
      transactions_remaining <= (upstream_read & ~upstream_waitrequest) ? 
                                (upstream_burstcount - 1) : 
                                (downstream_read & ~downstream_waitrequest & (|transactions_remaining)) ? 
                                (transactions_remaining - downstream_burstcount) : 
                                transactions_remaining;
  end

  assign downstream_burstcount = 1;
  assign downstream_arbitrationshare = upstream_burstcount;
  assign downstream_address = current_upstream_address;
  assign downstream_nativeaddress = upstream_nativeaddress;
  assign downstream_read = upstream_read | (|transactions_remaining);

  always @(posedge clk or negedge reset_n) begin
    if (reset_n == 0)
      upstream_readdatavalid <= 0;
    else 
      upstream_readdatavalid <= downstream_readdatavalid;
  end

  always @(posedge clk or negedge reset_n) begin
    if (reset_n == 0)
      upstream_readdata <= 0;
    else 
      upstream_readdata <= downstream_readdata;
  end

  assign downstream_write = upstream_write & ~downstream_read;
  assign downstream_byteenable = upstream_byteenable;
  assign downstream_writedata = upstream_writedata;
  assign upstream_waitrequest = downstream_waitrequest | (|transactions_remaining);
  assign downstream_debugaccess = upstream_debugaccess;

endmodule