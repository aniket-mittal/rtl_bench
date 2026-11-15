module origen_014029(
    input wire clk,
    input wire Reset,
    input wire CE,
    output reg [3:0] Q
);

reg [3:0] cnt;

always @(posedge clk) begin
    if (Reset) begin
        cnt <= 4'b0000;
    end else if (CE) begin
        if (cnt == 4'b1111) begin
            cnt <= 4'b0000;
        end else if (cnt == 4'b1110) begin
            cnt <= 4'b1111;
        end else if (cnt == 4'b1101) begin
            cnt <= 4'b1110;
        end else if (cnt == 4'b1100) begin
            cnt <= 4'b1101;
        end else if (cnt == 4'b1011) begin
            cnt <= 4'b1100;
        end else if (cnt == 4'b1010) begin
            cnt <= 4'b1011;
        end else if (cnt == 4'b1001) begin
            cnt <= 4'b1010;
        end else if (cnt == 4'b1000) begin
            cnt <= 4'b1001;
        end else if (cnt == 4'b0111) begin
            cnt <= 4'b1000;
        end else if (cnt == 4'b0110) begin
            cnt <= 4'b0111;
        end else if (cnt == 4'b0101) begin
            cnt <= 4'b0110;
        end else if (cnt == 4'b0100) begin
            cnt <= 4'b0101;
        end else if (cnt == 4'b0011) begin
            cnt <= 4'b0100;
        end else if (cnt == 4'b0010) begin
            cnt <= 4'b0011;
        end else if (cnt == 4'b0001) begin
            cnt <= 4'b0010;
        end else if (cnt == 4'b0000) begin
            cnt <= 4'b0001;
        end
    end
end

always @(*) begin
    Q = cnt;
end

endmodule