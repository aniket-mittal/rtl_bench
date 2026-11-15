module origen_183408(
    input En,
    input [2:0] S,
    input [7:0] D,
    output reg Y,
    output reg Yn
);

always @(*) begin
    if (En) begin
        Y = 1'b0;
        Yn = 1'b1;
    end
    else begin
        case (S)
            3'b000: begin
                Y = D[0];
                Yn = ~D[0];
            end
            3'b001: begin
                Y = D[1];
                Yn = ~D[1];
            end
            3'b010: begin
                Y = D[2];
                Yn = ~D[2];
            end
            3'b011: begin
                Y = D[3];
                Yn = ~D[3];
            end
            3'b100: begin
                Y = D[4];
                Yn = ~D[4];
            end
            3'b101: begin
                Y = D[5];
                Yn = ~D[5];
            end
            3'b110: begin
                Y = D[6];
                Yn = ~D[6];
            end
            3'b111: begin
                Y = D[7];
                Yn = ~D[7];
            end
        endcase
    end
end

endmodule