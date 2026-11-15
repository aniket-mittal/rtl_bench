module origen_042408 #(parameter n = 3) (
    input wire clk,
    input wire rst,
    input wire [n-1:0] pcount,
    output reg Empty_F,
    output reg Full_F
);

reg rst_flag;

always @(posedge clk) begin
    rst_flag <= rst;
end

always @(*) begin
    Empty_F = rst_flag || (pcount == 0);
    Full_F = !rst_flag && (pcount == {n{1'b1}});
end

endmodule

