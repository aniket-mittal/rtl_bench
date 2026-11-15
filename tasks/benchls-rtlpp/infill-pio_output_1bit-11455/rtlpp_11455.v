module rtlpp_11455 (
    input  [1:0] address,
    input        chipselect,
    input        clk,
    input        reset_n,
    input        write_n,
    input        writedata,
    output       out_port,
    output       readdata
);

    reg data_out;
    
    [MASKED]

    assign readdata = (address == 0) ? data_out : 0;
    assign out_port = data_out;

endmodule