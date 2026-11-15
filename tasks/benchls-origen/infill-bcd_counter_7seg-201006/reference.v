module origen_201006 (
    input clock,
    input rev,
    output [3:0] enable,
    output [7:0] sevenseg
);

reg [25:0] onesec;
reg [3:0] bcd;
reg clk;

initial begin
    onesec = 1;
    bcd = 0;
    clk = 0;
end

always @(posedge clock) begin
    if (onesec == 50_000_000) begin
        onesec = 1;
        clk = ~clk;
    end
    else begin
        onesec = onesec + 1;
    end
end

always @(posedge clk) begin
    if (rev) begin
        if (bcd == 4'b1001)
            bcd = 4'b0000;
        else
            bcd = bcd + 1;
    end
    else begin
        if (bcd == 4'b0000)
            bcd = 4'b1001;
        else
            bcd = bcd - 1;
    end
end

assign enable = 4'b0000;

assign sevenseg = (bcd == 4'b0000) ? 8'b11000000 :
                  (bcd == 4'b0001) ? 8'b11111001 :
                  (bcd == 4'b0010) ? 8'b10100100 :
                  (bcd == 4'b0011) ? 8'b10110000 :
                  (bcd == 4'b0100) ? 8'b10011001 :
                  (bcd == 4'b0101) ? 8'b10010010 :
                  (bcd == 4'b0110) ? 8'b10000010 :
                  (bcd == 4'b0111) ? 8'b11111000 :
                  (bcd == 4'b1000) ? 8'b10000000 :
                  (bcd == 4'b1001) ? 8'b10011000 :
                  8'b11000000;

endmodule