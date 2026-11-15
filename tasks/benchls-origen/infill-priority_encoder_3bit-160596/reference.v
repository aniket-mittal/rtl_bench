module origen_160596(
    input [7:0] D,
    output reg X,
    output reg Y,
    output reg Z
);

always @(D) begin
    if (D[0] == 1'b1) begin
        X = 1'b1;
        Y = 1'b1;
        Z = 1'b1;
    end
    else if (D[1] == 1'b1) begin
        X = 1'b1;
        Y = 1'b1;
        Z = 1'b0;
    end
    else if (D[2] == 1'b1) begin
        X = 1'b1;
        Y = 1'b0;
        Z = 1'b1;
    end
    else if (D[3] == 1'b1) begin
        X = 1'b1;
        Y = 1'b0;
        Z = 1'b0;
    end
    else if (D[4] == 1'b1) begin
        X = 1'b0;
        Y = 1'b1;
        Z = 1'b1;
    end
    else if (D[5] == 1'b1) begin
        X = 1'b0;
        Y = 1'b1;
        Z = 1'b0;
    end
    else if (D[6] == 1'b1) begin
        X = 1'b0;
        Y = 1'b0;
        Z = 1'b1;
    end
    else begin
        X = 1'b0;
        Y = 1'b0;
        Z = 1'b0;
    end
end

endmodule