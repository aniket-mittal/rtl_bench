module origen_190648(
    input wire [2:0] a,
    input wire [2:0] b,
    input wire S,
    output reg G,
    output reg E,
    output reg L
);

always @(*) begin
    if (S) begin
        if (a > b) begin
            G = 1'b1;
            E = 1'b0;
            L = 1'b0;
        end else if (a < b) begin
            G = 1'b0;
            E = 1'b0;
            L = 1'b1;
        end else begin
            G = 1'b0;
            E = 1'b1;
            L = 1'b0;
        end
    end else begin
        if (a[2] == 1'b0 && b[2] == 1'b1) begin
            G = 1'b1;
            E = 1'b0;
            L = 1'b0;
        end else if (a[2] == 1'b1 && b[2] == 1'b0) begin
            G = 1'b0;
            E = 1'b0;
            L = 1'b1;
        end else begin
            if (a > b) begin
                G = 1'b1;
                E = 1'b0;
                L = 1'b0;
            end else if (a < b) begin
                G = 1'b0;
                E = 1'b0;
                L = 1'b1;
            end else begin
                G = 1'b0;
                E = 1'b1;
                L = 1'b0;
            end
        end
    end
end

endmodule