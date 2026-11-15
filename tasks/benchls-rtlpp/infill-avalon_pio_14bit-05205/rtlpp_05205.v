module rtlpp_05205 (
    input  [1:0]   address,
    input          chipselect,
    input          clk,
    input          reset_n,
    input          write_n,
    input  [31:0]  writedata,
    output [13:0]  out_port,
    output [31:0]  readdata
);

reg [13:0] data_out;

assign out_port = data_out;
assign readdata = {18'b0, data_out};

[MASKED]

endmodule