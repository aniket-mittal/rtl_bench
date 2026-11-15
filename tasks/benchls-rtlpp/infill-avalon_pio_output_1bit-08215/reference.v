module rtlpp_08215 (
    address,
    chipselect,
    clk,
    reset_n,
    write_n,
    writedata,
    out_port,
    readdata
);

  output reg        out_port;
  output reg [31:0] readdata;
  input      [ 1:0] address;
  input             chipselect;
  input             clk;
  input             reset_n;
  input             write_n;
  input      [31:0] writedata;

  reg               data_out;
  
  always @(posedge clk or negedge reset_n) begin
    if (reset_n == 0)
        data_out <= 0;
    else if (chipselect && ~write_n && (address == 0))
        data_out <= writedata[0];
  end

  always @* begin
    if (address == 0)
        readdata = {31'b0, data_out};
    else
        readdata = 32'b0;
  end

  always @* begin
    out_port = data_out;
  end

endmodule