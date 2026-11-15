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

always @(posedge clk or negedge reset_n)
begin
    if (reset_n == 0)
        data_out <= 0;
    else if (chipselect && ~write_n && (address == 0))
        data_out <= writedata[9:0];
end

assign readdata = {{22'b0}, read_mux_out};
assign out_port = data_out;

endmodule