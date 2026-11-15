module rtlpp_05129 (
    address,
    chipselect,
    clk,
    reset_n,
    write_n,
    writedata,
    out_port,
    readdata
);

  output [9:0] out_port;
  output [31:0] readdata;
  input  [1:0] address;
  input        chipselect;
  input        clk;
  input        reset_n;
  input        write_n;
  input  [31:0] writedata;

  reg [9:0] data_out;

  wire [9:0] read_mux_out;

  assign read_mux_out = {10{address == 2'b00}} & data_out;

  always @(posedge clk or negedge reset_n) begin
    if (~reset_n)
      data_out <= 10'b0;
    else if (chipselect && ~write_n && (address == 2'b00))
      data_out <= writedata[9:0];
  end

  assign readdata = {22'b0, read_mux_out};
  assign out_port = data_out;

endmodule