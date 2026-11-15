module rtlpp_05126 (
                         address,
                         chipselect,
                         clk,
                         reset_n,
                         write_n,
                         writedata,
                         out_port,
                         readdata
                      );

  output  [10:0] out_port;
  output  [31:0] readdata;
  input   [1:0] address;
  input         chipselect;
  input         clk;
  input         reset_n;
  input         write_n;
  input   [31:0] writedata;

  reg     [10:0] data_out;
  wire    [10:0] read_mux_out;

  assign read_mux_out = (address == 2'b00) ? data_out : 11'b0;

  always @(posedge clk or negedge reset_n) begin
    if (reset_n == 1'b0)
      data_out <= 11'b0;
    else if (chipselect && ~write_n && (address == 2'b00))
      data_out <= writedata[10:0];
  end

  assign readdata = {21'b0, read_mux_out};
  assign out_port = data_out;

endmodule