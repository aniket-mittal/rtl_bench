module sync_module (
    presyncdata, syncdata, arst_l, clk
);

input presyncdata;
input arst_l;
input clk;
output syncdata;

reg syncdata_reg;

[MASKED]

assign syncdata = syncdata_reg;

endmodule