module rtlpp_09918 (
    address,
    chipselect,
    clk,
    reset_n,
    write_n,
    writedata,
    out_port,
    readdata
);

output reg out_port;
output reg readdata;
input [1:0] address;
input chipselect;
input clk;
input reset_n;
input write_n;
input writedata;

reg data_out;
wire clk_en;
assign clk_en = 1;

always @(posedge clk or negedge reset_n) begin
    if (reset_n == 0)
        data_out <= 0;
    else if (chipselect && ~write_n && (address == 0))
        data_out <= writedata;
end

always @(posedge clk or negedge reset_n) begin
    if (reset_n == 0) begin
        readdata <= 0;
        out_port <= 0;
    end
    else begin
        readdata <= (address == 0) ? data_out : 0;
        out_port <= data_out;
    end
end

endmodule