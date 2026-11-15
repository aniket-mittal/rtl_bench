module origen_026124(
    input [3:0] X,
    input [3:0] Y,
    output reg XlessthanY,
    output reg XequalY,
    output reg XgreaterthanY
);

always @(X or Y) begin
    if (X > Y) begin
        XgreaterthanY = 1'b1;
        XequalY = 1'b0;
        XlessthanY = 1'b0;
    end
    else if (X == Y) begin
        XgreaterthanY = 1'b0;
        XequalY = 1'b1;
        XlessthanY = 1'b0;
    end
    else begin
        XgreaterthanY = 1'b0;
        XequalY = 1'b0;
        XlessthanY = 1'b1;
    end
end

endmodule

