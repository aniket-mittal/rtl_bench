module origen_192091(
    input clk,
    input run,
    input [31:0] x,
    input [31:0] y,
    output reg stall,
    output [31:0] z
);

reg [4:0] S;
reg [31:0] P;

wire sx, sy;
wire [7:0] ex, ey;
wire [22:0] mx, my;

assign sx = x[31];
assign sy = y[31];
assign ex = x[30:23];
assign ey = y[30:23];
assign mx = x[22:0];
assign my = y[22:0];

wire [8:0] e0;
assign e0 = ex + ey;

wire [8:0] e1;
assign e1 = e0 - 8'd127 + P[31];

wire [47:0] w0, w1;
assign w0 = {1'b1, mx} * {1'b1, my};
assign w1 = {1'b0, w0[47:24]};

always @(posedge clk) begin
    if (run) begin
        if (S != 5'd25) begin
            S <= S + 1;
            P <= {P[30:0], w1[23]};
            stall <= 1'b1;
        end else begin
            stall <= 1'b0;
        end
    end else begin
        S <= 5'b0;
        P <= 32'b0;
        stall <= 1'b0;
    end
end

wire [31:0] z0;
assign z0 = {sx ^ sy, e1[7:0], P[30:8]};

assign z = (x == 32'b0 || y == 32'b0) ? 32'b0 :
           (e1[8]) ? (sx ^ sy ? 32'h80000000 : 32'h7fffffff) :
           (e1[7:0] == 8'b0) ? 32'b0 :
           z0;

endmodule