module origen_121404
(
    input [4:0] address_0,
    input [3:0] contrib_0,
    output [3:0] rdata_0,
    output [3:0] mixed
);

    wire [127:0] data_0 = {mixed, 80'h0000000000000000000, 44'h000000000000};
    reg [3:0] result_0;

    assign mixed = contrib_0 ^ 4'h0;
    assign rdata_0 = result_0;

    [MASKED]

endmodule