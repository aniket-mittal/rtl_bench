module origen_196354(
    input clk,
    input rstn,
    input en,
    input dir,
    input [2:0] speed,
    output reg [3:0] out
);

reg [3:0] motor;
reg [5:0] cnt;
reg [1:0] state, nextstate;
wire clk1;

always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
        cnt <= 0;
        state <= 0;
    end
    else if (en) begin
        cnt <= (cnt == (5 * (speed + 1) - 1)) ? 0 : cnt + 1;
        state <= nextstate;
    end
end

assign clk1 = (cnt == 0);

[MASKED]

always @(posedge clk1 or negedge rstn) begin
    if (!rstn)
        out <= 0;
    else if (en)
        out <= motor;
end

endmodule