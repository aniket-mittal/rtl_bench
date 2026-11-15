module origen_017210 (
    input wire clk,
    input wire rst,
    input wire bt1,
    input wire amm_rddatavalid,
    input wire [19:0] cnt,
    input wire [319:0] amm_rddata,
    output reg [319:0] amm_wrdata,
    output reg check
);

parameter burstlength = 144;

reg [319:0] wr0, wr1, wr2, wr3, wr4, wr5, wr6, wr7;
reg [319:0] rd0, rd1, rd2, rd3, rd4, rd5, rd6, rd7;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        rd0 <= 320'b0; rd1 <= 320'b0; rd2 <= 320'b0; rd3 <= 320'b0;
        rd4 <= 320'b0; rd5 <= 320'b0; rd6 <= 320'b0; rd7 <= 320'b0;
        wr0 <= 320'h55555555555555555555555555555555555555555555555555555555555555555555555555555555;
        wr1 <= 320'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
        wr2 <= 320'h33333333333333333333333333333333333333333333333333333333333333333333333333333333;
        wr3 <= 320'hCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC;
        wr4 <= 320'h0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F;
        wr5 <= 320'hF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0;
        wr6 <= 320'h00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF;
        wr7 <= 320'hFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00;
        check <= 1'b0;
    end else begin
        if (amm_rddatavalid) begin
            rd0 <= rd1;
            rd1 <= rd2;
            rd2 <= rd3;
            rd3 <= rd4;
            rd4 <= rd5;
            rd5 <= rd6;
            rd6 <= rd7;
            rd7 <= amm_rddata;
        end
        check <= (rd0 == wr0) && (rd1 == wr1) && (rd2 == wr2) && (rd3 == wr3) &&
                 (rd4 == wr4) && (rd5 == wr5) && (rd6 == wr6) && (rd7 == wr7);
    end
end

always @(negedge clk) begin
    if (bt1)
        amm_wrdata <= amm_wrdata + 100;
    else
        amm_wrdata <= 320'b0;
end

endmodule