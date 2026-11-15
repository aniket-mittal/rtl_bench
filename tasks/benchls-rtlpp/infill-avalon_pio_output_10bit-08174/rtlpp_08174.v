module rtlpp_08174 (
    input  [  1: 0] address,
    input           chipselect,
    input           clk,
    input           reset_n,
    input           write_n,
    input  [ 31: 0] writedata,
    output [  9: 0] out_port,
    output [ 31: 0] readdata
);

reg   [  9: 0] data_out;
wire  [  9: 0] read_mux_out;

assign read_mux_out = (address == 0) ? data_out : 10'b0;

[MASKED]

assign readdata = {{22'b0}, read_mux_out};
assign out_port = data_out;

endmodule