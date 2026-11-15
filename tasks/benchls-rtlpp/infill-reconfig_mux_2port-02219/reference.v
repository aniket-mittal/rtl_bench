module rtlpp_02219 (

  input           rcfg_clk,
  input           rcfg_reset_n,

  input           rcfg_in_read_0,
  input           rcfg_in_write_0,
  input   [ 9:0]  rcfg_in_address_0,
  input   [31:0]  rcfg_in_writedata_0,
  output  [31:0]  rcfg_in_readdata_0,
  output          rcfg_in_waitrequest_0,

  input           rcfg_in_read_1,
  input           rcfg_in_write_1,
  input   [ 9:0]  rcfg_in_address_1,
  input   [31:0]  rcfg_in_writedata_1,
  output  [31:0]  rcfg_in_readdata_1,
  output          rcfg_in_waitrequest_1,

  output          rcfg_out_read_0,
  output          rcfg_out_write_0,
  output  [ 9:0]  rcfg_out_address_0,
  output  [31:0]  rcfg_out_writedata_0,
  input   [31:0]  rcfg_out_readdata_0,
  input           rcfg_out_waitrequest_0,

  output          rcfg_out_read_1,
  output          rcfg_out_write_1,
  output  [ 9:0]  rcfg_out_address_1,
  output  [31:0]  rcfg_out_writedata_1,
  input   [31:0]  rcfg_out_readdata_1,
  input           rcfg_out_waitrequest_1
);

  reg     [ 1:0]  rcfg_select = 2'd0;
  reg             rcfg_read_int = 1'd0;
  reg             rcfg_write_int = 1'd0;
  reg     [ 9:0]  rcfg_address_int = 10'd0;
  reg     [31:0]  rcfg_writedata_int = 32'd0;
  reg     [31:0]  rcfg_readdata_int = 32'd0;
  reg             rcfg_waitrequest_int_0 = 1'd1;
  reg             rcfg_waitrequest_int_1 = 1'd1;

  wire    [31:0]  rcfg_readdata_s;
  wire            rcfg_waitrequest_s;

  assign rcfg_out_read_0 = rcfg_read_int;
  assign rcfg_out_write_0 = rcfg_write_int;
  assign rcfg_out_address_0 = rcfg_address_int;
  assign rcfg_out_writedata_0 = rcfg_writedata_int;
  assign rcfg_out_read_1 = rcfg_read_int;
  assign rcfg_out_write_1 = rcfg_write_int;
  assign rcfg_out_address_1 = rcfg_address_int;
  assign rcfg_out_writedata_1 = rcfg_writedata_int;
  assign rcfg_in_readdata_0 = rcfg_readdata_int;
  assign rcfg_in_readdata_1 = rcfg_readdata_int;
  assign rcfg_in_waitrequest_0 = rcfg_waitrequest_int_0;
  assign rcfg_in_waitrequest_1 = rcfg_waitrequest_int_1;

  assign rcfg_readdata_s = rcfg_out_readdata_1 & rcfg_out_readdata_0;
  assign rcfg_waitrequest_s = rcfg_out_waitrequest_1 & rcfg_out_waitrequest_0;

  always @(negedge rcfg_reset_n or posedge rcfg_clk) begin
    if (rcfg_reset_n == 1'b0) begin
      rcfg_select <= 2'd0;
      rcfg_read_int <= 1'd0;
      rcfg_write_int <= 1'd0;
      rcfg_address_int <= 10'd0;
      rcfg_writedata_int <= 32'd0;
      rcfg_readdata_int <= 32'd0;
      rcfg_waitrequest_int_0 <= 1'b1;
      rcfg_waitrequest_int_1 <= 1'b1;
    end else begin
      if (rcfg_select[1] == 1'b1) begin
        if (rcfg_waitrequest_s == 1'b0) begin
          rcfg_select <= 2'd0;
          rcfg_read_int <= 1'b0;
          rcfg_write_int <= 1'b0;
          rcfg_address_int <= 10'd0;
          rcfg_writedata_int <= 32'd0;
        end
        rcfg_readdata_int <= rcfg_readdata_s;
        rcfg_waitrequest_int_0 <= rcfg_waitrequest_s | rcfg_select[0];
        rcfg_waitrequest_int_1 <= rcfg_waitrequest_s | ~rcfg_select[0];
      end else if ((rcfg_in_read_0 == 1'b1) || (rcfg_in_write_0 == 1'b1)) begin
        rcfg_select <= 2'b10;
        rcfg_read_int <= rcfg_in_read_0;
        rcfg_write_int <= rcfg_in_write_0;
        rcfg_address_int <= rcfg_in_address_0;
        rcfg_writedata_int <= rcfg_in_writedata_0;
        rcfg_readdata_int <= 32'd0;
        rcfg_waitrequest_int_0 <= 1'b1;
        rcfg_waitrequest_int_1 <= 1'b1;
      end else if ((rcfg_in_read_1 == 1'b1) || (rcfg_in_write_1 == 1'b1)) begin
        rcfg_select <= 2'b11;
        rcfg_read_int <= rcfg_in_read_1;
        rcfg_write_int <= rcfg_in_write_1;
        rcfg_address_int <= rcfg_in_address_1;
        rcfg_writedata_int <= rcfg_in_writedata_1;
        rcfg_readdata_int <= 32'd0;
        rcfg_waitrequest_int_0 <= 1'b1;
        rcfg_waitrequest_int_1 <= 1'b1;
      end else begin
        rcfg_select <= 2'd0;
        rcfg_read_int <= 1'd0;
        rcfg_write_int <= 1'd0;
        rcfg_address_int <= 10'd0;
        rcfg_writedata_int <= 32'd0;
        rcfg_readdata_int <= 32'd0;
        rcfg_waitrequest_int_0 <= 1'b1;
        rcfg_waitrequest_int_1 <= 1'b1;
      end
    end
  end

endmodule