module sync_module (
    presyncdata, syncdata, arst_l, clk
);

input presyncdata;
input arst_l;
input clk;
output syncdata;

reg syncdata_reg;

always @(posedge clk or negedge arst_l) begin
    if (!arst_l)
        syncdata_reg <= 1'b0;
    else
        syncdata_reg <= presyncdata;
end

assign syncdata = syncdata_reg;

endmodule