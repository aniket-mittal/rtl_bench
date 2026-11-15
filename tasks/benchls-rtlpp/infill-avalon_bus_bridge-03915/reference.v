module rtlpp_03915 (
                 
                  clk,
                  downstream_readdata,
                  downstream_readdatavalid,
                  downstream_waitrequest,
                  reset_n,
                  upstream_address,
                  upstream_byteenable,
                  upstream_debugaccess,
                  upstream_nativeaddress,
                  upstream_read,
                  upstream_write,
                  upstream_writedata,

                 
                  reg_downstream_address,
                  reg_downstream_arbitrationshare,
                  reg_downstream_burstcount,
                  reg_downstream_byteenable,
                  reg_downstream_debugaccess,
                  reg_downstream_nativeaddress,
                  reg_downstream_read,
                  reg_downstream_write,
                  reg_downstream_writedata,
                  upstream_readdata,
                  upstream_readdatavalid,
                  upstream_waitrequest
               )
;

  output reg [15:0] reg_downstream_address;
  output reg [3:0] reg_downstream_arbitrationshare;
  output reg       reg_downstream_burstcount;
  output reg [3:0] reg_downstream_byteenable;
  output reg       reg_downstream_debugaccess;
  output reg [15:0] reg_downstream_nativeaddress;
  output reg       reg_downstream_read;
  output reg       reg_downstream_write;
  output reg [31:0] reg_downstream_writedata;
  output reg [31:0] upstream_readdata;
  output reg       upstream_readdatavalid;
  output           upstream_waitrequest;
  input            clk;
  input  [31:0]    downstream_readdata;
  input            downstream_readdatavalid;
  input            downstream_waitrequest;
  input            reset_n;
  input  [17:0]    upstream_address;
  input  [3:0]     upstream_byteenable;
  input            upstream_debugaccess;
  input  [15:0]    upstream_nativeaddress;
  input            upstream_read;
  input            upstream_write;
  input  [31:0]    upstream_writedata;

  wire    [17:0] current_upstream_address;
  wire    [15:0] downstream_address;
  wire    [3:0]  downstream_arbitrationshare;
  wire           downstream_burstcount;
  wire    [3:0]  downstream_byteenable;
  wire           downstream_debugaccess;
  wire    [15:0] downstream_nativeaddress;
  wire           downstream_read;
  wire           downstream_write;
  wire    [31:0] downstream_writedata;
  reg     [17:0] registered_upstream_address;
  wire           sync_nativeaddress;
  reg     [2:0]  transactions_remaining;

  assign sync_nativeaddress = |upstream_nativeaddress;
  
  
  always @(posedge clk or negedge reset_n)
    begin
      if (!reset_n)
          registered_upstream_address <= 0;
      else if (~|transactions_remaining)
          registered_upstream_address <= upstream_address;
    end

  assign current_upstream_address = ~|transactions_remaining ? upstream_address : registered_upstream_address;

  always @(posedge clk or negedge reset_n)
    begin
      if (!reset_n)
          transactions_remaining <= 0;
      else
          transactions_remaining <= (upstream_read & ~upstream_waitrequest) ? (4'h8 - 1) : 
                                     (downstream_read & ~downstream_waitrequest & (|transactions_remaining)) ? 
                                     (transactions_remaining - downstream_burstcount) : transactions_remaining;
    end

  assign downstream_burstcount = 1;
  assign downstream_arbitrationshare = 4'h8;
  assign downstream_address = current_upstream_address;
  assign downstream_nativeaddress = upstream_nativeaddress;
  assign downstream_read = upstream_read | (|transactions_remaining);

  always @(posedge clk or negedge reset_n)
    begin
      if (!reset_n)
          upstream_readdatavalid <= 0;
      else
          upstream_readdatavalid <= downstream_readdatavalid;
    end

  always @(posedge clk or negedge reset_n)
    begin
      if (!reset_n)
          upstream_readdata <= 0;
      else
          upstream_readdata <= downstream_readdata;
    end

  assign downstream_write = upstream_write & !downstream_read;
  assign downstream_byteenable = upstream_byteenable;
  assign downstream_writedata = upstream_writedata;
  assign upstream_waitrequest = downstream_waitrequest | (|transactions_remaining);
  assign downstream_debugaccess = upstream_debugaccess;

  always @(posedge clk or negedge reset_n)
    begin
      if (!reset_n)
          reg_downstream_address <= 0;
      else if (~downstream_waitrequest)
          reg_downstream_address <= downstream_address;
    end

  always @(posedge clk or negedge reset_n)
    begin
      if (!reset_n)
          reg_downstream_arbitrationshare <= 0;
      else if (~downstream_waitrequest)
          reg_downstream_arbitrationshare <= downstream_arbitrationshare;
    end

  always @(posedge clk or negedge reset_n)
    begin
      if (!reset_n)
          reg_downstream_burstcount <= 0;
      else if (~downstream_waitrequest)
          reg_downstream_burstcount <= downstream_burstcount;
    end

  always @(posedge clk or negedge reset_n)
    begin
      if (!reset_n)
          reg_downstream_byteenable <= 0;
      else if (~downstream_waitrequest)
          reg_downstream_byteenable <= downstream_byteenable;
    end

  always @(posedge clk or negedge reset_n)
    begin
      if (!reset_n)
          reg_downstream_debugaccess <= 0;
      else if (~downstream_waitrequest)
          reg_downstream_debugaccess <= downstream_debugaccess;
    end

  always @(posedge clk or negedge reset_n)
    begin
      if (!reset_n)
          reg_downstream_nativeaddress <= 0;
      else if (~downstream_waitrequest)
          reg_downstream_nativeaddress <= downstream_nativeaddress;
    end

  always @(posedge clk or negedge reset_n)
    begin
      if (!reset_n)
          reg_downstream_read <= 0;
      else if (~downstream_waitrequest)
          reg_downstream_read <= downstream_read;
    end

  always @(posedge clk or negedge reset_n)
    begin
      if (!reset_n)
          reg_downstream_write <= 0;
      else if (~downstream_waitrequest)
          reg_downstream_write <= downstream_write;
    end

  always @(posedge clk or negedge reset_n)
    begin
      if (!reset_n)
          reg_downstream_writedata <= 0;
      else if (~downstream_waitrequest)
          reg_downstream_writedata <= downstream_writedata;
    end

endmodule