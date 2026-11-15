module rtlpp_05164 (
    input   [  1: 0] address,
    input            chipselect,
    input            clk,
    input            reset_n,
    input            write_n,
    input   [ 31: 0] writedata,
    output  [  5: 0] out_port,
    output  [ 31: 0] readdata
);

reg     [  5: 0] data_out;
wire    [  5: 0] read_mux_out;

assign read_mux_out = (address == 2'b00) ? data_out : 6'b0;

always @(posedge clk or negedge reset_n) begin
    if (~reset_n)
        data_out <= 6'b000001;
    else if (chipselect && ~write_n && (address == 2'b00))
        data_out <= writedata[5:0];
end

assign readdata = {26'b0, read_mux_out};
assign out_port = data_out;

endmodule