module rtlpp_01375 (
    address,
    chipselect,
    clk,
    reset_n,
    write_n,
    writedata,
    out_port,
    readdata
);

  output wire out_port;
  output wire [31:0] readdata;
  input wire [1:0] address;
  input wire chipselect;
  input wire clk;
  input wire reset_n;
  input wire write_n;
  input wire [31:0] writedata;

  reg data_out;

  wire read_mux_out;
  wire clk_en = 1;

  assign read_mux_out = (address == 2'b00) ? data_out : 1'b0;

  always @(posedge clk or negedge reset_n)
  begin
    if (!reset_n)
      data_out <= 1'b0;
    else if (chipselect && ~write_n && (address == 2'b00))
      data_out <= writedata[0];
  end

  assign readdata = {31'b0, read_mux_out};
  assign out_port = data_out;

endmodule